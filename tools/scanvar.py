import sys, bisect, collections
BIG = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
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

needles = [n.lower() for n in sys.argv[1:]]
hits = collections.defaultdict(list)
for ln, text in enumerate(open(BIG, encoding='utf-8', errors='replace'), 1):
    t = text.lower()
    for n in needles:
        if n in t:
            f = func_of_line(ln)
            hits[f[1]].append((n, ln, text.rstrip()))
            break
for fn in sorted(hits, key=lambda k: -len(hits[k])):
    print(f'#### {fn}  ({len(hits[fn])} refs)')
    for n, ln, text in sorted(hits[fn], key=lambda x: x[1]):
        print(f'  L{ln} [{n}] {text.strip()[:170]}')
