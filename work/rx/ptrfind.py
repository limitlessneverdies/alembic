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
def find_ptr(val, start_raw=0x2DDE00, end_raw=0x662000):
    pat = struct.pack('<Q', val)
    out=[]; i=start_raw
    while True:
        j = data.find(pat, i, end_raw)
        if j<0: break
        out.append(j); i=j+1
    return out
if __name__=='__main__':
    for a in sys.argv[1:]:
        va=int(a,16)
        for r in find_ptr(va):
            print(f'ref_to {va:012X} at raw 0x{r:06X} (VA 0x{va_of(r):012X})')
