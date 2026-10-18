import sys, bisect
lo, hi = int(sys.argv[1], 16), int(sys.argv[2], 16)
entries = []
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        try:
            entries.append((int(parts[2][1:], 16), parts[1]))
        except ValueError:
            pass
entries.sort()
starts = {a: n for a, n in entries}
out = []
for line in open(r'C:\Users\limit\rea-tools\lea-refs.txt'):
    if line.startswith('#'):
        continue
    p = line.split()
    if len(p) < 3:
        continue
    iv = int(p[0], 16)
    tv = int(p[1], 16)
    if lo <= iv <= hi:
        out.append((iv, tv))
text = [x for x in out if 0x140001000 <= x[1] <= 0x1402DF000]
data = [x for x in out if not (0x140001000 <= x[1] <= 0x1402DF000)]
print(f'leas in range: {len(out)} | text targets: {len(text)} | data targets: {len(data)}')
print('=== TEXT TARGETS (function pointer candidates) ===')
for iv, tv in text:
    nm = starts.get(tv, '')
    print(f'instr {iv:012X} -> {tv:012X}  {nm}')
print('=== DATA TARGETS ===')
for iv, tv in data:
    print(f'instr {iv:012X} -> {tv:012X}')
