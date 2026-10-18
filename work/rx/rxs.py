"""RX helper: locate strings in .rdata by substring, print VA + refs."""
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

def find_str(s):
    """find occurrences of a byte string; return VAs (assume .rdata)"""
    b = s.encode('utf-8') if isinstance(s,str) else s
    out=[]; i=0
    while True:
        j = data.find(b, i)
        if j<0: break
        out.append(j); i=j+1
    return [va_of(j) for j in out]

def find_imm(va):
    """find 4-byte and 8-byte immediates equal to va"""
    out=[]
    for sz,pat in (('u32',struct.pack('<I',va)),('u64',struct.pack('<Q',va))):
        i=0
        while True:
            j = data.find(pat, i)
            if j<0: break
            out.append((sz,j)); i=j+1
    return out

if __name__=='__main__':
    mode = sys.argv[1]
    if mode == 's':
        for a in sys.argv[2:]:
            for va in find_str(a):
                print(f'0x{va:012X} raw 0x{raw_of(va):06X}  "{a[:60]}"')
    elif mode == 'i':
        for a in sys.argv[2:]:
            va=int(a,16)
            for sz,j in find_imm(va):
                print(f'{sz} imm 0x{va:012X} at raw 0x{j:06X} VA 0x{va_of(j):012X}')
