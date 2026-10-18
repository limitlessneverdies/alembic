import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
    return None
def raw2va(raw):
    for base,rawbase,size in [(0x140001000,0x400,0x2DE000),(0x1402DF000,0x2DDE00,0x364000),(0x140642000,0x640600,0x400000)]:
        if rawbase <= raw < rawbase+size: return base + (raw-rawbase)
    return None
STR0 = 0x1402F7378  # start of 'Empty'
hits = []
for raw in range(0, len(D)-16):
    v = struct.unpack_from('<Q', D, raw)[0]
    if STR0 <= v < STR0+0x700:
        l = struct.unpack_from('<Q', D, raw+8)[0]
        if 0 < l <= 24:
            hits.append((raw, v, l))
print('candidate (ptr,len) entries:', len(hits))
for raw,v,l in hits[:80]:
    print('  entry at va %s -> %r len=%d' % (('%012X'%raw2va(raw)) if raw2va(raw) else '?', D[va2raw(v):va2raw(v)+l], l))
