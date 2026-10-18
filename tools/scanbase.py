import re, sys, bisect, collections

BIG = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
IDX = r'C:\Users\limit\rea-tools\func-index.txt'

# --- build function index (line -> func)
entries = []
for line in open(IDX):
    p = line.split()
    if len(p) >= 3 and p[0].startswith('L') and p[2].startswith('@'):
        entries.append((int(p[0][1:]), p[1], int(p[2][1:], 16)))
entries.sort()
starts = [e[0] for e in entries]
def func_of_line(ln):
    i = bisect.bisect_right(starts, ln) - 1
    return entries[i] if i >= 0 else (0, '?', 0)

# --- scan
# names look like DAT_14034f350 (lowercase hex by ghidra), or offsets relative
pat = re.compile(r'14034f[0-9a-f]{3}|140351[0-9a-f]{3}|140355[0-9a-f]{3}', re.I)
hits = collections.defaultdict(list)
want = sys.argv[1] if len(sys.argv) > 1 else None  # filter func name substring
BASE = 0x14034F350
for ln, text in enumerate(open(BIG, encoding='utf-8', errors='replace'), 1):
    for m in pat.finditer(text):
        va = int(m.group(0), 16)
        f = func_of_line(ln)
        if want and want not in f[1]:
            continue
        hits[f[1]].append((ln, va, va - BASE, m.start(), text.rstrip('\n')))

for fn in sorted(hits, key=lambda k: -len(hits[k])):
    print(f'#### {fn}  ({len(hits[fn])} refs)')
    for ln, va, off, col, text in hits[fn]:
        seg = text[max(0, col-90):col+70]
        print(f'  L{ln} +0x{off:03X} : ...{seg.strip()}...')
