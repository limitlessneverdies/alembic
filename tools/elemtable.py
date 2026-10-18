import struct, sys
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
B=0x14034F350
if len(sys.argv)>1 and sys.argv[1]=='table':
    print("i sym  mass      dens    eneg  melt boil u44 Z per grp val u4a_lo u4a_hi c4c c4d 4e")
    for i in range(92):
        o=va2raw(B+i*0x50); b=D[o:o+0x50]
        sym_ptr,sym_len=struct.unpack_from('<QQ',b,0)
        mass,dens,eneg,z3c=struct.unpack_from('<ffff',b,0x30)
        melt,boil,u44=struct.unpack_from('<hhH',b,0x40)
        Z,per,grp,val=b[0x46],b[0x47],b[0x48],b[0x49]
        u4a=struct.unpack_from('<H',b,0x4a)[0]
        c4c,c4d,u4e=b[0x4c],b[0x4d],struct.unpack_from('<H',b,0x4e)[0]
        sym=D[va2raw(sym_ptr):va2raw(sym_ptr)+sym_len].decode()
        name_ptr,name_len=struct.unpack_from('<QQ',b,0x10)
        nm=D[va2raw(name_ptr):va2raw(name_ptr)+name_len].decode()
        print(f"{i:2d} {sym:2s} {mass:8.3f} {dens:8.4f} {eneg:5.2f} {melt:5d} {boil:5d} {u44:3d} {Z:2d} {per:2d} {grp:3d} {val:3d}  0x{u4a&0xff:02X}   0x{u4a>>8:02X}   {c4c:d}   {c4d:d}  {u4e}  {nm}")
for i in range(92):
    o=va2raw(B+i*0x50); b=D[o:o+0x50]
    print(f"raw {i:2d} " + ' '.join(f'{x:02X}' for x in b[0x30:0x50]))
