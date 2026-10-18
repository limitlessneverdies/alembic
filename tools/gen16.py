import re, os, sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
os.chdir(r'C:\Users\limit\rea-tools')
import ann

starts = []
for ln in open('sim_sections.txt', encoding='utf-8'):
    m = re.match(r'## (\d+) (\S+) @([0-9A-Fa-f]+)', ln)
    if m:
        starts.append((int(m.group(1)), m.group(2), int(m.group(3), 16)))

sel = range(1, 17)
os.makedirs('disas', exist_ok=True)
lines = []
for i, (n, nm, a) in enumerate(starts):
    if n not in sel:
        continue
    end = starts[i+1][2] if i + 1 < len(starts) else 0x140138FD0
    fn = f'disas/{n:02d}_{nm}.txt'
    with open(fn, 'w', encoding='utf-8') as fh:
        ann.disasm(a, end, fh)
    lines.append(f'{n}\t{nm}\t{a:X}\t{end:X}\t{end-a}')
    print(f'{n:02d} {nm:22s} 0x{a:X}-0x{end:X} {end-a:6d}B -> {fn}')
open('plan16.txt', 'w').write('\n'.join(lines))
