import sys, traceback
from capstone import *
from capstone.x86 import *

PATH = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(PATH, 'rb').read()
import struct
def u16(o): return struct.unpack_from('<H', DATA, o)[0]
def u32(o): return struct.unpack_from('<I', DATA, o)[0]
def u64(o): return struct.unpack_from('<Q', DATA, o)[0]
def sections():
    e_lfanew = u32(0x3C); coff = e_lfanew + 4
    nsec = u16(coff + 2); optsz = u16(coff + 16); opt = coff + 20
    magic = u16(opt); ib = u64(opt + 24) if magic == 0x20B else u32(opt + 28)
    out = []; sec = opt + optsz
    for i in range(nsec):
        s = sec + i * 40
        name = DATA[s:s + 8].rstrip(b'\0').decode('latin1')
        vsz = u32(s + 8); va = u32(s + 12); rsz = u32(s + 16); raw = u32(s + 20)
        out.append((name, ib + va, vsz, raw, rsz))
    return ib, out
IB, SECS = sections()
def va2raw(va):
    for name, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz): return raw + (va - base)
    return None
def getbytes(va, n):
    o = va2raw(va)
    return None if o is None else DATA[o:o+n]
md = Cs(CS_ARCH_X86, CS_MODE_64); md.detail = True

def fmt(m):
    ins = f'{m.address:012X}  {m.mnemonic:<7} {m.op_str}'
    ann = []
    for op in m.operands:
        if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
            tgt = m.address + m.size + op.mem.disp
            ann.append(f'[rip -> 0x{tgt:X}]')
            if 0x1402DF000 <= tgt < 0x140642000:
                raw = va2raw(tgt)
                if raw is not None:
                    s = DATA[raw:raw+60].split(b'\0')[0]
                    try:
                        txt = s.decode('utf-8')
                        if txt and all(32 <= ord(c) < 127 or c in '\n\t' for c in txt):
                            ann.append(f'str={txt!r}')
                    except Exception: pass
    return ins + ('   ; ' + ' '.join(ann) if ann else '')

if __name__ == '__main__':
    start = int(sys.argv[1], 16); nbytes = int(sys.argv[2], 0)
    outf = sys.argv[3] if len(sys.argv) > 3 else None
    f = open(outf, 'w', encoding='utf-8') if outf else sys.stdout
    off = 0; skipped = []
    while off < nbytes:
        va = start + off
        b = getbytes(va, 16)
        if not b: break
        got = False
        for ins in md.disasm(b, va):
            f.write(fmt(ins) + '\n')
            off += ins.size; got = True
            break
        if not got:
            skipped.append(va); off += 1
    if f is not sys.stdout: f.close()
    print('skipped', len(skipped), [hex(v) for v in skipped[:20]], file=sys.stderr)
