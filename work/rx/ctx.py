"""Show extracted C context: enclosing function + N lines around a given line number.
Usage: ctx.py <line> [before] [after]"""
import sys, re
BIG = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'
src = open(BIG, encoding='utf-8', errors='replace').read().splitlines()
line = int(sys.argv[1])
before = int(sys.argv[2]) if len(sys.argv) > 2 else 40
after = int(sys.argv[3]) if len(sys.argv) > 3 else 60
encl = None
for i in range(line-1, -1, -1):
    m = re.match(r'// ==== FUNC (FUN_[0-9a-f]+) @ ([0-9a-f]+) ====', src[i])
    if m:
        encl = (i+1, m.group(1), m.group(2))
        break
print(f'### line {line} is inside {encl[1]} @ 0x{encl[2]} (def at line {encl[0]})')
for j in range(max(0, line-1-before), min(len(src), line+after)):
    mark = ' <<<' if j == line-1 else ''
    print(f'{j+1:>7}  {src[j]}{mark}')
