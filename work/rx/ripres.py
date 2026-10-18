import sys, struct
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from capstone import *
from capstone.x86 import *
from ndis import get, fmt

def resolve(va_start, va_end, dump=16):
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    code = get(va_start, va_end - va_start)
    out = []
    for ins in md.disasm(code, va_start):
        line = fmt(ins)
        extra = ''
        for op in ins.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                tgt = ins.address + ins.size + op.mem.disp
                b = get(tgt, dump)
                extra += f'  ; [0x{tgt:X}] = {b.hex()}'
                if len(b) >= 4:
                    extra += f' f32={struct.unpack("<f", b[:4])[0]:.6g}'
                if len(b) >= 8:
                    extra += f' u64=0x{struct.unpack("<Q", b[:8])[0]:X}'
                # also print as i32 table when aligned
                if op.mem.index != 0:
                    extra += '  TAB:'
                    for i in range(8):
                        v = struct.unpack_from('<i', b, i*4)[0]
                        extra += f' [{i}]=0x{(tgt+v)&0xFFFFFFFFFFFFFFFF:X}'
        out.append(line + extra)
    return out

if __name__ == '__main__':
    a = int(sys.argv[1], 16); b = int(sys.argv[2], 16)
    print('\n'.join(resolve(a, b)))
