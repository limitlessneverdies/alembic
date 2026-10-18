import struct, sys

PATH = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(PATH, 'rb').read()

def u16(o): return struct.unpack_from('<H', DATA, o)[0]
def u32(o): return struct.unpack_from('<I', DATA, o)[0]
def u64(o): return struct.unpack_from('<Q', DATA, o)[0]
def f32(o): return struct.unpack_from('<f', DATA, o)[0]

def sections():
    e_lfanew = u32(0x3C)
    coff = e_lfanew + 4
    nsec = u16(coff + 2)
    optsz = u16(coff + 16)
    opt = coff + 20
    magic = u16(opt)
    ib = u64(opt + 24) if magic == 0x20B else u32(opt + 28)
    out = []
    sec = opt + optsz
    for i in range(nsec):
        s = sec + i * 40
        name = DATA[s:s + 8].rstrip(b'\0').decode('latin1')
        vsz = u32(s + 8); va = u32(s + 12); rsz = u32(s + 16); raw = u32(s + 20)
        out.append((name, ib + va, vsz, raw, rsz))
    return ib, out

IB, SECS = sections()

def va2raw(va):
    for name, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz):
            return raw + (va - base)
    return None

def raw2va(raw):
    for name, base, vsz, rawp, rsz in SECS:
        if rawp <= raw < rawp + rsz:
            return base + (raw - rawp)
    return None

def cstr(va, maxlen=300):
    o = va2raw(va)
    if o is None: return None
    e = DATA.find(b'\0', o)
    if e < 0: e = o + maxlen
    return DATA[o:min(e, o + maxlen)].decode('utf-8', 'replace')

def find_qword(val, start, end):
    pat = struct.pack('<Q', val)
    res = []
    i = start
    while True:
        i = DATA.find(pat, i, end)
        if i < 0: break
        res.append(i)
        i += 1
    return res

def hexdump(o, n, base_va=None):
    out = []
    for i in range(o, o + n, 16):
        chunk = DATA[i:i + 16]
        hexs = ' '.join(f'{b:02X}' for b in chunk)
        asc = ''.join(chr(b) if 32 <= b <= 126 else '.' for b in chunk)
        va = raw2va(i)
        tag = f' va {va:012X}' if va else ''
        out.append(f'{i:08X}{tag}  {hexs:<48} {asc}')
    return '\n'.join(out)

if __name__ == '__main__':
    cmd = sys.argv[1]
    if cmd == 'dump':
        o = int(sys.argv[2], 16); n = int(sys.argv[3], 0)
        print(hexdump(o, n))
    elif cmd == 'v':
        va = int(sys.argv[2], 16); n = int(sys.argv[3], 0)
        o = va2raw(va)
        if o is None:
            print('VA not mapped'); sys.exit(1)
        print(hexdump(o, n))
    elif cmd == 'q':
        val = int(sys.argv[2], 16); st = int(sys.argv[3], 16); en = int(sys.argv[4], 16)
        for o in find_qword(val, st, en):
            va = raw2va(o)
            print(f'0x{o:X} (va {va:012X})' if va else f'0x{o:X}')
    elif cmd == 's':
        print(repr(cstr(int(sys.argv[2], 16))))
    elif cmd == 'secs':
        print('ImageBase', hex(IB))
        for s in SECS:
            print(f'{s[0]:8s} VA {s[1]:012X} vsz {s[2]:#x} raw {s[3]:#x} rsz {s[4]:#x}')
    elif cmd == 'plen':
        # read (ptr,len) tuple at raw offset or va (with 'va' flag)
        t = sys.argv[2]
        o = int(sys.argv[3], 16) if t == 'raw' else va2raw(int(sys.argv[3], 16))
        p = u64(o); l = u64(o + 8)
        print(f'ptr=0x{p:X} (va {p:012X}) len={l}')
        if 0x140000000 <= p < 0x140000000 + len(DATA):
            print('str:', repr(cstr(p)))
    else:
        print('cmds: dump <raw> <len> | v <va> <len> | q <val> <start> <end> | s <va> | secs | plen <raw|va> <addr>')
