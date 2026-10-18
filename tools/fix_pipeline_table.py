import re

src = open(r'C:\Users\limit\rea-tools\sim_sections.txt', encoding='utf-8').read().splitlines()
truth = {}
for l in src:
    m = re.match(r'## (\d+) (\S+) @000([0-9A-F]+) lea=0x([0-9A-F]+) calls=(\d+)', l)
    if m:
        truth[int(m.group(1))] = (m.group(2), int(m.group(3), 16), int(m.group(4), 16), int(m.group(5)))

path = r'C:\Users\limit\alembic-re\docs\SIM-PIPELINE.md'
lines = open(path, encoding='utf-8').read().splitlines()
out = []
fixed = 0
pat = re.compile(r'\| (\d\d) \| (\S+) \| `0x([0-9A-Fa-f]+)` \| `0x([0-9A-Fa-f]+)` \| (\d+) \| (.*) \|')
for l in lines:
    m = pat.match(l)
    if m:
        n = int(m.group(1))
        t = truth[n]
        group = m.group(6)
        new = '| %02d | %s | `0x%X` | `0x%X` | %d | %s |' % (n, t[0], t[1], t[2], t[3], group)
        out.append(new)
        fixed += 1
    else:
        out.append(l)
open(path, 'w', encoding='utf-8').write('\n'.join(out) + '\n')
print('fixed rows:', fixed)
