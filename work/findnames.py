import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH, 'rb').read()
def raw2va(r):
    if 0x400 <= r < 0x2DDE00: return r + 0x140001000 - 0x400
    if 0x2DDE00 <= r < 0x640600: return r + 0x1402DF000 - 0x2DDE00
    if 0x640600 <= r: return r + 0x140642000 - 0x640600
for w in [b'Spawner', b'ThermalPlate', b'Conveyor', b'Insulation', b'Sensor', b'Generator', b'BattPos']:
    off = 0
    print('===', w.decode())
    while True:
        i = D.find(w, off)
        if i < 0: break
        print('   raw 0x%X VA 0x%X ctx=%r' % (i, raw2va(i), D[max(0,i-24):i+len(w)+24].decode('latin1')))
        off = i + 1
