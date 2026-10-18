"""xsweep.py <lo_hex> <hi_hex> [outfile]
List call targets inside [lo,hi) with counts and first call sites.
Marks targets that live in the input layer 0x140176000-0x140179000.
"""
import sys, os, pickle, collections

HERE = os.path.dirname(os.path.abspath(__file__))
m = pickle.load(open(os.path.join(HERE, 'rdmap2.pkl'), 'rb'))
lo = int(sys.argv[1], 16); hi = int(sys.argv[2], 16)
out = open(sys.argv[3], 'w', encoding='utf-8') if len(sys.argv) > 3 else sys.stdout

tgt = collections.Counter(); sites = collections.defaultdict(list)
for a in sorted(m):
    if lo <= a < hi:
        e = m[a]
        t = e[3] if len(e) > 3 else (e[1] + ' ' + e[2])
        if t.startswith('call '):
            tok = t.split()[1]
            if not tok.startswith('0x'):
                continue
            d = int(tok, 16); tgt[d] += 1; sites[d].append(a)

for t, c in sorted(tgt.items()):
    flag = '   <<< INPUT-LAYER' if 0x140176000 <= t < 0x140179000 else ''
    out.write('%012X x%-3d  first: %s%s\n' % (t, c, ' '.join('%X' % s for s in sites[t][:5]), flag))
out.write('--- %d distinct call targets\n' % len(tgt))
if out is not sys.stdout:
    out.close()
    print('written')
