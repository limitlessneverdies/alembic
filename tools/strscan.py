"""strscan.py <keyword>... : find ASCII strings in the exe with their VA.
VA = file_offset - 0x140001200 for .rdata-style offsets (raw->VA mapping used in this project).
Also prints neighbouring strings so a table can be identified.
"""
import re, sys, struct

PATH = r'C:\Users\limit\Desktop\alembic.exe'
d = open(PATH, 'rb').read()

# section map
nsec = struct.unpack_from('<I', d, 0x140 + 4)[0] if False else None
# parse PE headers manually
pe = struct.unpack_from('<I', d, 0x3C)[0]
assert d[pe:pe+4] == b'PE\0\0'
nsec = struct.unpack_from('<H', d, pe + 6)[0]
opt = struct.unpack_from('<H', d, pe + 20)[0]
secs = []
base = pe + 24 + opt
for i in range(nsec):
    o = base + i * 40
    name = d[o:o+8].rstrip(b'\0').decode('latin1')
    vsize, vaddr, rawsize, rawptr = struct.unpack_from('<IIII', d, o + 8)
    secs.append((name, vaddr, vsize, rawptr, rawsize))

def off2va(off):
    for name, va, vs, rp, rs in secs:
        if rp <= off < rp + rs:
            return va + (off - rp)
    return None

def va2off(va):
    for name, v, vs, rp, rs in secs:
        if v <= va < v + vs:
            return rp + (va - v)
    return None

kws = [k.encode() for k in sys.argv[1:]]
rx = re.compile(rb'[\x20-\x7e]{3,60}')
hits = []
for mm in rx.finditer(d):
    s = mm.group()
    if any(k.lower() in s.lower() for k in kws):
        hits.append((off2va(mm.start()), s.decode('latin1')))
for va, s in hits:
    print('%012X  %r' % (va, s))
print('--- %d hits' % len(hits))
