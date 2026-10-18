import sys, bisect
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
def rd(p):
    b=open(p,'rb').read()
    if b[:2] in (b'\xff\xfe',b'\xfe\xff'): return b.decode('utf-16')
    return b.decode('utf-8','replace')
SIM=r'C:\Users\limit\alembic-re\work\rx\sim_all.txt'
ins=[]
for l in open(SIM).read().splitlines():
    va=int(l[:12],16); an=l[14:].split('  ',1)
    mn=an[0].strip(); ops=an[1].strip() if len(an)>1 else ''
    ins.append((va,mn,ops))
addrs=[a for a,_,_ in ins]
def idx(va): return bisect.bisect_left(addrs,va)

pool=[]
for line in rd(r'C:\Users\limit\rea-tools\poolrefs.txt').splitlines():
    if 'target 0x14035' not in line: continue
    p=line.split()
    ia=int(p[1],16); ta=int(p[4],16)
    if 0x140356D20 <= ta < 0x140356D20+886: pool.append((ia,ta))
pool.sort()
names=[]
blob_len=886
import importlib.util
spec=importlib.util.spec_from_file_location('xdis', r'C:\Users\limit\alembic-re\work\rx\ndis.py')
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
blob=m.get(0x140356D20,blob_len)
byta=sorted(pool,key=lambda t:t[1])
for k,(ia,ta) in enumerate(byta):
    off=ta-0x140356D20
    end=(byta[k+1][1]-0x140356D20) if k+1<len(byta) else blob_len
    names.append((ia,ta,blob[off:end].decode('ascii','replace')))

print(f'{"name":<28} {"push_va":>12} {"size":>7}  call targets (order)')
for k,(ia,ta,nm) in enumerate(names):
    end = names[k+1][0] if k+1<len(names) else ia+0x2000
    i0,i1=idx(ia),idx(end)
    calls=[]
    for a,mn,ops in ins[i0:i1]:
        if mn=='call':
            calls.append(f'{ops}')
    print(f'{nm:<28} {ia:012X} {end-ia:#7x}  ' + ' '.join(calls))
