import sys
bigf = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
idx = r'C:\Users\limit\rea-tools\func-index.txt'
if len(sys.argv) < 2:
    print('usage: python slicefunc.py <FUN_name> [outfile]'); sys.exit(1)
name = sys.argv[1]
outf = sys.argv[2] if len(sys.argv) > 2 else None
entries = []
for line in open(idx):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        entries.append((int(parts[0][1:]), parts[1]))
entries.sort()
found = None
for k, (ln, nm) in enumerate(entries):
    if nm == name:
        found = k
        break
if found is None:
    print('not found in index'); sys.exit(1)
start = entries[found][0]
end = entries[found + 1][0] if found + 1 < len(entries) else None
lines = open(bigf, encoding='utf-8', errors='replace').read().splitlines()
seg = lines[start - 1:end - 1] if end else lines[start - 1:]
text = '\n'.join(seg)
if outf:
    open(outf, 'w', encoding='utf-8').write(text)
    print(f'wrote {len(seg)} lines to {outf}')
else:
    print(text)
