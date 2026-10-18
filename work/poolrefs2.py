import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH, 'rb').read()
def raw2va(r):
    if 0x400 <= r < 0x2DDE00: return r + 0x140001000 - 0x400
    if 0x2DDE00 <= r < 0x640600: return r + 0x1402DF000 - 0x2DDE00
    if 0x640600 <= r: return r + 0x140642000 - 0x640600
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
POOL = 0x1402F73F5
POOL_END = POOL + 0x1C0
hits = []
for r in range(0x400, 0x640600 - 16, 8):
    p, l = struct.unpack_from('<QQ', D, r)
    if POOL <= p < POOL_END and 1 <= l <= 24:
        hits.append((raw2va(r), p, l, D[va2raw(p):va2raw(p)+l].decode('latin1', 'replace')))
print('refs into substance name pool:', len(hits))
for h in hits:
    print('  VA=0x%X -> 0x%X len=%2d  %r' % h)
