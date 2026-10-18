import struct
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    # .text
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
def rd(va,n):
    o=va2raw(va); return D[o:o+n]

# substance kind data table, base 0x14035AE6C stride 0xC
T=0x14035AE6C
print("=== table @0x%X stride 0xC (substance id -> 12 bytes)" % T)
for i in range(0x7e):
    b=rd(T+i*0xC,0xC)
    hx=' '.join(f'{x:02X}' for x in b)
    u32a,u32b,b8=struct.unpack_from('<IIB',b,0)
    f0,f1,f2=struct.unpack_from('<fff',b,0)
    print(f" id 0x{i:02X} ({i:3d}): {hx}   u32=[{u32a:>10d},{u32b:>4d}] b8={b8:3d}  f=[{f0:g},{f1:g},{f2:g}]")

print()
print("=== table @0x14035B508 stride 4 (substance id -> u16[2]) ===")
T2=0x14035B508
for i in range(0x7e):
    b=rd(T2+i*4,4)
    u0,u1=struct.unpack_from('<HH',b,0)
    print(f" id 0x{i:02X} ({i:3d}): {u0:5d} (0x{u0:04X})  {u1:5d} (0x{u1:04X})")
