import struct
from capstone import *
from capstone.x86 import *
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140837000: return va - 0x140642000 + 0x640600
    return None
def f32(va):
    o=va2raw(va); return struct.unpack_from('<f',D,o)[0]
def f64(va):
    o=va2raw(va); return struct.unpack_from('<d',D,o)[0]
for va in (0x1402F6D38,0x1402F69C0,0x1402F69C8,0x1402F68C0,0x1402DF470,0x1402DF5D0,0x1402F6B24,0x1402DF07C):
    print(f"  0x{va:X}: f32={f32(va)!r:24} f64={f64(va)!r}")
print()
md=Cs(CS_ARCH_X86,CS_MODE_64); md.detail=True
start=0x1400FDF00; end=0x140101020
o=va2raw(start); code=D[o:o+(end-start)]
print("--- writes to xmm12 / xmm15 / xmm14 / xmm11 / xmm13 inside FUN_1400fdf00 before 0x140101020 ---")
for ins in md.disasm(code,start):
    ops=ins.op_str
    for r in ('xmm12','xmm15','xmm14','xmm11','xmm13','xmm10','xmm9'):
        if ops.startswith(r) and ins.mnemonic in ('movss','movaps','movups','movlps','movsd','xorps','movd','movq','cvtsi2ss','cvtsi2sd','cvtsd2ss','addss','subss','mulss','divss','addsd','mulsd'):
            print(f"  0x{ins.address:x}  {ins.mnemonic} {ops}")
            break
