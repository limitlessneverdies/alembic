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
for r in range(start, end, 0x30):
    tp, tl, rp, rc = struct.unpack_from('<QQQQ', d, r)
    ok = (0x1402DF000 <= tp < 0x140650000) and tl < 200 and (0x1402DF000 <= rp < 0x140650000) and rc < 100
    print('SEC @va %s raw %s' % (hex(raw2va(r)), hex(r)))
    if ok:
        print('   title=%r rows@%s count=%d' % (s_at(tp, tl), hex(rp), rc))
        for i in range(rc):
            ra = va2raw(rp) + i * 0x20
            kp, kl, xp, xl = struct.unpack_from('<QQQQ', d, ra)
            try:
                k = s_at(kp, kl)
            except Exception:
                k = '<bad>'
            try:
                x = s_at(xp, xl)
            except Exception:
                x = '<bad>'
            print('      r%02d %-28r %r' % (i, k, x))
    else:
        print('   (not a section: %s %d %s %d)' % (hex(tp), tl, hex(rp), rc))
