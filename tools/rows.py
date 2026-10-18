import struct, sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw

def rows(va, n, stride=8):
    o = va2raw(va)
    for i in range(n):
        off = o + i*stride
        b = DATA[off:off+stride]
        f = struct.unpack_from('<f', b, 4)[0]
        u = struct.unpack_from('<I', b, 4)[0]
        by = b[0]
        if u != 0 or by != 0:
            print(f'  [{i:3d}] 0x{va+i*stride:X}  byte={by:#04x} f32@+4={f!r} u32=0x{u:08X}')

if __name__ == '__main__':
    va = int(sys.argv[1], 16); n = int(sys.argv[2], 0)
    st = int(sys.argv[3], 0) if len(sys.argv) > 3 else 8
    rows(va, n, st)
