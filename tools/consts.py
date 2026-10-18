import struct
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
def f32(va):
    o=va2raw(va); return struct.unpack_from('<f',D,o)[0] if o is not None else None
def u32(va):
    o=va2raw(va); return struct.unpack_from('<I',D,o)[0] if o is not None else None
def u64(va):
    o=va2raw(va); return struct.unpack_from('<Q',D,o)[0] if o is not None else None

for va in (0x1402DF460,0x1402DF264,0x1402DF008,0x1402DFA34,0x1402DF470,0x1402F69C0,0x1402F69C8,
           0x1402F6D38,0x1402DF5D0,0x1402F6B24,0x1402DF07C,0x1402F6848,0x1402F68C0,0x1402DF1EC):
    print(f"  0x{va:X} = f32 {f32(va)!r}  u32 0x{u32(va):08X}")
print()
for va in (0x1406420D0,0x1406420D8,0x1406420E0,0x1406420E8,0x1406420F0,0x1406420F8,
           0x140642100,0x140642108,0x140645958,0x140645020,0x14035D008):
    print(f"  0x{va:X} = u64 0x{u64(va):016X}")
