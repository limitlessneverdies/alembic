import sys, struct
from capstone import *
from capstone.x86 import *

PE = r"C:\Users\limit\Desktop\alembic.exe"
buf = open(PE,'rb').read()
peoff = struct.unpack_from('<I', buf, 0x3C)[0]
nsec  = struct.unpack_from('<H', buf, peoff+6)[0]
optsz = struct.unpack_from('<H', buf, peoff+20)[0]
secs=[]; so = peoff+24+optsz
for i in range(nsec):
    e = so+i*40
    name = buf[e:e+8].rstrip(b'\0').decode()
    vsz, va, rsz, raw = struct.unpack_from('<IIII', buf, e+8)
    secs.append((name, va, vsz, raw, rsz))
text = [s for s in secs if s[0]=='.text'][0]
name, tva, tvsz, traw, trsz = text
code = buf[traw:traw+max(tvsz,trsz)]
md = Cs(CS_ARCH_X86, CS_MODE_64); md.detail=True
insns = list(md.disasm(code, tva))
print("insns", len(insns))

# locate how 0x50 multiplication is done: count imm 0x50 across all insn forms
from collections import Counter
c = Counter()
for ins in insns:
    for o in ins.operands:
        if o.type==X86_OP_IMM and o.imm in (0x50, 0xa0, 0x28):
            c[(ins.id, o.imm)] += 1
for k,v in c.most_common(20):
    print("IDIOM", md.insn_name(k[0]), hex(k[1]), v)
