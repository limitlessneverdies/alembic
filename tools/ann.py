"""Annotated disassembler for alembic.exe ranges.

usage: python ann.py <startVA> <endVA> [outfile] [--kindmap]
Annotates rip-relative memory operands with f32/u32/pointer+string interpretation
and call targets with function names from func-index.txt.
"""
import struct, sys, json, os
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from capstone import *
from capstone.x86 import *

PATH = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(PATH, 'rb').read()

def u16(o): return struct.unpack_from('<H', DATA, o)[0]
def u32(o): return struct.unpack_from('<I', DATA, o)[0]
def u64(o): return struct.unpack_from('<Q', DATA, o)[0]
def f32(o): return struct.unpack_from('<f', DATA, o)[0]

def sections():
    e_lfanew = u32(0x3C); coff = e_lfanew + 4
    nsec = u16(coff + 2); optsz = u16(coff + 16); opt = coff + 20
    magic = u16(opt)
    ib = u64(opt + 24) if magic == 0x20B else u32(opt + 28)
    out = []; sec = opt + optsz
    for i in range(nsec):
        s = sec + i * 40
        name = DATA[s:s+8].rstrip(b'\0').decode('latin1')
        vsz = u32(s+8); va = u32(s+12); rsz = u32(s+16); raw = u32(s+20)
        out.append((name, ib+va, vsz, raw, rsz))
    return ib, out

IB, SECS = sections()
def va2raw(va):
    for name, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz):
            return raw + (va - base)
    return None
def in_image(va):
    return va2raw(va) is not None
def getbytes(va, n):
    o = va2raw(va)
    return None if o is None else DATA[o:o+n]

# kind -> symbol map from element kind table
KIND_SYM = {}
try:
    ELS = json.load(open(r'C:\Users\limit\rea-tools\elements92.json'))
    rawk = va2raw(0x14035D008)
    KINDS = DATA[rawk:rawk+92]
    for i, e in enumerate(ELS):
        KIND_SYM[KINDS[i]] = e['symbol']
except Exception as ex:
    ELS = []

KINDNAME = {
    0x8d: 'EMPTY/None', 0x92: '?0x92', 0x8e: '?0x8e', 0x8f: '?0x8f',
    0x90: '?0x90', 0x91: '?0x91', 0x93: '?0x93', 0x94: '?0x94',
}
def kindname(b):
    if b in KIND_SYM: return KIND_SYM[b]
    if b in KINDNAME: return KINDNAME[b]
    return None

# function index: addr -> name
FUNC = {}
try:
    for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
        p = line.split()
        if len(p) >= 3 and p[0].startswith('L') and p[2].startswith('@'):
            try: FUNC[int(p[2][1:], 16)] = p[1]
            except ValueError: pass
except Exception:
    pass

# start of containing function (for call annotation)
FSTARTS = sorted(FUNC.keys())
import bisect
def containing(va):
    i = bisect.bisect_right(FSTARTS, va) - 1
    if i < 0: return None
    return FUNC[FSTARTS[i]]

def desc_ptr(tgt):
    """describe data at tgt"""
    outs = []
    if not in_image(tgt): return outs
    # f32
    try:
        f = f32(va2raw(tgt))
        if f == f and abs(f) < 1e12 and (f == 0.0 or abs(f) > 1e-6):
            outs.append(f'f32={f:g}')
    except Exception: pass
    try:
        v = u32(va2raw(tgt)); outs.append(f'u32={v}(0x{v:X})')
    except Exception: pass
    # (ptr,len) string tuple
    if in_image(tgt + 15):
        try:
            p = u64(va2raw(tgt)); l = u64(va2raw(tgt) + 8)
            if in_image(p) and 0 < l < 200:
                s = cstr(p, l)
                if s is not None and len(s) >= l and all(32 <= ord(c) < 127 for c in s):
                    outs.append(f'str={s!r}')
        except Exception: pass
    return outs

def cstr(va, maxlen=200):
    o = va2raw(va)
    if o is None: return None
    b = DATA[o:o+maxlen]
    return b.decode('utf-8', 'replace')

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True

def fmt(m):
    ins = f'{m.address:012X}  {m.mnemonic:<7} {m.op_str}'
    ann = []
    for op in m.operands:
        if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
            tgt = m.address + m.size + op.mem.disp
            d = desc_ptr(tgt)
            ann.append(f'->0x{tgt:X}' + (' ' + ' '.join(d) if d else ''))
        if op.type == X86_OP_IMM and m.mnemonic in ('mov','cmp','and','or','xor','add','sub','imul','test'):
            v = op.imm & 0xffffffff
            if 0 <= v < 0x100:
                kn = kindname(v)
                if kn: ann.append(f'kind?={kn}')
    if m.mnemonic == 'call' and m.operands and m.operands[0].type == X86_OP_IMM:
        t = m.operands[0].imm
        nm = FUNC.get(t) or containing(t)
        if nm: ann.append(f'call {nm}')
    return ins + ('   ; ' + ' | '.join(ann) if ann else '')

def disasm(start_va, end_va, out=sys.stdout):
    off = 0
    while start_va + off < end_va:
        va = start_va + off
        b = getbytes(va, 16)
        if not b: break
        got = False
        for m in md.disasm(b, va):
            print(fmt(m), file=out)
            off += m.size; got = True
            break
        if not got:
            print(f'{va:012X}  .byte 0x{getbytes(va,1)[0]:02X}', file=out)
            off += 1

if __name__ == '__main__':
    a = int(sys.argv[1], 16); b = int(sys.argv[2], 16)
    if len(sys.argv) > 3 and sys.argv[3] not in ('-',):
        with open(sys.argv[3], 'w', encoding='utf-8') as fh:
            disasm(a, b, fh)
        print('wrote', sys.argv[3])
    else:
        disasm(a, b)
    if '--kindmap' in sys.argv:
        for k in sorted(KIND_SYM): print(f'kind {k:#04x} = {KIND_SYM[k]}')
