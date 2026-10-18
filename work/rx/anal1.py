import sys
sys.path.insert(0, r'C:\Users\limit\alembic-re\work')
from ndis import dis, fmt, raw_of, get
import struct

# disassemble FUN_1400fdf00 fully
START, END = 0x1400fdf00, 0x140137c10
ins = dis(START, end=END)
print(f'# {len(ins)} instructions in FUN_1400fdf00 (0x{START:x}-0x{END:x})', file=sys.stderr)
with open(r'C:\Users\limit\alembic-re\work\sim_all.txt','w') as f:
    for i in ins:
        f.write(fmt(i)+'\n')

# pool name lea sites
pool = []
def rd(p):
    b = open(p,'rb').read()
    if b[:2] in (b'\xff\xfe', b'\xfe\xff'): return b.decode('utf-16')
    return b.decode('utf-8', 'replace')

for line in rd(r'C:\Users\limit\rea-tools\poolrefs.txt').splitlines():
    if 'target 0x14035' not in line: continue
    parts = line.split()
    ia = int(parts[1],16); ta = int(parts[4],16)
    if not (0x140356D20 <= ta < 0x140356D20+886): continue
    pool.append((ia,ta))
pool.sort()
print(f'# {len(pool)} pool lea sites inside 0x140356D20+886', file=sys.stderr)

# name strings: reconstruct packed names
blob = get(0x140356D20, 886)
# sites sorted by target VA
sites = sorted(pool, key=lambda t: t[1])
names = []
for k,(ia,ta) in enumerate(sites):
    off = ta - 0x140356D20
    end = (sites[k+1][1]-0x140356D20) if k+1 < len(sites) else len(blob)
    nm = blob[off:end].decode('ascii', 'replace')
    names.append((ia, ta, nm))

# for each lea site find nearest call after it
calls = [(i.address, i.op_str) for i in ins if i.mnemonic == 'call']
print('# lea_site  name  -> next_call_va  next_call_target  (dist)')
for ia, ta, nm in names:
    nxt = None
    for a, o in calls:
        if a >= ia:
            nxt = (a, o); break
    if nxt:
        try: tgt = int(nxt[1],16)
        except: tgt = None
        print(f'{ia:012X}  {nm:<28} call@{nxt[0]:012X} -> {tgt if tgt is None else hex(tgt)}  d=0x{nxt[0]-ia:x}')
    else:
        print(f'{ia:012X}  {nm:<28} NO CALL AFTER')
