"""Find jump tables: locate 'movsxd reg, [reg+idx*4]' followed by 'add reg,X; jmp X'
and resolve the preceding lea reg,[rip+disp32] table base.

jtab.py [lo_hex] [hi_hex]   -- optional restriction window for printing
Prints every jump-table load found in .text with its table VA and the
first N resolved entries.
"""
import sys, io, struct, re
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from ndis import data

TEXT_VA = 0x140001000
TEXT_RAW = 0x400
TEXT_END_VA = 0x1402DEA00
code = data[TEXT_RAW:TEXT_RAW + (TEXT_END_VA - TEXT_VA)]

lo = int(sys.argv[1], 16) if len(sys.argv) > 1 else 0
hi = int(sys.argv[2], 16) if len(sys.argv) > 2 else (1 << 64)

# movsxd patterns: 48 63 04 82 (rdx), 48 63 04 81 (rcx), 48 63 04 80 (rax),
#                  48 63 04 87 (rdi), 48 63 04 86 (rsi) ...
pat = re.compile(rb'\x48\x63\x04[\x80-\x87]')
lea_pat = re.compile(rb'\x48\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]', re.S)

hits = []
for m in pat.finditer(code):
    va = TEXT_VA + m.start()
    if not (lo <= va < hi):
        continue
    # look back for a lea reg,[rip+disp32] within 30 bytes
    back = code[max(0, m.start() - 30):m.start()]
    found = None
    for lm in lea_pat.finditer(back):
        pos = m.start() - len(back) + lm.start()
        disp = struct.unpack('<i', code[pos + 3:pos + 7])[0]
        tva = TEXT_VA + pos + 7 + disp
        found = (TEXT_VA + pos, tva)
    hits.append((va, found))

print('# %d movsxd-table loads' % len(hits))
for va, found in hits:
    if found is None:
        print('0x%X  load (no lea found)' % va)
        continue
    lea_va, tva = found
    raw = data[tva - 0x140001200:tva - 0x140001200 + 4 * 16]
    vals = struct.unpack('<16i', raw)
    tgts = [tva + v for i, v in enumerate(vals)]
    sane = all(TEXT_VA <= t < TEXT_END_VA for t in tgts)
    print('0x%X  lea@0x%X table=0x%X  entries16=%s'
          % (va, lea_va, tva, ' '.join('%X' % t for t in tgts) if sane else 'OUT-OF-RANGE'))
