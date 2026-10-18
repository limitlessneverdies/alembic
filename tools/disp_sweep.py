import sys, io
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from capstone import CS_ARCH_X86, CS_MODE_64, Cs, CS_OP_MEM
from capstone.x86 import X86_REG_RIP
from ndis import data

TEXT_VA = 0x140001000
TEXT_RAW = 0x400
TEXT_END_VA = 0x1402DEA00

lo = int(sys.argv[1], 16)
hi = int(sys.argv[2], 16)
ctx_after = int(sys.argv[3]) if len(sys.argv) > 3 else 10

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
code = data[TEXT_RAW:TEXT_RAW + (TEXT_END_VA - TEXT_VA)]

insns = list(md.disasm(code, TEXT_VA))
print('swept %d instructions' % len(insns), file=sys.stderr)

def memdisp(ins):
    for op in ins.operands:
        if op.type == CS_OP_MEM:
            if op.mem.base == X86_REG_RIP:
                continue
            if lo <= op.mem.disp < hi:
                return op.mem.disp
    return None

hits = [(k, memdisp(ins)) for k, ins in enumerate(insns)]
hits = [(k, d) for k, d in hits if d is not None]
print('# %d hits in disp range 0x%x..0x%x' % (len(hits), lo, hi), file=sys.stderr)

for k, d in hits:
    print('--- disp 0x%x @ %012X' % (d, insns[k].address))
    for j in range(max(0, k - 4), min(k + ctx_after, len(insns))):
        i = insns[j]
        sel = '>>' if j == k else '  '
        print(' %s %012X  %-8s %s' % (sel, i.address, i.mnemonic, i.op_str))
