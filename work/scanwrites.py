import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH,'rb').read()
TEXT_RAW=0x400; TEXT_LEN=0x2DE000
def raw2va(raw):
    for base,rawbase,size in [(0x140001000,0x400,0x2DE000),(0x1402DF000,0x2DDE00,0x364000),(0x140642000,0x640600,0x400000)]:
        if rawbase <= raw < rawbase+size: return base + (raw-rawbase)
    return None
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
    return None
# scan for 'mov byte ptr [reg+disp8], imm8' where disp8 == 0x0D and imm in 0x70..0x90
res=[]
for o in range(TEXT_RAW, TEXT_RAW+TEXT_LEN-6):
    b = D[o]
    if b == 0xC6:
        modrm = D[o+1]
        mod = modrm >> 6
        # reg-direct excluded
        if mod in (0,1,2):
            # determine disp length
            rm = modrm & 7
            # SIB?
            n = 2
            if rm == 4 and mod != 3:
                n += 1
            if mod == 1: n += 1
            elif mod == 2: n += 4
            elif mod == 0 and rm == 5: n += 4
            if mod == 1:
                disp = D[o+2] if rm != 4 else D[o+3]
            elif mod == 2:
                disp = struct.unpack_from('<i', D, o+2)[0] if rm != 4 else struct.unpack_from('<i', D, o+3)[0]
            else:
                disp = struct.unpack_from('<i', D, o+2+(1 if rm==4 else 0))[0]
            if disp == 0x0D:
                imm = D[o+n]
                if 0x70 <= imm <= 0x90:
                    res.append((raw2va(o), imm, D[o:o+n+1].hex()))
print('mov byte [reg+0xD], 0x70..0x90 :', len(res))
for va,imm,h in res:
    print('  %012X  imm=0x%02X (%d)  %s' % (va, imm, imm, h))
