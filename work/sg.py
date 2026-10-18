"""Grep the sim mega-function listing (recursive-descent map) with a regex.
Usage: sg.py <start_hex> <end_hex> <regex> [--ctx N]
Prints matching lines with N lines of context.
"""
import sys, re
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
import rdmap

m = rdmap.load_maps()
start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
pat = re.compile(sys.argv[3])
ctx = 0
if '--ctx' in sys.argv:
    ctx = int(sys.argv[sys.argv.index('--ctx') + 1])

lines = []
a = start
while a < end:
    if a in m:
        sz, mm, ops, txt = m[a]
        lines.append((a, txt))
        a += sz
    else:
        a += 1

for i, (va, txt) in enumerate(lines):
    if pat.search(txt):
        lo = max(0, i - ctx); hi = min(len(lines), i + ctx + 1)
        for j in range(lo, hi):
            mark = '>>' if j == i else '  '
            print('%s %012X  %s' % (mark, lines[j][0], lines[j][1]))
        if ctx:
            print('   ----')
