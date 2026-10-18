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

for s in [b'Spawner', b'Conveyor', b'Pipe', b'Filter', b'Fan', b'Insulation', b'Sensor', b'Generator']:
    i=0
    while True:
        j=D.find(s,i)
        if j<0: break
        # printable check around
        st=j
        while st>0 and 32<=D[st-1]<127: st-=1
        en=j
        while en<len(D) and 32<=D[en]<127: en+=1
        va=raw2va(st)
        print('%-11s raw=%08X va=%s  full=%r' % (s.decode(), st, ('%012X'%va) if va else '?', D[st:en]))
        i=j+1
