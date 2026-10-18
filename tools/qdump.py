import struct, sys

EXE = r'C:\Users\limit\Desktop\alembic.exe'
RD = 0x2DDE00
RDVA = 0x1402DF000
d = open(EXE, 'rb').read()

def va2raw(v):
    return v - RDVA + RD

def raw2va(r):
    return r - RD + RDVA

def s_at(va, ln):
    r = va2raw(va)
    return d[r:r+ln].decode('utf-8', 'replace')

start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
for r in range(start, end, 8):
    q = struct.unpack_from('<Q', d, r)[0]
    txt = ''
    if 0x1402DF000 <= q < 0x140650000:
        try:
            txt = repr(d[va2raw(q):va2raw(q)+24].decode('utf-8'))
        except Exception:
            txt = '<bin>'
    print('%s va=%-12s q=%-20s %s' % (hex(r), hex(raw2va(r)), hex(q), txt))
