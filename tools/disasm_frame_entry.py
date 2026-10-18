import sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = False

def disasm_window(start_va, length, label):
    print('=' * 72)
    print(f'== {label} @ {start_va:#x} ({length} bytes)')
    raw = va2raw(start_va)
    code = DATA[raw:raw + length]
    for ins in md.disasm(code, start_va):
        marker = ''
        if ins.mnemonic == 'call' and '0x1400fdf00' in ins.op_str:
            marker = '   <=== CALL sim mega-function'
        if ins.mnemonic == 'jmp' and '0x1400fdf00' in ins.op_str:
            marker = '   <=== TAIL-JMP sim mega-function'
        print(f'  {ins.address:012X}  {ins.mnemonic:<7} {ins.op_str}{marker}')

# Call site A
disasm_window(0x140017E60, 0xC0, 'frame driver: first call site')
# exact call boundary check
disasm_window(0x140017E80, 0x20, 'frame driver: exact call A bytes')
# Call site B
disasm_window(0x14001DAB0, 0xC0, 'frame driver: second call site')
disasm_window(0x14001DAD0, 0x20, 'frame driver: exact call B bytes')
