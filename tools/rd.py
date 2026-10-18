"""Query the recursive-descent map: rd.py <start_hex> <end_hex> [outfile]
Prints every decoded instruction in [start,end) in order, marking gaps
(addresses with no decoded instruction) so unreached code is visible.
"""
import sys, io, os, pickle
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

_mapfile = os.path.join(HERE, 'rdmap2.pkl') if os.path.exists(os.path.join(HERE, 'rdmap2.pkl')) else os.path.join(HERE, 'rdmap.pkl')
with open(_mapfile, 'rb') as _f:
    map_ = pickle.load(_f)
sys.stderr.write('rd.py: using %s (%d insns)\n' % (os.path.basename(_mapfile), len(map_)))

start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
out = sys.stdout
if len(sys.argv) > 3:
    out = open(sys.argv[3], 'w', encoding='utf-8')

a = start
while a < end:
    if a in map_:
        sz, m, ops = map_[a][:3]
        txt = map_[a][3] if len(map_[a]) > 3 else (m + ' ' + ops)
        out.write('  %012X  %s\n' % (a, txt))
        a += sz
    else:
        # find next decoded address
        nxt = None
        for k in range(a + 1, min(a + 16, end)):
            if k in map_:
                nxt = k
                break
        if nxt is None:
            out.write('  %012X  <no code>\n' % a)
            a += 1
        else:
            out.write('  %012X  <gap %d>\n' % (a, nxt - a))
            a = nxt
