import sys, os
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw

SYS_OUT = r'C:\Users\limit\rea-tools\systems'
SIM_TIMELINE = r'C:\Users\limit\rea-tools\sim_timeline.txt'
MAP_OUT = r'C:\Users\limit\rea-tools\sim_sections.txt'

def read_text(path):
    raw = open(path, 'rb').read()
    if raw[:2] == b'\xff\xfe':
        return raw.decode('utf-16')
    try:
        return raw.decode('utf-8')
    except UnicodeDecodeError:
        return raw.decode('latin1')

POOL_BASE = 0x140356D20
POOL_LEN = 886
pool = DATA[va2raw(POOL_BASE): va2raw(POOL_BASE) + POOL_LEN]

# function starts
starts = {}
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        try:
            starts[int(parts[2][1:], 16)] = parts[1]
        except ValueError:
            pass

ev = []
for line in read_text(SIM_TIMELINE).splitlines():
    if not line or line.startswith('#'):
        continue
    parts = line.split()
    if len(parts) < 3:
        continue
    iv = int(parts[0], 16)
    if parts[1] == 'LEA-NAME':
        ev.append((iv, 'NAME', int(parts[2], 16), ''))
    elif parts[1] == 'CALL':
        tgt = int(parts[2], 16)
        nm = parts[3] if len(parts) > 3 and not parts[3].isdigit() else ''
        kind = parts[4] if len(parts) > 4 else (parts[3] if len(parts) == 4 and parts[3] in ('mem', 'reg', 'direct') else '')
        ev.append((iv, 'CALL', tgt, nm, kind))
ev.sort()

targets = sorted(set(t[2] for t in ev if t[1] == 'NAME'))

def name_of(tv):
    off = tv - POOL_BASE
    if off < 0 or off >= POOL_LEN:
        return '??'
    nxt = POOL_BASE + POOL_LEN
    for t in targets:
        if t > tv:
            nxt = t
            break
    return pool[off:nxt - POOL_BASE].decode('latin1')

sections = []
cur = None
for t in ev:
    if t[1] == 'NAME':
        cur = {'name': name_of(t[2]), 'va': t[2], 'instr': t[0], 'calls': []}
        sections.append(cur)
    elif cur is not None:
        cur['calls'].append((t[0], t[2], t[3], t[4]))

# write map
lines = []
callee_count = {}
for i, s in enumerate(sections):
    calls = s['calls']
    uniq = []
    for iv, tgt, nm, kind in calls:
        key = (tgt, kind)
        if uniq and uniq[-1][0] == key:
            uniq[-1][2] += 1
        else:
            uniq.append([key, nm, 1])
        callee_count[(tgt, kind, nm)] = callee_count.get((tgt, kind, nm), 0) + 1
    lines.append(f'## {i+1:02d} {s["name"]} @{s["instr"]:012X} lea=0x{s["va"]:X} calls={len(calls)}')
    for key, nm, cnt in uniq:
        dup = f' x{cnt}' if cnt > 1 else ''
        lines.append(f'   {key[0]:012X} {nm} [{key[1]}]{dup}')
open(MAP_OUT, 'w', encoding='utf-8').write('\n'.join(lines) + '\n')

# extract unique helper bodies (direct calls to .text functions with known start, skip 0x1402D0000+ runtime and thunks)
os.makedirs(SYS_OUT, exist_ok=True)
whole = {}
for (tgt, kind, nm), cnt in callee_count.items():
    if kind != 'direct':
        continue
    if not (0x140001000 <= tgt <= 0x1402DF000):
        continue
    if tgt >= 0x1402D0000:
        continue
    fn = starts.get(tgt)
    if not fn or fn.startswith('thunk_'):
        continue
    whole[tgt] = fn

print(f'systems: {len(sections)}')
print(f'unique helper functions to extract: {len(whole)}')
# slice them
bigf = open(r'C:\Users\limit\rea-tools\decompiled\alembic_all_decompiled.c', encoding='utf-8', errors='replace').read().splitlines()
entries = []
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        entries.append((int(parts[0][1:]), parts[1]))
entries.sort()
pos = {}
for k, (ln, nm) in enumerate(entries):
    pos[nm] = k
done = 0
for tgt, fn in sorted(whole.items()):
    k = pos.get(fn)
    if k is None:
        continue
    start = entries[k][0]
    end = entries[k + 1][0] if k + 1 < len(entries) else None
    seg = bigf[start - 1:end - 1] if end else bigf[start - 1:]
    out = os.path.join(SYS_OUT, fn + '.txt')
    open(out, 'w', encoding='utf-8').write('\n'.join(seg))
    done += 1
print(f'bodies extracted: {done} -> {SYS_OUT}')

# print top-level summary
for i, s in enumerate(sections):
    print(f'{i+1:02d} {s["name"]}')
