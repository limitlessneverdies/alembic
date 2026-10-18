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

def s_at(va, ln):
    r = va2raw(va)
    return d[r:r+ln].decode('utf-8', 'replace')

start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
for r in range(start, end, 0x20):
    a, b, c, e = struct.unpack_from('<QQQQ', d, r)
    def T(p, l):
        if 0x1402DF000 <= p < 0x140650000 and l < 300:
            return repr(s_at(p, l))
        return '(%s,%d)' % (hex(p), l)
    print('ROW@%s raw=%s  key=%s  text=%s' % (hex(raw2va(r)), hex(r), T(a, b), T(c, e)))
