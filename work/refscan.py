import struct, sys
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH,'rb').read()
TEXT_VA = 0x140001000; TEXT_RAW = 0x400; TEXT_LEN = 0x2DE000
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
    return None
def raw2va(raw):
    for base,rawbase,size in [(0x140001000,0x400,0x2DE000),(0x1402DF000,0x2DDE00,0x364000),(0x140642000,0x640600,0x400000)]:
        if rawbase <= raw < rawbase+size: return base + (raw-rawbase)
    return None

def refs_to(target, lo=TEXT_RAW, hi=TEXT_RAW+TEXT_LEN-8):
    out=[]
    for o in range(lo, hi):
        v = struct.unpack_from('<i', D, o)[0]
        va_after = raw2va(o)
        if va_after is None: continue
        if va_after + 4 + v == target:
            out.append((o, raw2va(o)))
    return out

T = 0x14035AE6C
for t,name in [(0x14035AE6C,'substance_table'),(0x14035D008,'elem_map'),(0x14035AE6C,'-'),(0x1402EAB00,'nameptr_array')]:
    pass

for target in [0x14035AE6C, 0x14035D008, 0x1402EAB00]:
    r = refs_to(target)
    print('refs to %012X: %d' % (target, len(r)))
    for o,va in r[:20]:
        print('   at %012X (raw %08X)  bytes: %s' % (va, o, ' '.join('%02X'%x for x in D[o-8:o+8])))
