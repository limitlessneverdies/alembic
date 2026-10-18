"""Cross-reference a 32-bit state-field displacement across all decoded insns.

fldsweep.py <disp_hex> [lo_hex] [hi_hex]
Decodes each candidate instruction and prints those whose memory operand
base displacement equals <disp> (RIP-relative operands excluded).
"""
import sys, io, os, pickle, struct
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from capstone import CS_ARCH_X86, CS_MODE_64, Cs
from capstone.x86 import X86_OP_MEM, X86_REG_RIP
from ndis import data

TEXT_VA = 0x140001000
TEXT_RAW = 0x400

_p = os.path.join(HERE, 'rdmap2.pkl')
if not os.path.exists(_p):
    _p = os.path.join(HERE, 'rdmap.pkl')
with open(_p, 'rb') as f:
    M = pickle.load(f)

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
code = data[TEXT_RAW:TEXT_RAW + (0x1402DEA00 - TEXT_VA)]

disp = int(sys.argv[1], 16)
lo = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0
hi = int(sys.argv[3], 16) if len(sys.argv) > 3 else (1 << 64)
needle = struct.pack('<i', disp)

hits = []
for a, e in M.items():
    if not (lo <= a < hi):
        continue
    sz = e[0]
    off = a - TEXT_VA
    if needle not in code[off:off + sz]:
        continue
    ins = next(md.disasm(code[off:off + 15], a), None)
    if ins is None:
        continue
    ok = False
    for op in ins.operands:
        if op.type == X86_OP_MEM and op.mem.disp == disp:
            ok = True
    if ok:
        hits.append((a, '%s %s' % (ins.mnemonic, ins.op_str)))
hits.sort()
print('# disp 0x%x: %d instructions' % (disp, len(hits)))
for a, txt in hits:
    print('%012X  %s' % (a, txt))
