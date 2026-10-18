"""RX: find all LEA/MOV riprel references to a VA range by byte-pattern scanning .text."""
import sys, struct, bisect
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
import importlib.util
spec=importlib.util.spec_from_file_location('xdis', r'C:\Users\limit\alembic-re\work\rx\ndis.py')
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)

TEXT_VA, TEXT_RAW, TEXT_SZ = 0x140001000, 0x400, 0x2DDE00-0x400
data=open(r'C:\Users\limit\Desktop\alembic.exe','rb').read()
text=data[TEXT_RAW:TEXT_RAW+TEXT_SZ]

# func boundaries for attribution
ent=[]
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    p=line.split()
    if len(p)>=3 and p[0].startswith('L') and p[2].startswith('@'):
        ent.append((int(p[2][1:],16), p[1]))
ent.sort()
faddr=[e[0] for e in ent]
def funcof(va):
    i=bisect.bisect_right(faddr,va)-1
    return ent[i] if i>=0 else None

def scan_refs(lo, hi):
    """return list of (instr_va, target_va, kind)"""
    out=[]
    n=len(text)
    i=0
    while i < n-7:
        b=text[i]
        # optional REX prefix
        j=i
        rex=None
        if b in (0x40,0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f):
            rex=b; j=i+1; b=text[j]
        if b in (0x8d, 0x8b):
            modrm=text[j+1]
            if (modrm & 0xC7)==0x05:
                disp=struct.unpack_from('<i', text, j+2)[0]
                next_va=TEXT_VA+(j+6)
                tgt=next_va+disp
                if lo<=tgt<hi:
                    out.append((TEXT_VA+i, tgt, 'lea' if b==0x8d else 'mov'))
                i=j+6; continue
        i+=1
    return out

if __name__=='__main__':
    lo=int(sys.argv[1],16); hi=int(sys.argv[2],16)
    rs=scan_refs(lo,hi)
    print(f'# {len(rs)} refs into [0x{lo:X},0x{hi:X})')
    for ia,t,k in rs:
        f=funcof(ia)
        print(f'0x{ia:012X} -> 0x{t:012X} [{k}] in {f[1] if f else "?"} @0x{(f[0] if f else 0):X}')
