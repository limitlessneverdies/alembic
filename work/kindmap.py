import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH, 'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
    return None
def rd(va, n):
    o = va2raw(va); return D[o:o+n]
def cstr(va):
    o = va2raw(va); s = D[o:o+64]
    e = s.find(b'\0')
    return s[:e if e >= 0 else 64].decode('latin1')

KIND = 0x14035D008
sym = {}
for i in range(92):
    e = 0x14034F350 + i*0x50
    p, l = struct.unpack_from('<QQ', rd(e, 16), 0)
    z = rd(e+0x46, 1)[0]
    sym[i] = (cstr(p), z)
print('idx Z  sym  kindval')
used = {}
for i in range(92):
    v = rd(KIND + i, 1)[0]
    used.setdefault(v, []).append(sym[i][0])
    print('%3d %3d %-3s   0x%02X (%d)' % (i, sym[i][1], sym[i][0], v, v))
print()
print('distinct kind values:', len(used), 'min', min(used), 'max', max(used))
unused = [v for v in range(0, 256) if v not in used]
print('values NOT used by any element:', unused)
print()
# substance table at 0x14035AE6C stride 12
T = 0x14035AE6C
print('=== substance table @0x14035AE6C (first 40) ===')
for i in list(range(0, 26)) + [46,47,48,49,50,51]:
    b = rd(T + i*12, 12)
    f0 = struct.unpack_from('<f', b, 0)[0]
    print(' sub %3d: f0=%-10g  bytes: %s' % (i, f0, ' '.join('%02X' % x for x in b)))
