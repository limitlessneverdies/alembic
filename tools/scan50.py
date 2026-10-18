import sys, struct, re
from capstone import *
from capstone.x86 import *

PE = r"C:\Users\limit\Desktop\alembic.exe"
buf = open(PE,'rb').read()

# parse PE sections
peoff = struct.unpack_from('<I', buf, 0x3C)[0]
nsec  = struct.unpack_from('<H', buf, peoff+6)[0]
optsz = struct.unpack_from('<H', buf, peoff+20)[0]
imgb  = struct.unpack_from('<I', buf, peoff+52)[0]
secs=[]
so = peoff+24+optsz
for i in range(nsec):
    e = so+i*40
    name = buf[e:e+8].rstrip(b'\0').decode()
    vsz, va, rsz, raw = struct.unpack_from('<IIII', buf, e+8)
    secs.append((name, va, vsz, raw, rsz))

def va2raw(va):
    for n,va_,vsz,raw,rsz in secs:
        if va_ <= va < va_+max(vsz,rsz):
            return raw + (va-va_)
    return None
def raw2va(r):
    for n,va_,vsz,raw,rsz in secs:
        if raw <= r < raw+rsz:
            return va_ + (r-raw)
    return None

text = [s for s in secs if s[0]=='.text'][0]
name, tva, tvsz, traw, trsz = text
tlen = max(tvsz, trsz)
code = buf[traw:traw+tlen]
print(f".text VA 0x{tva:x} raw 0x{traw:x} size 0x{tlen:x}")

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True

FIELD_NAMES = {
 0x00:'+00 u64 a',0x08:'+08',0x10:'+10 mass?',0x14:'+14',0x18:'+18',0x30:'+30 f32 mass',
 0x34:'+34',0x38:'+38',0x3c:'+3C u32 decay?',0x40:'+40',0x44:'+44 u16 UNK',0x46:'+46 Z',
 0x47:'+47 row',0x48:'+48 group',0x49:'+49',0x4a:'+4A u16 low UNK/high cat',0x4b:'+4B CAT',
 0x4c:'+4C state',0x4d:'+4D defined',0x4e:'+4E UNK',0x4f:'+4F',
}
WATCH = set(FIELD_NAMES.keys())

# collect instructions
insns = list(md.disasm(code, tva))
print(f"insns {len(insns)}")

# find index scale 0x50
hits=[]
last50 = None  # list of (addr, reg_name, insn)
for idx, ins in enumerate(insns):
    m = ins
    # detect imul r, r, 0x50  or lea reg,[reg+reg*... ] with *0x50 impossible; also shl
    imm50=False
    if m.id in (X86_INS_IMUL,) and len(m.operands)>=3 and m.operands[2].type==X86_OP_IMM and m.operands[2].imm==0x50:
        imm50=True
    if m.id==X86_INS_LEA or True:
        pass
    # also detect movzx/mov with scale-8 + shl 3 patterns? skip
    if imm50:
        # look ahead window
        base_disp = None
        for k in range(idx, min(idx+40, len(insns))):
            j = insns[k]
            mems=[o for o in j.operands if o.type==X86_OP_MEM]
            for o in mems:
                d=o.mem.disp
                if d in WATCH:
                    hits.append((j, k-idx, ins))
print(f"hits {len(hits)}")
seen=set()
for j,delta,src in hits:
    key=(j.address,)
    if key in seen: continue
    seen.add(key)
    print(f"0x{j.address:x}  (imul@0x{src.address:x} +{delta}i)  {j.mnemonic} {j.op_str}")
