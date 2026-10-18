import sys, struct
EXE = r'C:\Users\limit\Desktop\alembic.exe'
data = open(EXE,'rb').read()
SECT = [(0x140001000, 0x400, 0x2DDE00-0x400),
        (0x1402DF000, 0x2DDE00, 0x640600-0x2DDE00),
        (0x140642000, 0x640600, 0x14070A000-0x140642000)]
def raw_of(va):
    for v,r,sz in SECT:
        if v <= va < v+sz: return r+(va-v)
def va_of(raw):
    for v,r,sz in SECT:
        if r <= raw < r+sz: return v+(raw-r)
def scan_range(lo, hi, step=1, align=None):
    """find 8-byte values in [lo,hi) anywhere in the file"""
    out=[]
    for pos in range(0x400, len(data)-8, step):
        val = struct.unpack_from('<Q', data, pos)[0]
        if lo <= val < hi:
            out.append((pos, val))
    return out
if __name__=='__main__':
    lo=int(sys.argv[1],16); hi=int(sys.argv[2],16)
    for pos,val in scan_range(lo,hi):
        print(f'raw 0x{pos:06X} VA 0x{va_of(pos):012X} -> 0x{val:012X}')
