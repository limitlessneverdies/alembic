import sys, struct
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw
from capstone import *

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True

def dis(va, n):
    o = va2raw(va)
    b = DATA[o:o+n]
    print(f'--- 0x{va:X} raw bytes: {b.hex()}')
    for m in md.disasm(b, va):
        print(f'{m.address:012X}  {m.mnemonic:<8}{m.op_str}')

if __name__ == '__main__':
    va = int(sys.argv[1], 16); n = int(sys.argv[2], 0)
    dis(va, n)
