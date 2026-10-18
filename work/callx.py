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
ib = u64(opt + 24) if u16(opt) == 0x20B else u32(opt + 28)
SECS = []
s = opt + optsz
for i in range(nsec):
    x = s + i * 40
    SECS.append((DATA[x:x + 8].rstrip(b'\0').decode('latin1'), ib + u32(x + 12), u32(x + 8), u32(x + 20), u32(x + 16)))

# function index for naming
import bisect
ents = []
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    p = line.split()
    if len(p) >= 3 and p[0].startswith('L') and p[2].startswith('@'):
        try: ents.append((int(p[2][1:], 16), p[1], int(p[0][1:])))
        except ValueError: pass
ents.sort(); addrs = [x[0] for x in ents]
def funcof(va):
    i = bisect.bisect_right(addrs, va) - 1
    return ents[i] if i >= 0 else None

targets = {}
for a in sys.argv[1:]:
    targets[int(a, 16)] = []

text = [x for x in SECS if x[0] == '.text'][0]
name, base, vsz, raw, rsz = text
buf = DATA[raw:raw + rsz]
md = Cs(CS_ARCH_X86, CS_MODE_64); md.detail = True
off = 0
while off < len(buf):
    for ins in md.disasm(buf[off:off + 15], base + off):
        if ins.mnemonic in ('call', 'jmp') and ins.operands and ins.operands[0].type == X86_OP_IMM:
            t = ins.operands[0].imm
            if t in targets:
                targets[t].append((ins.address, ins.mnemonic))
        off += ins.size
        break
    else:
        off += 1

for t, refs in targets.items():
    print(f'== target {t:#x} : {len(refs)} call/jmp sites')
    for va, mn in refs:
        f = funcof(va)
        print(f'   {va:012X} {mn:5s} from {f[1] if f else "?"} @{f[0]:X}' if f else f'   {va:012X} {mn}')
