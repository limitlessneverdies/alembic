import sys, struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(PATH, 'rb').read()
def u16(o): return struct.unpack_from('<H', DATA, o)[0]
def u32(o): return struct.unpack_from('<I', DATA, o)[0]
def u64(o): return struct.unpack_from('<Q', DATA, o)[0]
def sections():
    e_lfanew = u32(0x3C); coff = e_lfanew + 4
    nsec = u16(coff + 2); optsz = u16(coff + 16); opt = coff + 20
    magic = u16(opt); ib = u64(opt + 24) if magic == 0x20B else u32(opt + 28)
    out = []; sec = opt + optsz
    for i in range(nsec):
        s = sec + i * 40
        name = DATA[s:s + 8].rstrip(b'\0').decode('latin1')
        vsz = u32(s + 8); va = u32(s + 12); rsz = u32(s + 16); raw = u32(s + 20)
        out.append((name, ib + va, vsz, raw, rsz))
    return ib, out
IB, SECS = sections()
def va2raw(va):
    for name, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz): return raw + (va - base)
    return None

if __name__ == '__main__':
    va = int(sys.argv[1], 16); n = int(sys.argv[2], 0)
    o = va2raw(va)
    b = DATA[o:o + n]
    # print as one line: escaped text
    txt = ''.join(chr(c) if 32 <= c < 127 else ('\\x%02x' % c) for c in b)
    print(f'VA {va:#x} len {n}:')
    print(repr(b.decode('latin1')))
    # also split on NUL
    print('--- nul-split ---')
    for i, s in enumerate(b.split(b'\x00')):
        if s: print(f'  +{i if False else 0} chunk {i}: {s.decode("latin1")!r}')
