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
md=Cs(CS_ARCH_X86,CS_MODE_64); md.detail=True
o=va2raw(0x140100FB0); code=D[o:o+0x50]
print("constants loaded just before the decay loop:")
for ins in md.disasm(code,0x140100FB0):
    tgt=None
    for op in ins.operands:
        if op.type==X86_OP_MEM and op.mem.base==X86_REG_RIP:
            tgt=ins.address+ins.size+op.mem.disp
    if tgt is not None:
        nm=ins.mnemonic
        if 'movsd' in nm: print(f"  0x{ins.address:X} {nm:7s} {ins.op_str:22s} -> 0x{tgt:X} = f64 {f64(tgt)!r}")
        else: print(f"  0x{ins.address:X} {nm:7s} {ins.op_str:22s} -> 0x{tgt:X} = f32 {f32(tgt)!r}")
