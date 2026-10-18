import re

src = open(r'C:\Users\limit\rea-tools\sim_sections.txt', encoding='utf-8').read().splitlines()
truth = {}
for l in src:
    m = re.match(r'## (\d+) (\S+) @000([0-9A-F]+) lea=0x([0-9A-F]+) calls=(\d+)', l)
    if m:
        n = int(m.group(1))
        truth[n] = (m.group(2), int(m.group(3), 16), int(m.group(4), 16), int(m.group(5)))

doc = open(r'C:\Users\limit\alembic-re\docs\SIM-PIPELINE.md', encoding='utf-8').read().splitlines()
rows = {}
for l in doc:
    m = re.match(r'\| (\d\d) \| (\S+) \| `0x([0-9A-Fa-f]+)` \| `0x([0-9A-Fa-f]+)`[^|]*\| (\d+) \|', l)
    if m:
        n = int(m.group(1))
        rows[n] = (m.group(2), int(m.group(3), 16), int(m.group(4), 16), int(m.group(5)))

print('truth sections:', len(truth), 'doc rows:', len(rows))
bad = 0
for n in sorted(truth):
    t = truth[n]
    r = rows.get(n)
    if not r:
        print(f'{n:02d} MISSING IN DOC'); bad += 1; continue
    if t[0] != r[0]:
        print(f'{n:02d} NAME  truth={t[0]}  doc={r[0]}'); bad += 1
    if t[1] != r[1]:
        print(f'{n:02d} ADDR  truth={hex(t[1])}  doc={hex(r[1])}'); bad += 1
    if t[2] != r[2]:
        print(f'{n:02d} LEA   truth={hex(t[2])}  doc={hex(r[2])}'); bad += 1
    if t[3] != r[3]:
        print(f'{n:02d} CALLS truth={t[3]}  doc={r[3]}'); bad += 1
print('mismatches:', bad)
