import struct, sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, raw2va, va2raw

# scan a VA range for call rel32 / call [rip+disp] / call reg
lo, hi = int(sys.argv[1], 16), int(sys.argv[2], 16)
o = va2raw(lo)
e = va2raw(hi)
buf = DATA
res = []
i = o
while i < e - 6:
    b = buf[i]
    if b == 0xE8:
        rel = struct.unpack_from('<i', buf, i + 1)[0]
        iv = raw2va(i)
        tgt = iv + 5 + rel
        if 0x140001000 <= tgt <= 0x1407A0000:
            res.append((iv, tgt, 'direct'))
        i += 5
        continue
    if b == 0xFF:
        m = buf[i + 1]
        if (m & 0x38) == 0x10:
            if (m & 0xC7) == 0x05:
                disp = struct.unpack_from('<i', buf, i + 2)[0]
                iv = raw2va(i)
                tgt = iv + 6 + disp
                res.append((iv, tgt, 'mem'))
                i += 6
                continue
            elif m >= 0xD0:
                res.append((raw2va(i), 0, 'reg'))
                i += 2
                continue
    i += 1
for t in res:
    if t[2] == 'reg':
        print(f'{t[0]:012X}\t{t[1]:012X}\treg')
    else:
        print(f'{t[0]:012X}\t{t[1]:012X}\t{t[2]}')
print(f'# total calls: {len(res)}', file=sys.stderr)
