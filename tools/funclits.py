import re, sys, bisect
BIG = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
IDX = r'C:\Users\limit\rea-tools\func-index.txt'
entries = []
for line in open(IDX):
    p = line.split()
    if len(p) >= 3 and p[0].startswith('L') and p[2].startswith('@'):
        entries.append((int(p[0][1:]), p[1], int(p[2][1:], 16)))
entries.sort()
starts = [e[0] for e in entries]
names = {e[1]: i for i, e in enumerate(entries)}
printfile = None
for name in sys.argv[1:]:
    if name not in names:
        print(f'{name}: NOT FOUND'); continue
    k = names[name]
    a = entries[k][0]
    b = entries[k+1][0] if k+1 < len(entries) else None
    lines = open(BIG, encoding='utf-8', errors='replace').read().splitlines()[a-1:(b-1 if b else None)]
    strs = []
    calls = set()
    for l in lines:
        for m in re.finditer(r'"((?:[^"\\]|\\.)*)"', l):
            s = m.group(1)
            if s and not s.startswith('%') and len(s) > 1:
                strs.append(s)
        for m in re.finditer(r'\b(FUN_[0-9a-f]{9})\s*\(', l):
            calls.add(m.group(1))
    print(f'==== {name} @0x{entries[k][2]:X}  lines {a}..{b} ({len(lines)} lines)')
    seen = []
    for s in strs:
        if s not in seen: seen.append(s)
    print('  strings:', ' | '.join(seen[:60]))
    print('  calls:', ' '.join(sorted(calls)))
