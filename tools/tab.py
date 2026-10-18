"""Resolve a rel32 jump table.

tab.py <table_va_hex> [count] [--entry]   (default: base-relative, LLVM style)
Prints index, raw i32 value, and resolved target (base-relative and entry-relative).
"""
import sys, io, struct
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from ndis import data

tbl = int(sys.argv[1], 16)
n = int(sys.argv[2]) if len(sys.argv) > 2 else 16
mode = 'base'
if '--entry' in sys.argv:
    mode = 'entry'

raw = data[tbl - 0x140001200: tbl - 0x140001200 + 4 * n]
vals = struct.unpack('<%di' % n, raw)
print('# table 0x%X (%s-relative)' % (tbl, mode))
for i, v in enumerate(vals):
    t_base = tbl + v
    t_entry = tbl + i * 4 + v
    print('%2d  raw=%-12d base=0x%X  entry=0x%X%s'
          % (i, v, t_base, t_entry, '   <--' if mode == 'base' else ''))
