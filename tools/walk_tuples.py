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
    if not (0x1402DF000 <= va < 0x140650000):
        return None
    return d[va2raw(va):va2raw(va)+ln].decode('utf-8', 'replace')

def main():
    start = int(sys.argv[1], 16)
    end = int(sys.argv[2], 16)
    stride = int(sys.argv[3], 16) if len(sys.argv) > 3 else 0x10
    for r in range(start, end, stride):
        p, ln = struct.unpack_from('<QQ', d, r)
        txt = s_at(p, ln) if 0 < ln < 500 else None
        if txt is not None:
            print('%s va=%s ptr=%s len=%d %r' % (hex(r), hex(raw2va(r)), hex(p), ln, txt))

main()
