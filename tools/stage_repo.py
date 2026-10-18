import os, shutil, struct, sys

ROOT = r'C:\Users\limit\alembic-re'
REA = r'C:\Users\limit\rea-tools'
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw

os.makedirs(os.path.join(ROOT, 'data'), exist_ok=True)
os.makedirs(os.path.join(ROOT, 'src', 'systems'), exist_ok=True)
os.makedirs(os.path.join(ROOT, 'tools'), exist_ok=True)

def transcode(src, dst):
    raw = open(src, 'rb').read()
    for enc in ('utf-8', 'utf-8-sig', 'utf-16', 'utf-16-le', 'cp1252', 'latin1'):
        try:
            text = raw.decode(enc)
            break
        except UnicodeDecodeError:
            continue
    else:
        text = raw.decode('latin1')
    with open(dst, 'w', encoding='utf-8') as f:
        f.write(text)

# 1. elements
transcode(os.path.join(REA, 'elements92.json'), os.path.join(ROOT, 'data', 'elements92.json'))
transcode(os.path.join(REA, 'elements92.txt'), os.path.join(ROOT, 'data', 'elements92.txt'))
transcode(os.path.join(REA, 'kindtab.txt'), os.path.join(ROOT, 'data', 'kind-table-raw.txt'))

# 2. sim maps
for name in ('sim_sections.txt', 'sim_timeline.txt', 'poolrefs.txt', 'elemrefs.txt', 'sim-names-runs.txt', 'lea-refs.txt', 'func-index.txt'):
    src = os.path.join(REA, name)
    if os.path.exists(src):
        transcode(src, os.path.join(ROOT, 'data', name))

# 3. frame entry + dump gaps
transcode(os.path.join(REA, 'frame-entry-context.txt'), os.path.join(ROOT, 'data', 'frame-entry-context.txt'))
transcode(os.path.join(REA, 'dump-gaps.txt'), os.path.join(ROOT, 'data', 'dump-gaps.txt'))

# 4. kind table binary + formatted text
kt_va = 0x14035D008
kt_raw = va2raw(kt_va)
kt_bytes = DATA[kt_raw:kt_raw + 92]
open(os.path.join(ROOT, 'data', 'kind-table.bin'), 'wb').write(kt_bytes)
# join with element symbols
import json
elems = json.load(open(os.path.join(REA, 'elements92.json'), encoding='utf-8'))
kt_lines = ['# Alembic kind table (VA 0x14035D008, 92 bytes, indexed Z-1)', '# Z  sym  kind']
for e in elems:
    z = e['tail_u8'][6]
    kt_lines.append(f'{z:3d}  {str(e["sym"]):3s}  0x{kt_bytes[z-1]:02X}')
open(os.path.join(ROOT, 'data', 'kind-table.txt'), 'w', encoding='utf-8').write('\n'.join(kt_lines) + '\n')

# 5. sim name pool binary + labeled text
pool_va = 0x140356D20
pool_raw = va2raw(pool_va)
pool_bytes = DATA[pool_raw:pool_raw + 886]
open(os.path.join(ROOT, 'data', 'sim-name-pool.bin'), 'wb').write(pool_bytes)
# parse sim_sections for name+lea
import re
names_leas = []
for l in open(os.path.join(REA, 'sim_sections.txt'), encoding='utf-8'):
    m = re.match(r'## (\d+) (\S+) @000[0-9A-F]+ lea=0x([0-9A-F]+)', l)
    if m:
        names_leas.append((int(m.group(1)), m.group(2), int(m.group(3), 16)))
pool_lines = ['# Alembic sim name pool (VA 0x140356D20, raw 0x355B20, 886 bytes, bare concatenation, no separators)', '# idx  offset  length  name']
prev_off = 0
for i, (n, name, lea) in enumerate(names_leas):
    off = lea - pool_va
    if i + 1 < len(names_leas):
        length = (names_leas[i+1][2] - lea)
    else:
        length = 886 - off
    actual = pool_bytes[off:off+length].decode('latin1')
    pool_lines.append(f'{n:02d}  {off:4d}  {length:2d}  {actual}   (label: {name})')
open(os.path.join(ROOT, 'data', 'sim-name-pool.txt'), 'w', encoding='utf-8').write('\n'.join(pool_lines) + '\n')

# 6. helper bodies
src_sys = os.path.join(REA, 'systems')
dst_sys = os.path.join(ROOT, 'src', 'systems')
copied = 0
for f in sorted(os.listdir(src_sys)):
    if f.endswith('.txt'):
        shutil.copyfile(os.path.join(src_sys, f), os.path.join(dst_sys, f))
        copied += 1

# 7. toolkit scripts
src_scr = os.path.join(REA, 'scripts')
dst_tools = os.path.join(ROOT, 'tools')
scopied = 0
for f in sorted(os.listdir(src_scr)):
    if f.endswith('.py'):
        shutil.copyfile(os.path.join(src_scr, f), os.path.join(dst_tools, f))
        scopied += 1

print('staged: data files +', copied, 'system bodies +', scopied, 'python tools')
print('kind-table bytes:', len(kt_bytes))
print('name-pool bytes:', len(pool_bytes))
