import sys, struct
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, find_qword, raw2va
vals = [int(a, 16) for a in sys.argv[1:]]
for v in vals:
    hits = find_qword(v, 0, len(DATA))
    if hits:
        parts = []
        for h in hits:
            va = raw2va(h)
            parts.append(f'0x{h:X}(va {va:012X})' if va else f'0x{h:X}')
        print(f'0x{v:X}: ' + ', '.join(parts))
    else:
        print(f'0x{v:X}: none')
