import struct, sys
from capstone import *
from capstone.x86 import *
from collections import defaultdict

PE = r"C:\Users\limit\Desktop\alembic.exe"
buf = open(PE,'rb').read()
def u16(o): return struct.unpack_from('<H',buf,o)[0]
def u32(o): return struct.unpack_from('<I',buf,o)[0]
def u64(o): return struct.unpack_from('<Q',buf,o)[0]

peoff=u32(0x3C); nsec=u16(peoff+6); optsz=u16(peoff+20)
opt=peoff+24; magic=u16(opt); ib=u64(opt+24) if magic==0x20B else u32(opt+28)
secs=[]; so=opt+optsz
for i in range(nsec):
    e=so+i*40
    nm=buf[e:e+8].rstrip(b'\0').decode('latin1')
    vsz=u32(e+8); va=u32(e+12); rsz=u32(e+16); raw=u32(e+20)
    secs.append((nm, ib+va, vsz, raw, rsz))
SEC={s[0]:s for s in secs}
def va2raw(va):
    for nm,base,vsz,raw,rsz in secs:
        if base<=va<base+max(vsz,rsz): return raw+(va-base)
    return None
def raw2va(r):
    for nm,base,vsz,raw,rsz in secs:
        if raw<=r<raw+rsz: return base+(r-raw)
    return None

ELEM_BASE = 0x14034F350
ELEM_END  = ELEM_BASE + 92*0x50

# --- .pdata function table ---
pd = SEC.get('.pdata')
funcs=[]
if pd:
    nm,base,vsz,raw,rsz = pd
    n = rsz//12
    for i in range(n):
        b,e,u = struct.unpack_from('<III', buf, raw+i*12)
        funcs.append((ib+b, ib+e))
funcs.sort()
print(f".pdata funcs: {len(funcs)}")
def func_of(va):
    lo,hi=0,len(funcs)-1
    while lo<=hi:
        mid=(lo+hi)//2
        s,e=funcs[mid]
        if va<s: hi=mid-1
        elif va>=e: lo=mid+1
        else: return (s,e)
    return None

# --- disassemble .text ---
t=SEC['.text']; nm,tva,tvsz,traw,trsz=t
code=buf[traw:traw+max(tvsz,trsz)]
md=Cs(CS_ARCH_X86,CS_MODE_64); md.detail=True
insns=list(md.disasm(code,tva))
print("insns",len(insns))

FIELDS={0x3c:'+3C',0x40:'+40',0x44:'+44',0x45:'+45',0x46:'+46',0x47:'+47',0x48:'+48',
        0x49:'+49',0x4a:'+4A',0x4b:'+4B',0x4c:'+4C',0x4d:'+4D',0x4e:'+4E',0x4f:'+4F'}
# element base refs
baserefs=set()
for ins in insns:
    for o in ins.operands:
        if o.type==X86_OP_MEM and o.mem.base==X86_REG_RIP:
            tgt=ins.address+ins.size+o.mem.disp
            if tgt==ELEM_BASE:
                f=func_of(ins.address)
                if f: baserefs.add(f)
print("functions referencing ELEM base:",len(baserefs))

mode = sys.argv[1] if len(sys.argv)>1 else 'summary'
if mode=='basefuncs':
    for s,e in sorted(baserefs):
        print(f"FUN_{s:09x}..{e:09x}  size={e-s}")
    sys.exit()

# per-function field accesses within base-referencing funcs
res=defaultdict(lambda: defaultdict(list))
for ins in insns:
    f=func_of(ins.address)
    if f not in baserefs: continue
    for o in ins.operands:
        if o.type==X86_OP_MEM and o.mem.disp in FIELDS:
            res[f][FIELDS[o.mem.disp]].append((ins.address, ins.mnemonic+' '+ins.op_str))
if mode=='summary':
    for f in sorted(res):
        cnt={k:len(v) for k,v in sorted(res[f].items())}
        print(f"FUN_{f[0]:09x}  ({f[1]-f[0]}b)  {cnt}")
    sys.exit()
if mode=='detail':
    want = sys.argv[2] if len(sys.argv)>2 else '+44'
    for f in sorted(res):
        if want in res[f]:
            print(f"=== FUN_{f[0]:09x}..{f[1]:09x}")
            for a,txt in res[f][want]:
                print(f"   0x{a:x}  {txt}")
    sys.exit()
