import struct, sys, json
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw, u32, f32

ELS = json.load(open(r'C:\Users\limit\rea-tools\elements92.json'))
rawk = va2raw(0x14035D008)
KINDS = DATA[rawk:rawk+92]
KZ = {}
for i, e in enumerate(ELS):
    KZ[KINDS[i]] = (i + 1, e.get('sym', '?'))

def sym(k):
    if k in KZ:
        z, s = KZ[k]
        return f'Z={z} {s}'
    return ''

print('=== kind->Z map (table 0x14035D008, 92 entries) ===')
print(' '.join(f'{KINDS[i]:#04x}:{i+1}{ELS[i].get("sym","?")}' for i in range(92)))
print()
print('=== table A 0x140358490 stride 0xc ===')
o = va2raw(0x140358490)
for i in range(0, 200):
    off = o + i * 12
    a, b = struct.unpack_from('<II', DATA, off)
    c = DATA[off + 8]
    if a or b or c:
        print(f'  kind {i:3d} (0x{i:02x}) {sym(i):>9}  a={a:>7} b={b:>7} byte8={c:#04x} tail={DATA[off+9:off+12].hex()}')
print()
print('=== table B 0x14035B508 stride 4 (u16,u16) ===')
o = va2raw(0x14035B508)
for i in range(0, 200):
    v = struct.unpack_from('<H', DATA, o + i * 4)[0]
    v2 = struct.unpack_from('<H', DATA, o + i * 4 + 2)[0]
    if v or v2:
        print(f'  kind {i:3d} (0x{i:02x}) {sym(i):>9}  u16={v} u16b={v2}')
