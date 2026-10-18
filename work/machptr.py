import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
    return None
def raw2va(raw):
    for base,rawbase,size in [(0x140001000,0x400,0x2DE000),(0x1402DF000,0x2DDE00,0x364000),(0x140642000,0x640600,0x400000)]:
        if rawbase <= raw < rawbase+size: return base + (raw-rawbase)
    return None

# machine names region inside string at va 0x1402E0C98
base_va = 0x1402E0C98
s = D[va2raw(base_va):va2raw(base_va)+0x100]
print(repr(s))
# locate offsets of each machine name
names = ['Spawner','Conveyor','Pipe','Filter','Generator','Fan','Sensor','Thermal Plate']
for n in names:
    off = s.find(n.encode())
    print('%-14s off=+0x%02X va=%012X' % (n, off, base_va+off))

# search for pointers into this string
lo = base_va; hi = base_va + 0x80
hits = []
for raw in range(0, len(D)-16):
    v = struct.unpack_from('<Q', D, raw)[0]
    if lo <= v < hi:
        hits.append((raw, v))
print('ptr hits:', len(hits))
seen = {}
for raw,v in hits:
    va = raw2va(raw)
    l = struct.unpack_from('<Q', D, raw+8)[0]
    print('  ptr@%s -> +0x%02X %-14s len=%d' % (('%012X'%va) if va else '?', v-base_va, D[va2raw(v):va2raw(v)+l if 0<l<64 else va2raw(v)+0], l))
