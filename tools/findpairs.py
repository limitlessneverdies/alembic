import struct, sys, io

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

EXE = r'C:\Users\limit\Desktop\alembic.exe'
RD = 0x2DDE00
RDVA = 0x1402DF000
d = open(EXE, 'rb').read()

def va2raw(v):
    return v - RDVA + RD

def raw2va(r):
    return r - RD + RDVA

def strp(p, l):
    if not (0x1402DF000 <= p < 0x140650000) or l > 300:
        return None
    r = va2raw(p)
    try:
        return d[r:r+l].decode('utf-8')
    except Exception:
        return None

start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
for r in range(start, end, 8):
    p, l = struct.unpack_from('<QQ', d, r)
    t = strp(p, l)
    if t is not None:
        print('PAIR @%s (raw %s) len=%3d %r' % (hex(raw2va(r)), hex(r), l, t))
