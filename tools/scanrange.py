import re, sys, bisect, collections

BIG = r'C:\Users\limit\rea-tools\decompiled\alembic_all_decompiled.c'
IDX = r'C:\Users\limit\rea-tools\func-index.txt'
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

lo = int(sys.argv[1], 16); hi = int(sys.argv[2], 16)
# match 'DAT_'/'UNK_'/'PTR_' globals with addresses in [lo,hi)
pat = re.compile(r'\b[A-Za-z_]{0,5}(140[0-9a-fA-F]{6})\b')
hits = collections.defaultdict(list)
for ln, text in enumerate(open(BIG, encoding='utf-8', errors='replace'), 1):
    for m in pat.finditer(text):
        va = int(m.group(1), 16)
        if lo <= va < hi:
            f = func_of_line(ln)
            hits[f[1]].append((ln, va, m.start(), text.rstrip('\n')))
for fn in sorted(hits, key=lambda k: -len(hits[k])):
    print(f'#### {fn}  ({len(hits[fn])} refs)')
    for ln, va, col, text in sorted(hits[fn]):
        seg = text[max(0, col-110):col+80]
        print(f'  L{ln} 0x{va:X} : ...{seg.strip()}...')
