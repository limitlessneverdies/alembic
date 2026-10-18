import sys, struct, json
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw

start = 0x34E150
stride = 0x50
n = 92
out = []
for k in range(n):
    o = start + k * stride
    def gr(off):
        p, l = struct.unpack_from('<QQ', DATA, o + off)
        r = va2raw(p)
        if r is not None and 1 <= l <= 400:
            return DATA[r:r + l].decode('latin1', 'replace')
        return None
    sym = gr(0x00); name = gr(0x10); desc = gr(0x20)
    mass, dens, eneg, f3c = struct.unpack_from('<ffff', DATA, o + 0x30)
    tail = DATA[o + 0x40:o + 0x50]
    i16s = struct.unpack_from('<8h', DATA, o + 0x40)
    u8s = list(tail)
    out.append({'i': k, 'sym': sym, 'name': name, 'desc': desc,
                'mass': mass, 'density': dens, 'eneg': eneg, 'f3c': f3c,
                'tail_hex': tail.hex(), 'tail_i16': list(i16s), 'tail_u8': u8s})
json.dump(out, open(r'C:\Users\limit\rea-tools\elements92.json', 'w'), indent=1)
for e in out:
    print(f"{e['i']:3d} {str(e['sym']):3s} {str(e['name']):14s} m={e['mass']:<8.3f} d={e['density']:<10.6f} eneg={e['eneg']:<5.2f} f3c={e['f3c']:<3} tail={e['tail_hex']}")
