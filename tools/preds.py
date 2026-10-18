"""List all decoded branch/call predecessors of a VA.

preds.py <va_hex> [--jmp|--call]
Scans rdmap2.pkl for instructions whose op_str target equals the VA.
"""
import sys, io, os, pickle, re
HERE = os.path.dirname(os.path.abspath(__file__))

_p = os.path.join(HERE, 'rdmap2.pkl')
if not os.path.exists(_p):
    _p = os.path.join(HERE, 'rdmap.pkl')
with open(_p, 'rb') as f:
    M = pickle.load(f)

tgt = int(sys.argv[1], 16)
want = None
if '--jmp' in sys.argv:
    want = 'j'
if '--call' in sys.argv:
    want = 'call'

hexs = ['0x%x' % tgt, '0x%X' % tgt, '%x' % tgt]
out = []
for a, e in M.items():
    m = e[1]
    ops = e[2]
    if want == 'call' and m != 'call':
        continue
    if want == 'j' and not m.startswith('j'):
        continue
    if want is None and not (m.startswith('j') or m == 'call'):
        continue
    if ops.lower() in [h.lower() for h in hexs]:
        out.append((a, m + ' ' + ops))
out.sort()
print('# %d predecessors of 0x%X' % (len(out), tgt))
for a, t in out:
    print('%012X  %s' % (a, t))
