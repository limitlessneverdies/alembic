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
    try:
        return d[r:r+ln].decode('utf-8')
    except Exception:
        return '<bad>'

def dump_rows(rowsva, count, indent='    '):
    for i in range(count):
        ra = va2raw(rowsva) + i * 0x20
        kp, kl = struct.unpack_from('<QQ', d, ra)
        tp, tl = struct.unpack_from('<QQ', d, ra + 0x10)
        k = s_at(kp, kl) if kl < 400 else '<badkey %d>' % kl
        t = s_at(tp, tl) if tl < 400 else '<badtext %d>' % tl
        print('%srow%02d key=%-20r text=%r' % (indent, i, k, t))

start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
i = 0
for r in range(start, end, 0x10):
    p, ln = struct.unpack_from('<QQ', d, r)
    print('SECTION %d @va %s raw %s  rows_ptr=%s count=%d' % (i, hex(raw2va(r)), hex(r), hex(p), ln))
    dump_rows(p, ln)
    i += 1
