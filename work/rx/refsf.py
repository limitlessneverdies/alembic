import sys, subprocess, bisect
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
def rd(p):
    b=open(p,'rb').read()
    if b[:2] in (b'\xff\xfe',b'\xfe\xff'): return b.decode('utf-16')
    return b.decode('utf-8','replace')

LEA = rd(r'C:\Users\limit\rea-tools\lea-refs.txt')
IDX = r'C:\Users\limit\rea-tools\func-index.txt'
ent=[]
for line in open(IDX):
    p=line.split()
    if len(p)>=3 and p[0].startswith('L') and p[2].startswith('@'):
        ent.append((int(p[0][1:]), p[1], int(p[2][1:],16)))
ent.sort()
faddr=[e[2] for e in ent]

def funcof_va(va):
    i=bisect.bisect_right(faddr,va)-1
    if i<0: return None
    return ent[i]

def refs_to(target_va):
    out=[]
    for l in LEA.splitlines():
        if '\t' not in l: continue
        p=l.split('\t')
        try: t=int(p[1],16); f=int(p[0],16)
        except: continue
        if t==target_va: out.append((f,t))
    return out

if __name__=='__main__':
    for a in sys.argv[1:]:
        va=int(a,16)
        print(f'== refs to 0x{va:012X} ==')
        for f,t in refs_to(va):
            fc=funcof_va(f)
            print(f'  lea@0x{f:012X} in {fc[1]} @0x{fc[2]:X}  (L{fc[0]})')
