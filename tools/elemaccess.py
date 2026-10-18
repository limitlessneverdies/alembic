import struct, sys, bisect
from capstone import *
from capstone.x86 import *

PATH = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(PATH, 'rb').read()
IDX = r'C:\Users\limit\rea-tools\func-index.txt'

def u16(o): return struct.unpack_from('<H', DATA, o)[0]
def u32(o): return struct.unpack_from('<I', DATA, o)[0]
def u64(o): return struct.unpack_from('<Q', DATA, o)[0]

def sections():
    e = u32(0x3C); coff = e+4; nsec = u16(coff+2); optsz = u16(coff+16); opt = coff+20
    magic = u16(opt); ib = u64(opt+24) if magic == 0x20B else u32(opt+28)
    out = []; sec = opt+optsz
    for i in range(nsec):
        s = sec + i*40
        nm = DATA[s:s+8].rstrip(b'\0').decode('latin1')
        out.append((nm, ib+u32(s+12), u32(s+8), u32(s+20), u32(s+16)))
    return ib, out
IB, SECS = sections()
def va2raw(va):
    for nm, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz): return raw + (va-base)
def getbytes(va, n):
    o = va2raw(va)
    return DATA[o:o+n] if o is not None else None
def rd(va, n):
    o = va2raw(va); return DATA[o:o+n]

# function index sorted by VA
ents = []
for line in open(IDX):
    p = line.split()
    if len(p) >= 3 and p[0].startswith('L') and p[2].startswith('@'):
        ents.append((int(p[2][1:], 16), p[1]))
ents.sort()
vas = [e[0] for e in ents]
def func_end(va):
    i = bisect.bisect_right(vas, va)
    return ents[i][0] if i < len(ents) else va + 0x10000

ELEM_BASE = 0x14034F350
TABLE_END = 0x14034F350 + 0x1CC0   # 92*0x50 = 0x1CC0

md = Cs(CS_ARCH_X86, CS_MODE_64); md.detail = True

def is_elem_lea(m):
    # lea reg, [rip + d] -> element table region?
    if m.mnemonic != 'lea' or len(m.operands) != 2: return None
    d, s = m.operands
    if d.type != X86_OP_REG: return None
    if s.type == X86_OP_MEM and s.mem.base == X86_REG_RIP:
        tgt = m.address + m.size + s.mem.disp
        return (d.reg, tgt)
    return None

def run(va, end):
    off = 0
    taint = {}   # reg -> (kind, 'base', addend)  kind: 'elem' (points into elem table), 'other'
    idxreg = {}  # reg -> name of index variable
    out = []
    while va + off < end:
        b = getbytes(va+off, 16)
        if not b: break
        n = 0
        for m in md.disasm(b, va+off):
            n = m.size
            # lea tracking
            l = is_elem_lea(m)
            if l:
                r, tgt = l
                if ELEM_BASE <= tgt < TABLE_END:
                    taint[r] = ('elem', tgt - ELEM_BASE)
                else:
                    taint[r] = ('other', tgt)
            else:
                dst = None
                if m.mnemonic == 'lea' and len(m.operands) == 2 and m.operands[0].type == X86_OP_REG and m.operands[1].type == X86_OP_MEM:
                    s = m.operands[1]
                    if s.mem.base in taint and s.mem.index == 0:
                        taint[m.operands[0].reg] = (taint[s.mem.base][0], taint[s.mem.base][1] + s.mem.disp)
                    else:
                        taint.pop(m.operands[0].reg, None)
                elif m.mnemonic.startswith('mov') and len(m.operands) == 2 and m.operands[0].type == X86_OP_REG and m.operands[1].type == X86_OP_REG:
                    if m.operands[1].reg in taint: taint[m.operands[0].reg] = taint[m.operands[1].reg]
                    else: taint.pop(m.operands[0].reg, None)
                else:
                    # any write to a register kills its taint (approx: for mov/arith with reg/mem/imm source)
                    if len(m.operands) >= 1 and m.operands[0].type == X86_OP_REG and m.mnemonic != 'cmp' and m.mnemonic != 'test' and not m.mnemonic.startswith('j'):
                        if not (m.mnemonic == 'lea'):
                            taint.pop(m.operands[0].reg, None)
            # memory operand check
            for op in m.operands:
                if op.type == X86_OP_MEM and op.mem.base in taint and taint[op.mem.base][0] == 'elem':
                    offbase = taint[op.mem.base][1] + op.mem.disp
                    idxs = ''
                    if op.mem.index:
                        idxs = f' + {md.reg_name(op.mem.index)}*{op.mem.scale}'
                    tag = ''
                    # field annotation
                    FOFF = {0:'sym.ptr',8:'sym.len',0x10:'name.ptr',0x18:'name.len',0x20:'desc.ptr',0x28:'desc.len',
                            0x30:'mass',0x34:'density',0x38:'eneg',0x3c:'u3C',0x40:'melt',0x42:'boil',0x44:'u44',
                            0x46:'Z',0x47:'period',0x48:'group',0x49:'valence',0x4a:'u4A',0x4b:'u4B',0x4c:'u4C',
                            0x4d:'u4D',0x4e:'u4E'}
                    if op.mem.index and op.mem.scale == 0x50:
                        if op.mem.disp in FOFF: tag = FOFF[op.mem.disp]
                    else:
                        if offbase in FOFF: tag = FOFF[offbase]
                    out.append(f'{m.address:012X}  {m.mnemonic:<8} {m.op_str:<44} ; ELEM[{(str(offbase) if op.mem.index else hex(offbase))}{idxs}] {tag}  (size {op.size})')
                    break
            break
        off += n if n else 1
    return out

if __name__ == '__main__':
    va = int(sys.argv[1], 16)
    end = int(sys.argv[2], 16) if len(sys.argv) > 2 else func_end(va)
    print(f'; window 0x{va:X} .. 0x{end:X}')
    for l in run(va, end): print(l)
