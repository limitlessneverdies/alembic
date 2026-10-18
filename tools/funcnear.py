"""funcnear.py <hexaddr>... : nearest function start at or below each address."""
import re, sys, bisect
lines = open(r'C:\Users\limit\rea-tools\func-index.txt', encoding='utf-8', errors='replace').read().splitlines()
ent = []
for l in lines:
    mm = re.search(r'FUN_([0-9a-fA-F]+)', l)
    if mm:
        ent.append(int(mm.group(1), 16))
ent = sorted(set(ent))
for arg in sys.argv[1:]:
    t = int(arg, 16)
    i = bisect.bisect_right(ent, t) - 1
    print('%012X -> func %012X (idx %d of %d)' % (t, ent[i], i, len(ent)))
