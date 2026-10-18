import re

t = open(r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c', encoding='utf-8', errors='replace').read()
hdrs = []
for m in re.finditer(r'// ==== FUNC (FUN_[0-9a-f]+) @ ([0-9a-f]+) ====', t):
    hdrs.append(int(m.group(2), 16))
hdrs = sorted(set(hdrs))

lines = []
lines.append('# alembic_all_extracted.c — extract-dump holes')
lines.append('# Regions of .text with NO function body in the 15.5 MB dump.')
lines.append('# Format: start_va  end_va  size_bytes  (end is exclusive; next defined function)')
lines.append('# These regions were not carved at export time (extractr timeout or skipped batches).')
lines.append('# Reproduce: re-run Ghidra headless / REA per-function on these ranges.')
lines.append('')
total = 0
for a, b in zip(hdrs, hdrs[1:]):
    if b - a > 0x3000:
        lines.append(f'0x{a:08X}  0x{b:08X}  {b - a}  ({(b-a)/1024:.1f} KiB)')
        total += b - a
lines.append('')
lines.append(f'# total hole bytes: {total} ({total/1024:.1f} KiB)')
lines.append(f'# defined functions in dump: {len(hdrs)}  (Ghidra reports 8415 total procedures)')
open(r'C:\Users\limit\rea-tools\dump-gaps.txt', 'w', encoding='utf-8').write('\n'.join(lines) + '\n')
print('\n'.join(lines))
