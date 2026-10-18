import struct
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
B=0x14034F350
SPRITE=0x14035D008
CAT=['H/other','alkali','alkaline-earth','transition','post-transition','metalloid','nonmetal','halogen','noble-gas','lanthanide','actinide']
STATE=['solid','liquid','gas']
print("| idx | sym | Z | name | mass | dens | eneg | melt | boil | +3C | +44 | cat(+4B) | st(+4C) | val(+49) | row(+47) | grp(+48) | decay->(+4A) |")
NAMES={}
for i in range(92):
    o=va2raw(SPRITE+i)
    tile=D[o]
    b=D[va2raw(B+i*0x50):va2raw(B+i*0x50)+0x50]
    np_,nl=struct.unpack_from('<QQ',b,0x10)
    NAMES[tile]=D[va2raw(np_):va2raw(np_)+nl].decode()
print("|----:|:----|--:|:-----|-----:|-----:|-----:|-----:|-----:|----:|----:|:---------|:--------|:--------|:---------|:---------|:------------|")
for i in range(92):
    o=va2raw(B+i*0x50); b=D[o:o+0x50]
    sp,sl=struct.unpack_from('<QQ',b,0)
    sym=D[va2raw(sp):va2raw(sp)+sl].decode()
    np_,nl=struct.unpack_from('<QQ',b,0x10)
    nm=D[va2raw(np_):va2raw(np_)+nl].decode()
    mass,dens,eneg,d3c=struct.unpack_from('<fffI',b,0x30)
    melt,boil,u44=struct.unpack_from('<hhH',b,0x40)
    Z,row,grp,val,prod,cat,st,dfn=b[0x46],b[0x47],b[0x48],b[0x49],b[0x4a],b[0x4b],b[0x4c],b[0x4d]
    sp_tile=D[va2raw(SPRITE)+i]
    dst='-'
    if prod:
        dst=NAMES.get(D[va2raw(SPRITE)+i] and prod, None) or f'tile0x{prod:02X}'
    print(f"| {i} | {sym} | {Z} | {nm} | {mass:g} | {dens:g} | {eneg:g} | {melt} | {boil} | {d3c} | {u44} | {cat}={CAT[cat] if cat<11 else '?'} | {st}={STATE[st] if st<3 else '?'} | {val} | {row} | {grp} | {dst}{' (0x%02X)'%prod if prod else ''} |")
