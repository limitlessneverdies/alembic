"""Dump the in-game CONTROLS help panel sections.

Section table at raw 0x34C558 (VA 0x14034D758): 8 * 0x20 bytes
{title_ptr, title_len, rows_ptr, row_count}. Rows 0x20 bytes each:
{key_ptr, key_len, text_ptr, text_len}.
"""
import sys, io, struct
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from ndis import data

RAW2VA = lambda raw: raw + 0x140001200

SEC = 0x34C558
out = []
for i in range(8):
    o = SEC + i * 0x20
    tp, tl, rp, rc = struct.unpack('<QQQQ', data[o:o + 0x20])
    title = data[tp - 0x140001200: tp - 0x140001200 + tl].decode('utf-8', 'replace')
    out.append('== SECTION %d: %r  (rows %d, rows_ptr 0x%X)' % (i, title, rc, rp))
    for j in range(rc):
        ro = rp - 0x140001200 + j * 0x20
        kp, kl, xp, xl = struct.unpack('<QQQQ', data[ro:ro + 0x20])
        k = data[kp - 0x140001200: kp - 0x140001200 + kl].decode('utf-8', 'replace')
        x = data[xp - 0x140001200: xp - 0x140001200 + xl].decode('utf-8', 'replace')
        out.append('   [%d] key=%r  text=%r' % (j, k, x))
print('\n'.join(out))
