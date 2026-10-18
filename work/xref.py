import sys
from capstone import *
from capstone.x86 import *
import struct as _s

PATH = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(PATH, 'rb').read()
def u16(o): return _s.unpack_from('<H', DATA, o)[0]
def u32(o): return _s.unpack_from('<I', DATA, o)[0]
def u64(o): return _s.unpack_from('<Q', DATA, o)[0]
e = u32(0x3C); coff = e + 4
nsec = u16(coff + 2); optsz = u16(coff + 16); opt = coff + 20
magic = u16(opt); ib = u64(opt + 24) if magic == 0x20B else u32(opt + 28)
SECS = []
s = opt + optsz
for i in range(nsec):
    x = s + i * 40
    name = DATA[x:x + 8].rstrip(b'\0').decode('latin1')
    SECS.append((name, ib + u32(x + 12), u32(x + 8), u32(x + 20), u32(x + 16)))

def va2raw(va):
    for name, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz): return raw + (va - base)
    return None

targets = {}
for a in sys.argv[1:]:
    targets[int(a, 16)] = []

text = [s for s in SECS if s[0] == '.text'][0]
name, base, vsz, raw, rsz = text
buf = DATA[raw:raw + rsz]
md = Cs(CS_ARCH_X86, CS_MODE_64); md.detail = True
off = 0
while off < len(buf):
    for ins in md.disasm(buf[off:off + 15], base + off):
        for op in ins.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                tgt = ins.address + ins.size + op.mem.disp
                if tgt in targets:
                    targets[tgt].append((ins.address, ins.mnemonic + ' ' + ins.op_str))
        off += ins.size
        break
    else:
        off += 1

for t, refs in targets.items():
    print(f'== target {t:#x} : {len(refs)} refs')
    for va, txt in refs:
        print(f'   {va:012X}  {txt}')
