import sys, struct
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, raw2va, va2raw

# Find structures of consecutive (ptr,len) string tuples where ptr -> printable ASCII in image.
# usage: python tuplefind.py <startraw> <endraw> [npairs=3] [maxlen=200] [stride_if_hit=16*npairs]
start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
npairs = int(sys.argv[3]) if len(sys.argv) > 3 else 3
maxlen = int(sys.argv[4]) if len(sys.argv) > 4 else 200

o = start
while o < end - 16 * npairs:
    ok = True
    parts = []
    for k in range(npairs):
        p, l = struct.unpack_from('<QQ', DATA, o + 16 * k)
        if not (0x140001000 <= p <= 0x1407A0000) or not (1 <= l <= maxlen):
            ok = False
            break
        po = va2raw(p)
        if po is None or po + l > len(DATA):
            ok = False
            break
        seg = DATA[po:po + l]
        if not all(32 <= b <= 126 for b in seg):
            ok = False
            break
        parts.append(seg.decode('latin1'))
    if ok:
        va = raw2va(o)
        s = ' | '.join(f'"{t}"' for t in parts)
        print(f'0x{o:06X} (va {va:012X}): {s}')
        o += 16 * npairs
    else:
        o += 8
