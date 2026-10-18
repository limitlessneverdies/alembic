"""Dump extracted bodies for given function VAs from the big C file. Usage: fn.py 0xADDR [0xADDR...]"""
import sys, re
BIG = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
src = open(BIG, encoding='utf-8', errors='replace').read().splitlines()

starts = {}
for i, ln in enumerate(src):
    if ln[:1] in (' ', '\t', ''):
        continue
    m = re.match(r'^(?:[\w/ ]*\*?\s*)?(FUN_[0-9a-f]{9})\(', ln.strip())
    if m:
        starts.setdefault(m.group(1), i)

def show(name, maxlines=60):
    i = starts.get(name)
    print(f'######## {name}  (line {i+1 if i is not None else None}) ########')
    if i is None:
        print('  <not found>'); return
    depth = 0; shown = 0; seen = False
    for j in range(i, min(i + 4000, len(src))):
        ln = src[j]
        print(f'  {ln}')
        shown += 1
        depth += ln.count('{') - ln.count('}')
        if '{' in ln:
            seen = True
        if seen and depth <= 0:
            break
        if shown >= maxlines and not seen:
            print('  ...')
            break

if __name__ == '__main__':
    for a in sys.argv[1:]:
        va = int(a, 16)
        show(f'FUN_{va:09x}')
        print()
