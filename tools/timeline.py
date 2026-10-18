import sys

# Merge name-lea refs (poolrefs.txt) with call scan (fun_calls raw) into one ordered timeline.
# Usage: timeline.py poolrefs.txt calls.tsv [out.txt]
pool_file = sys.argv[1]
calls_file = sys.argv[2]

# load function starts for call target naming
starts = {}
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        try:
            starts[int(parts[2][1:], 16)] = parts[1]
        except ValueError:
            pass

def read_text(path):
    raw = open(path, 'rb').read()
    if raw[:2] == b'\xff\xfe':
        return raw.decode('utf-16')
    try:
        return raw.decode('utf-8')
    except UnicodeDecodeError:
        return raw.decode('latin1')

pool = []  # (instr, target)
for line in read_text(pool_file).splitlines():
    if '->' in line:
        toks = [t for t in line.split() if t.startswith('0x')]
        if len(toks) >= 2:
            pool.append((int(toks[0], 16), int(toks[1], 16)))

calls = []  # (instr, target, kind)
for line in read_text(calls_file).splitlines():
    if line.startswith('#'):
        continue
    p = line.split()
    if len(p) >= 3:
        calls.append((int(p[0], 16), int(p[1], 16), p[2]))

# pool name segmentation: pool base VA 0x140356D20, use pool targets as name starts
POOL_BASE = 0x140356D20
starts_list = sorted(set(tv for _, tv in pool))
name_starts = {}
ram = open(r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c', 'rb')
# read pool bytes directly from exe instead
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw
po = va2raw(POOL_BASE)
pool_bytes = DATA[po:po + 886]

def name_at(va):
    off = va - POOL_BASE
    return pool_bytes[off:].split(b'_')[0].decode('latin1') if 0 <= off < len(pool_bytes) else '??'

# build timeline
events = []
for iv, tv in pool:
    if tv >= POOL_BASE:
        events.append((iv, f'LEA-NAME {tv:012X}'))
for iv, tv, kind in calls:
    nm = starts.get(tv, '')
    events.append((iv, f'CALL {tv:012X} {nm} {kind}'.strip()))
events.sort()

pa = int(sys.argv[3], 16) if len(sys.argv) > 3 else None
pb = int(sys.argv[4], 16) if len(sys.argv) > 4 else None
out = []
for iv, desc in events:
    if pa is not None and (iv < pa or iv > pb):
        continue
    out.append(f'{iv:012X}  {desc}')
print('\n'.join(out))
print(f'# events: {len(out)}', file=sys.stderr)
