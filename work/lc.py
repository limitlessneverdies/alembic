import sys
p = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
a = int(sys.argv[1]); b = int(sys.argv[2])
ls = open(p, encoding='utf-8', errors='replace').read().splitlines()
if len(sys.argv) > 3:
    out = open(sys.argv[3], 'w', encoding='utf-8')
else:
    out = sys.stdout
for i in range(a - 1, min(b, len(ls))):
    out.write('%d %s\n' % (i + 1, ls[i]))
