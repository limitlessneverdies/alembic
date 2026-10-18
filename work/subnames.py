import struct, re
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH, 'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
def raw2va(r):
    if 0x400 <= r < 0x2DDE00: return r + 0x140001000 - 0x400
    if 0x2DDE00 <= r < 0x640600: return r + 0x1402DF000 - 0x2DDE00
    if 0x640600 <= r: return r + 0x140642000 - 0x640600

names = ["Rust","Salt","Derived","Gunpowder","Quartz","Firebrick","BattPos","BattNeg","Spark","ThermalPlate",
         "Spawner","Conveyor","Pipe","Filter","Fan","Insulation","Sensor","Diamond","Ruby","Sapphire","Emerald",
         "Amethyst","Jade","Peridot","Generator","Neutron","Naphtha","Methane"]
pool_va = 0x1402F73F5
raw = va2raw(pool_va)
pool_len = 600
pool = D[raw:raw+pool_len]
for n in names:
    i = pool.find(n.encode())
    print('%-13s pooloff=0x%X VA=0x%X  ctx=%r' % (n, i, pool_va + i if i>=0 else 0, pool[max(0,i-8):i+len(n)+8].decode('latin1')))
print()
# find (ptr,len) tables in .rdata pointing into the pool
targets = {}
for n in names:
    i = pool.find(n.encode())
    if i >= 0:
        targets[pool_va + i] = n
lo = va2raw(0x1402DF000); hi = va2raw(0x140642000)
hits = []
for r in range(lo, hi - 16, 8):
    p, l = struct.unpack_from('<QQ', D, r)
    if p in targets and 2 <= l <= 20:
        hits.append((raw2va(r), targets[p], l))
print('candidate (ptr,len) refs to pool names: %d' % len(hits))
for h in hits[:200]:
    print('  VA=0x%X name=%s len=%d' % h)
