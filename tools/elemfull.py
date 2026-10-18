import struct
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
def rd(va,n):
    o=va2raw(va); return D[o:o+n] if o is not None else None
def sec_of(va):
    if 0x140001000 <= va < 0x1402DF000: return '.text'
    if 0x1402DF000 <= va < 0x140642000: return '.rdata'
    if 0x140642000 <= va < 0x140837000: return '.data'
    return '?'
B=0x14034F350
for i in (0,16,25,34,83,91):
    b=rd(B+i*0x50,0x50)
    if not b: continue
    print(f"--- element index {i} ---")
    for off in range(0,0x50,0x10):
        row=b[off:off+0x10]
        print(f"  +0x{off:02X}: " + ' '.join(f'{x:02X}' for x in row))
    # interpret qwords as pointers
    for off in range(0,0x30,8):
        q=struct.unpack_from('<Q',b,off)[0]
        note=''
        if 0x1402DF000 <= q < 0x140642000:
            s=rd(q,48)
            try:
                t=s.split(b'\0')[0].decode('utf-8')
                if t: note=f'  -> .rdata str {t!r}'
            except Exception:
                note=f'  -> .rdata {s[:16].hex()}'
        print(f"   q{off:02X} = 0x{q:016X}{note}")
    for off in range(0x1c,0x30,4):
        u=struct.unpack_from('<I',b,off)[0]
        f=struct.unpack_from('<f',b,off)[0]
        print(f"   u32/f32[{off:02X}] = {u} / {f:g}")
