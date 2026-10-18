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
KIND = 0x14035D008
print('element index -> substance id (map @0x14035D008):')
for i in range(0,30):
    print('  Z=%d idx=%d -> sub %d' % (i+1,i,D[va2raw(KIND)+i]))
print('...')
for i in [35,36,37,38,39,45,46,47,52,55,56,78,79,80,81,82,91,92,113,114,115,116]:
    print('  Z=%d idx=%d -> sub %d' % (i+1,i,D[va2raw(KIND)+i]))
# substance table 0x14035AE6C stride 12 (f32 first)
T = 0x14035AE6C
def ent(i):
    b = D[va2raw(T+i*12):va2raw(T+i*12)+12]
    return b
print()
print('substance table entries 0..20:')
for i in range(0,21):
    b=ent(i)
    print('  %3d: %s  f0=%g f1=%g f2=%g' % (i, ' '.join('%02X'%x for x in b), struct.unpack_from('<f',b,0)[0], struct.unpack_from('<f',b,4)[0], struct.unpack_from('<f',b,8)[0]))
print('entries 33,34,38,39,40,44,45,118,119,120,121,122,123,124,125,126,127,130,134,135,136,137,138:')
for i in [33,34,38,39,40,44,45,46,47,118,119,120,121,122,123,124,125,126,127,130,134,135,136,137,138]:
    b=ent(i)
    print('  %3d: %s  f0=%g f1=%g f2=%g' % (i, ' '.join('%02X'%x for x in b), struct.unpack_from('<f',b,0)[0], struct.unpack_from('<f',b,4)[0], struct.unpack_from('<f',b,8)[0]))
