import struct, sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, SECS

# Scan .text for RIP-relative LEA and MOV imm64 references to in-image addresses.
# Output: TSV instr_va target_va kind
# kind = L (lea rip-relative) or M (mov imm64)

TEXT = None
for name, base, vsz, raw, rsz in SECS:
    if name == '.text':
        TEXT = (raw, raw + rsz, base)

out = open(sys.argv[1], 'w', encoding='utf-8') if len(sys.argv) > 1 else sys.stdout
raw_start, raw_end, base = TEXT
buf = DATA
countL = 0
countM = 0
o = raw_start
while o < raw_end - 10:
    b0 = buf[o]
    if (b0 == 0x48 or b0 == 0x4C) and buf[o + 1] == 0x8D and (buf[o + 2] & 0xC7) == 0x05:
        instr_va = base + (o - raw_start)
        disp = struct.unpack_from('<i', buf, o + 3)[0]
        target = (instr_va + 7 + disp) & 0xFFFFFFFFFFFFFFFF
        if 0x140001000 <= target <= 0x1407A0000:
            print(f'{instr_va:012X}\t{target:012X}\tL', file=out)
            countL += 1
        o += 7
        continue
    if (b0 == 0x48 or b0 == 0x49) and 0xB8 <= buf[o + 1] <= 0xBF:
        instr_va = base + (o - raw_start)
        imm = struct.unpack_from('<Q', buf, o + 2)[0]
        if 0x140001000 <= imm <= 0x1407A0000:
            print(f'{instr_va:012X}\t{imm:012X}\tM', file=out)
            countM += 1
        o += 10
        continue
    o += 1
print(f'# lea={countL} mov={countM}', file=out)
out.close() if out is not sys.stdout else None
print(f'DONE lea={countL} mov={countM}')
