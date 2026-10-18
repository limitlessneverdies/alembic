"""strrange.py <va_lo> <va_hi> [va2lo va2hi] : dump ASCII strings in range; optionally
list qword (ptr,len) pairs anywhere in the file whose ptr falls in [va2lo,va2hi)."""
import re, sys, struct

PATH = r'C:\Users\limit\Desktop\alembic.exe'
d = open(PATH, 'rb').read()
pe = struct.unpack_from('<I', d, 0x3C)[0]
nsec = struct.unpack_from('<H', d, pe + 6)[0]
opt = struct.unpack_from('<H', d, pe + 20)[0]
base = pe + 24 + opt
secs = []
for i in range(nsec):
    o = base + i * 40
    name = d[o:o+8].rstrip(b'\0').decode('latin1')
    vsize, vaddr, rawsize, rawptr = struct.unpack_from('<IIII', d, o + 8)
    secs.append((name, vaddr, vsize, rawptr, rawsize))

def va2off(va):
    for name, v, vs, rp, rs in secs:
        if v <= va < v + vs:
            return rp + (va - v)
    return None

def off2va(off):
    for name, v, vs, rp, rs in secs:
        if rp <= off < rp + rs:
            return v + (off - rp)
    return None

lo = int(sys.argv[1], 16); hi = int(sys.argv[2], 16)
o1, o2 = va2off(lo), va2off(hi)
print('== strings in %012X..%012X ==' % (lo, hi))
rx = re.compile(rb'[\x20-\x7e]{2,200}')
for mm in rx.finditer(d, o1, o2):
    print('%012X  %r' % (off2va(mm.start()), mm.group().decode('latin1')))

if len(sys.argv) > 4:
    plo = int(sys.argv[3], 16); phi = int(sys.argv[4], 16)
    print('== (ptr,len) pairs pointing into %012X..%012X ==' % (plo, phi))
    n = 0
    for off in range(0, len(d) - 16, 8):
        p, l = struct.unpack_from('<QQ', d, off)
        if plo <= p < phi and 0 < l < 64:
            va = off2va(off)
            if va is None:
                continue
            po = va2off(p)
            s = d[po:po+l] if po is not None else b'?'
            print('%012X  ptr=%012X len=%-3d %r' % (va, p, l, s))
            n += 1
            if n > 400:
                print('... truncated')
                break
