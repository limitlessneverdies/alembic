import struct
P = r'C:\Users\limit\Desktop\alembic.exe'
D = open(P, 'rb').read()
def u16(o): return struct.unpack_from('<H', D, o)[0]
def u32(o): return struct.unpack_from('<I', D, o)[0]
def u64(o): return struct.unpack_from('<Q', D, o)[0]
def secs():
    e = u32(0x3C); c = e + 4
    n = u16(c + 2); o = u16(c + 16); opt = c + 20
    m = u16(opt); ib = u64(opt + 24) if m == 0x20B else u32(opt + 28)
    out = []; s = opt + o
    for i in range(n):
        t = s + i * 40
        out.append((D[t:t+8].rstrip(b'\0').decode('latin1'), ib + u32(t+12), u32(t+8), u32(t+20), u32(t+16)))
    return ib, out
IB, S = secs()
def va2raw(va):
    for nm, b, vs, raw, rs in S:
        if b <= va < b + max(vs, rs): return raw + (va - b)
    return None
def dbytes(va, n):
    o = va2raw(va); return D[o:o+n]

lines = []
# jump table 0x140360E44, 7 entries of i32 rel offsets
tbl = 0x140360E44
for i in range(7):
    rel = struct.unpack_from('<i', dbytes(tbl + i*4, 4), 0)[0]
    lines.append('dcmp selector case %d (byte==%d) -> 0x%X' % (i, i, tbl + rel))

# strings
for va, n in [(0x1403454B0, 0x100)]:
    b = dbytes(va, n)
    lines.append('str@0x%X: %r' % (va, b))

# hydration / phase tables near 0x140098410? just note existence
open(r'C:\Users\limit\alembic-re\work\dcmp_tbl.txt', 'w').write('\n'.join(lines) + '\n')
print('\n'.join(lines))
