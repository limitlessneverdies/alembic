import sys
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
import importlib.util
spec=importlib.util.spec_from_file_location('xdis', r'C:\Users\limit\alembic-re\work\rx\ndis.py')
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)

SIM=r'C:\Users\limit\alembic-re\work\rx\sim_all.txt'
lines=open(SIM).read().splitlines()
ins=[]
for l in lines:
    va=int(l[:12],16); rest=l[14:]
    mn=rest.split()[0]
    ins.append((va,mn,rest))
addrs=[a for a,_,_ in ins]
import bisect
def window(va, n):
    i=bisect.bisect_left(addrs,va)
    return ins[i:i+n]

if __name__=='__main__':
    va=int(sys.argv[1],16); n=int(sys.argv[2]) if len(sys.argv)>2 else 24
    for a,mn,rest in window(va,n):
        print(f'{a:012X}  {rest}')
