import struct
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
B=0x140364854; N=0x50
print("jump table @0x140364854 indexed by (substance_id - 0x26), 80 entries:")
for i in range(N):
    o=va2raw(B+i*4); off=struct.unpack_from('<i',D,o)[0]
    tgt=B+off
    sid=0x26+i
    print(f"  idx {i:2d} sub 0x{sid:02X} ({sid:3d}) -> 0x{tgt:09X}")
