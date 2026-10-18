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
targets = {'Spawner':0x1402E0CD3,'Conveyor':0x1402E0CDA,'Pipe':0x1402E0CE2,'Filter':0x1402E0CE6,'Generator':0x1402E0CEC,'Fan':0x1402E0CF5,'Sensor':0x1402E0CF8,'ThermalPlate':0x1402E0CBE,'Battery':0x1402E0CA1,
           'Machines':0x1402E0CCB}
for name,va in targets.items():
    pat = struct.pack('<Q', va)
    i=0; hits=[]
    while True:
        j = D.find(pat, i)
        if j<0: break
        hits.append(raw2va(j)); i=j+1
    print('%-13s %012X refs=%d %s' % (name, va, len(hits), ' '.join('%012X'%h for h in hits[:24])))
