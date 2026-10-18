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
def cstr(va, maxn=200):
    o=va2raw(va)
    if o is None: return None
    s=D[o:o+maxn].split(b'\0')[0]
    try: return s.decode('utf-8')
    except Exception: return repr(s)

print("str @0x1402F7B64:", repr(cstr(0x1402F7B64)))
print()
T=0x140351010
print("=== table @0x%X stride 0x18 ===" % T)
for i in range(40):
    b=rd(T+i*0x18,0x18)
    if b is None: break
    p,l,u1,u2=struct.unpack_from('<QQII',b,0)
    print(f" [{i:2d}] ptr=0x{p:012X} len={l:3d} u1=0x{u1:08X}({u1}) u2=0x{u2:08X}({u2}) str={cstr(p) if 0x1402DF000<=p<0x140642000 else '?'!r}")
print()
print("=== names blob around 0x1402F7B30 ===")
for va in range(0x1402F7B30, 0x1402F7C00, 8):
    print(f"  0x{va:X}: {cstr(va,64)!r}")
