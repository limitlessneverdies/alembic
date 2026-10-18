import sys, bisect
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
SIM=r'C:\Users\limit\alembic-re\work\rx\sim_all.txt'
ins=[]
for l in open(SIM).read().splitlines():
    va=int(l[:12],16); rest=l[14:]
    p=rest.split(None,1)
    ins.append((va,p[0],p[1].strip() if len(p)>1 else ''))
addrs=[a for a,_,_ in ins]
def idx(va): return bisect.bisect_left(addrs,va)
targets=sys.argv[1:] if len(sys.argv)>1 else ['0x1400bbf70']
n=int(sys.argv[0] and 30)
for t in targets:
    tv=int(t,16)
    hits=[k for k,(a,m,o) in enumerate(ins) if m=='call' and o==t]
    for h in hits:
        a=ins[h][0]
        print(f'--- call at 0x{a:012X} ---')
        for k in range(max(0,h-n),h+3):
            aa,mm,oo=ins[k]
            print(f'  {aa:012X}  {mm:<8} {oo}')
