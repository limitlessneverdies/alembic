import struct, sys

EXE = r'C:\Users\limit\Desktop\alembic.exe'
d = open(EXE, 'rb').read()
val = int(sys.argv[1], 16)
pat = struct.pack('<Q', val)
i = 0
hits = []
while True:
    j = d.find(pat, i)
    if j < 0:
        break
    hits.append(j)
    i = j + 1
for h in hits[:80]:
    sec = ''
    if 0x2DDE00 <= h < 0x640600:
        sec = '.rdata'
    elif h >= 0x640600:
        sec = '.data'
    else:
        sec = '.text'
    print('fileoff %s  (next 16 bytes: %s)  %s' % (hex(h), d[h+8:h+24].hex(), sec))
print('total hits:', len(hits))
