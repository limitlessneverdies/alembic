import struct, sys, json
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw, u32, f32  # type: ignore

ELS = json.load(open(r'C:\Users\limit\rea-tools\elements92.json'))
rawk = va2raw(0x14035D008)
KINDS = DATA[rawk:rawk + 92]
KZ = {KINDS[i]: (i + 1, ELS[i].get('sym', '?')) for i in range(92)}


def sym(k):
    return f'Z={KZ[k][0]}{KZ[k][1]}' if k in KZ else ''


def cstr(va, n=64):
    o = va2raw(va)
    if o is None:
        return None
    b = DATA[o:o + n]
    s = b.split(b'\0')[0]
    try:
        t = s.decode('utf-8')
        return t if all(32 <= ord(c) < 127 for c in t) else None
    except Exception:
        return None


print('=== f64/f32 constants ===')
for va in (0x1402F6840, 0x1402F6870, 0x1402F6878, 0x1402F68C0, 0x1402F69C0, 0x1402F69C8,
           0x1402DF470, 0x1402DF460, 0x1402DF264, 0x1402DFA34, 0x1402F5444, 0x1402F6630,
           0x1402F6DB0, 0x1402F6DB4, 0x1402DFE40, 0x1402DFE44, 0x1402DF07C, 0x1402F6D10,
           0x1402F6D18, 0x1402F6D20, 0x1402F6D24, 0x1402F76FC, 0x1402DFA34):
    o = va2raw(va)
    if o is None:
        print(f'  {va:#x}: <unmapped>')
        continue
    f32v = struct.unpack_from('<f', DATA, o)[0]
    f64v = struct.unpack_from('<d', DATA, o)[0]
    u = struct.unpack_from('<I', DATA, o)[0]
    q = struct.unpack_from('<Q', DATA, o)[0]
    print(f'  {va:#x}: f32={f32v!r:<24} f64={f64v!r:<24} u32={u:#x} u64={q:#x}')

print()
print('=== table P 0x140358490 stride 0xc (kind -> ...) ===')
o = va2raw(0x140358490)
for i in range(0, 0x8E):
    off = o + i * 12
    a = struct.unpack_from('<I', DATA, off)[0]
    i16a = struct.unpack_from('<h', DATA, off + 4)[0]
    i16b = struct.unpack_from('<h', DATA, off + 6)[0]
    b8 = DATA[off + 8]
    tail = DATA[off + 9:off + 12].hex()
    af = struct.unpack_from('<f', DATA, off)[0]
    if a or i16a or i16b or b8 or tail != '000000':
        print(f'  {i:#04x} {sym(i):>8}  f32@0={af!r:<20} i16@4={i16a:>6} i16@6={i16b:>6} b8={b8:#04x} t={tail}')

print()
print('=== table Q 0x14035AE6C stride 0xc (kind -> ...) ===')
o = va2raw(0x14035AE6C)
for i in range(0, 0x8E):
    off = o + i * 12
    af = struct.unpack_from('<f', DATA, off)[0]
    a = struct.unpack_from('<I', DATA, off)[0]
    u16a = struct.unpack_from('<H', DATA, off + 4)[0]
    u16b = struct.unpack_from('<H', DATA, off + 6)[0]
    b8 = DATA[off + 8]
    tail = DATA[off + 9:off + 12].hex()
    if a or u16a or u16b or b8 or tail != '000000':
        print(f'  {i:#04x} {sym(i):>8}  f32@0={af!r:<20} u16@4={u16a:#06x} u16@6={u16b:#06x} b8={b8:#04x} t={tail}')

print()
print('=== table R 0x14035B508 stride 4 ===')
o = va2raw(0x14035B508)
for i in range(0, 0x8E):
    off = o + i * 4
    u16a = struct.unpack_from('<H', DATA, off)[0]
    u16b = struct.unpack_from('<H', DATA, off + 2)[0]
    if u16a or u16b:
        print(f'  {i:#04x} {sym(i):>8}  u16@0={u16a} {u16a:#06x}  u16@2={u16b} {u16b:#06x}')

print()
print('=== compound table 0x140644820 (256 ptrs) ===')
base = va2raw(0x140644820)
for i in range(256):
    p = struct.unpack_from('<Q', DATA, base + i * 8)[0]
    if not p:
        continue
    po = va2raw(p)
    if po is None:
        print(f'  id {i:#04x}: ptr {p:#x} unmapped')
        continue
    hx = DATA[po:po + 0x40]
    tag = hx[0:4]
    tagstr = ''.join(chr(c) if 32 <= c < 127 else '.' for c in tag)
    strs = []
    for off in (8, 0x10, 0x20, 0x28, 0x30):
        if off + 16 <= len(hx):
            sp = struct.unpack_from('<Q', hx, off)[0]
            sl = struct.unpack_from('<Q', hx, off + 8)[0]
            if 0 < sl < 64:
                s = cstr(sp, sl + 1)
                if s and len(s) >= sl:
                    strs.append(f'@{off:#x}={s!r}')
    print(f'  id {i:#04x} ptr={p:#x} tag={tagstr!r} ' + hx.hex(' ') + ' ' + ' '.join(strs))
