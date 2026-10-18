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
def s_at(va,n=60):
    o=va2raw(va)
    if o is None: return None
    return D[o:o+n].decode('latin1','replace')

LO = 0x1402E9375; HI = 0x1402E9A00
hits=[]
for raw in range(0, len(D)-16):
    v = struct.unpack_from('<Q', D, raw)[0]
    if LO <= v < HI:
        hits.append((raw,v))
print('hits:', len(hits))
for raw,v in hits:
    print(' ptr@%s -> %012X  %r' % (('%012X'%raw2va(raw)) if raw2va(raw) else '?', v, s_at(v,70)))
