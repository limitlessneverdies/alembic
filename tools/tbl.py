import struct, sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw, f32, u32, u64

def show(va, n, label=''):
    o = va2raw(va)
    print(f'--- 0x{va:X} {label}')
    for i in range(n):
        off = o + i * 8
        b = DATA[off:off+8]
        if len(b) < 8: break
        f1 = struct.unpack_from('<f', b, 0)[0]
        f2 = struct.unpack_from('<f', b, 4)[0]
        u1 = struct.unpack_from('<I', b, 0)[0]
        u2 = struct.unpack_from('<I', b, 4)[0]
        print(f'  [{i:3d}] 0x{va+i*8:X}  f32 {f1!r:>22} {f2!r:>22}   u32 0x{u1:08X} 0x{u2:08X}')

if __name__ == '__main__':
    va = int(sys.argv[1], 16)
    n = int(sys.argv[2], 0)
    show(va, n, ' '.join(sys.argv[3:]))
