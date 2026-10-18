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
print("fmt str @0x1402F7CB8:", repr(rd(0x1402F7CB8,80).split(b'\0')[0]))
print()
blob=rd(0x1402F73F5, 0x500)
print("blob @0x1402F73F5:", repr(blob[:400].decode('utf-8','replace')))
print()
for name in (b'Rust',b'Salt',b'Derived',b'Gunpowder',b'Quartz',b'Firebrick'):
    i=blob.find(name)
    if i>=0: print(f"  {name.decode()} @ VA 0x{0x1402F73F5+i:X}")
print()
# the three u8[256] tables
for base in (0x14035DD64,0x14035DE64,0x14035DF64):
    b=rd(base,0x100)
    hist={}
    for x in b: hist[x]=hist.get(x,0)+1
    print(f"table 0x{base:X}: ndistinct={len(hist)} min={min(b)} max={max(b)}")
    print("   first 32:", ' '.join(f'{x:02X}' for x in b[:32]))
    print("   top:", sorted(hist.items(), key=lambda kv:-kv[1])[:8])
