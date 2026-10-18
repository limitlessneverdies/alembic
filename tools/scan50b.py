import sys, struct
from capstone import *
from capstone.x86 import *
from collections import Counter, defaultdict

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

def regname(o):
    return md.reg_name(o.reg if hasattr(o,'reg') else o)

# pattern: lea r,[r+r*4]  (x5)  then shl r,4 (x16)
x5 = {}
for i,ins in enumerate(insns):
    if ins.id==X86_INS_LEA and len(ins.operands)==2 and ins.operands[0].type==X86_OP_REG:
        m=ins.operands[1]
        if m.type==X86_OP_MEM and m.mem.index!=0 and m.mem.scale==4 and m.mem.disp==0 and m.mem.segment==0:
            dst=ins.operands[0].reg
            if m.mem.base==dst and m.mem.index==dst:
                x5[i]=regname(dst)
print("x5 lea count:", len(x5))
c=Counter()
pairs=0
for i,r in x5.items():
    for k in range(i+1, min(i+4, len(insns))):
        j=insns[k]
        if j.id==X86_INS_SHL and len(j.operands)==2 and j.operands[0].type==X86_OP_REG and md.reg_name(j.operands[0].reg)==r and j.operands[1].type==X86_OP_IMM and j.operands[1].imm==4:
            pairs+=1
            c[(i,k)]=r
            break
print("x5 then shl4 pairs:", pairs)

FIELD = {0x00:'+00',0x08:'+08',0x10:'+10',0x14:'+14',0x18:'+18',0x1c:'+1c',0x20:'+20',0x24:'+24',0x28:'+28',0x2c:'+2c',
         0x30:'+30mass',0x34:'+34',0x38:'+38',0x3c:'+3C',0x40:'+40',0x44:'+44',0x46:'+46Z',0x47:'+47row',0x48:'+48grp',
         0x49:'+49',0x4a:'+4A',0x4b:'+4B',0x4c:'+4C',0x4d:'+4D',0x4e:'+4E',0x4f:'+4F'}
out=defaultdict(list)
for i,k in c.items():
    src=insns[i]
    for j in range(i, min(k+40, len(insns))):
        ins=insns[j]
        for o in ins.operands:
            if o.type==X86_OP_MEM and o.mem.disp in FIELD and o.mem.index==0 and o.mem.base!=0:
                if md.reg_name(o.mem.base)==c[(i,k)]:
                    out[(k-i)].append((ins.address, ins.mnemonic+' '+ins.op_str, FIELD[o.mem.disp], src.address))
print("scaled-field accesses:", sum(len(v) for v in out.values()))
for key in sorted(out):
    for a,txt,fld,src in out[key]:
        print(f"d{key:2d} 0x{a:x} {fld:8s} {txt}")
