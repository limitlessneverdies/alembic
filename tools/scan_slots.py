import struct, sys

EXE = r'C:\Users\limit\Desktop\alembic.exe'
RD = 0x2DDE00
RDVA = 0x1402DF000
d = open(EXE, 'rb').read()

def raw2va(r):
    return r - RD + RDVA

def va2raw(v):
    return v - RDVA + RD

def s_at(va, ln):
    if not (0x1402DF000 <= va < 0x140660000):
        return None
    r = va2raw(va)
    if r + ln > len(d):
        return None
    try:
        t = d[r:r+ln].decode('utf-8')
    except Exception:
        return None
    return t

start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
n = 0
for r in range(start, end, 0x10):
    p, ln = struct.unpack_from('<QQ', d, r)
    txt = s_at(p, ln) if ln < 600 else None
    if txt is not None:
        print('[%3d] %s raw=%s ptr=%s len=%d %r' % (n, hex(raw2va(r)), hex(r), hex(p), ln, txt))
    else:
        print('[%3d] %s raw=%s  (NOT STRING: %s %d)' % (n, hex(raw2va(r)), hex(r), hex(p), ln))
    n += 1
