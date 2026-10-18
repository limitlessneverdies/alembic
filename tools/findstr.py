import sys, io, re

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

EXE = r'C:\Users\limit\Desktop\alembic.exe'
RD = 0x2DDE00
RDVA = 0x1402DF000
d = open(EXE, 'rb').read()

pats = sys.argv[1:]
for pat in pats:
    pb = pat.encode('utf-8')
    idx = 0
    hits = []
    while True:
        j = d.find(pb, idx)
        if j < 0:
            break
        hits.append(j)
        idx = j + 1
    print('=== %r : %d hits' % (pat, len(hits)))
    for h in hits:
        if 0x2DDE00 <= h < 0x640600:
            va = h - RD + RDVA
            ctx = d[max(0, h-60):h+80]
            print('   raw %s va %s' % (hex(h), hex(va)))
            print('      ctx: %r' % ctx.decode('utf-8', 'replace'))
        else:
            print('   raw %s (not rdata)' % hex(h))
