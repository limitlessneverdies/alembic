import struct
from collections import Counter, defaultdict
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
def f32(va):
    o=va2raw(va); return struct.unpack_from('<f',D,o)[0]
B=0x1403649C0
print("second jump table @0x1403649C0 (per-substance, after a successful heat roll):")
c=Counter(); tg=defaultdict(list)
for i in range(0x50):
    o=va2raw(B+i*4); off=struct.unpack_from('<i',D,o)[0]
    tgt=B+off; sid=0x26+i
    c[tgt]+=1; tg[tgt].append(sid)
for tgt,n in c.most_common():
    ids=' '.join(f'0x{s:02X}' for s in tg[tgt])
    print(f"  -> 0x{tgt:09X} x{n:2d}   ids: {ids}")
for va in (0x1402DFC48,0x1402DFAB0,0x1402DF5D0):
    print(f"   const 0x{va:X} f32 = {f32(va)}")
