"""Show call sites of a function with preceding context.

callsit.py <target_hex> [back=8] [fwd=2] [lo] [hi]
Uses rdmap2/pkl ordered stream: prints instructions around each 'call target'.
"""
import sys, io, os, pickle
HERE = os.path.dirname(os.path.abspath(__file__))

_p = os.path.join(HERE, 'rdmap2.pkl')
if not os.path.exists(_p):
    _p = os.path.join(HERE, 'rdmap.pkl')
with open(_p, 'rb') as f:
    M = pickle.load(f)

tgt = int(sys.argv[1], 16)
back = int(sys.argv[2]) if len(sys.argv) > 2 else 8
fwd = int(sys.argv[3]) if len(sys.argv) > 3 else 2
lo = int(sys.argv[4], 16) if len(sys.argv) > 4 else 0
hi = int(sys.argv[5], 16) if len(sys.argv) > 5 else (1 << 64)

addrs = sorted(a for a in M if lo <= a < hi)
order = {a: i for i, a in enumerate(addrs)}


def txt(a):
    e = M[a]
    return e[3] if len(e) > 3 else (e[1] + ' ' + e[2])


calls = [a for a in addrs if M[a][1] == 'call' and ('%x' % tgt) in M[a][2]]

if len(sys.argv) > 6:
    sys.stdout = open(sys.argv[6], 'w', encoding='utf-8')

print('# %d call sites of 0x%X' % (len(calls), tgt))
for c in calls:
    i = order[c]
    print('--- call @ %012X' % c)
    for j in range(max(0, i - back), min(len(addrs), i + fwd + 1)):
        a = addrs[j]
        print('   %012X  %s%s' % (a, txt(a), '   <<<' if a == c else ''))
