import struct, sys
from capstone import *
from capstone.x86 import *
from collections import defaultdict

PE = r"C:\Users\limit\Desktop\alembic.exe"
buf=open(PE,'rb').read()
def u16(o): return struct.unpack_from('<H',buf,o)[0]
def u32(o): return struct.unpack_from('<I',buf,o)[0]
def u64(o): return struct.unpack_from('<Q',buf,o)[0]
peoff=u32(0x3C); nsec=u16(peoff+6); optsz=u16(peoff+20); opt=peoff+24
magic=u16(opt); ib=u64(opt+24) if magic==0x20B else u32(opt+28)
secs=[]; so=opt+optsz
for i in range(nsec):
    e=so+i*40
    nm=buf[e:e+8].rstrip(b'\0').decode('latin1')
    vsz=u32(e+8); va=u32(e+12); rsz=u32(e+16); raw=u32(e+20)
    secs.append((nm, ib+va, vsz, raw, rsz))
SEC={s[0]:s for s in secs}
pd=SEC['.pdata']; funcs=[]
nm,pbase,pvsz,praw,prsz=pd
for i in range(prsz//12):
    b,e,u=struct.unpack_from('<III',buf,praw+i*12)
    funcs.append((ib+b,ib+e))
funcs.sort()
def func_of(va):
    lo,hi=0,len(funcs)-1
    while lo<=hi:
        m=(lo+hi)//2; s,e=funcs[m]
        if va<s: hi=m-1
        elif va>=e: lo=m+1
        else: return (s,e)
    return None
t=SEC['.text']; nm,tva,tvsz,traw,trsz=t
code=buf[traw:traw+max(tvsz,trsz)]
md=Cs(CS_ARCH_X86,CS_MODE_64); md.detail=True
insns=list(md.disasm(code,tva))

LO=int(sys.argv[1],16); HI=int(sys.argv[2],16)
per=defaultdict(list)
for ins in insns:
    for o in ins.operands:
        if o.type==X86_OP_MEM and o.mem.base==X86_REG_RIP:
            tgt=ins.address+ins.size+o.mem.disp
            if LO<=tgt<HI:
                f=func_of(ins.address)
                per[tgt].append((f, ins.address, ins.mnemonic+' '+ins.op_str))
for tgt in sorted(per):
    print(f"=== 0x{tgt:X}  ({len(per[tgt])} refs)")
    byf=defaultdict(int)
    for f,a,txt in per[tgt]:
        byf[f]+=1
    for f,c in sorted(byf.items(), key=lambda kv:-kv[1]):
        if f is None: print(f"   [no func] x{c}")
        else: print(f"   FUN_{f[0]:09x} x{c}")
    for f,a,txt in per[tgt][:14]:
        print(f"      0x{a:x}  {txt}")
