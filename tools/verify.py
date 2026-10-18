"""Alignment sanity checker for dumps.

verify.py <start_hex> <end_hex>
Linear-sweeps the window, reports: instruction count, invalid count,
how many call targets hit known function starts (from func-index.txt)
vs total calls, and any internal branch target that is not an
instruction start of this same sweep.
"""
import sys, io, os, re
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from capstone import CS_ARCH_X86, CS_MODE_64, Cs
from ndis import data

TEXT_VA = 0x140001000
TEXT_RAW = 0x400
TEXT_END_VA = 0x1402DEA00

FSTARTS = set()
with open(r'C:\Users\limit\rea-tools\func-index.txt', encoding='utf-8', errors='replace') as f:
    for line in f:
        m = re.search(r'@(?:0x)?([0-9a-fA-F]{6,16})', line)
        if m:
            FSTARTS.add(int(m.group(1), 16))

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True
code = data[TEXT_RAW:TEXT_RAW + (TEXT_END_VA - TEXT_VA)]


def sweep(start, end):
    insns = []
    addr = start
    while addr < end:
        ins = next(md.disasm(code[addr - TEXT_VA:addr - TEXT_VA + 15], addr), None)
        if ins is None:
            return insns, addr, True
        insns.append(ins)
        addr += ins.size
    return insns, addr, False


def report(start, end, verbose=True):
    insns, stop, invalid = sweep(start, end)
    starts = set(i.address for i in insns)
    calls = 0
    badcalls = []
    branch_bad = []
    for i in insns:
        if i.mnemonic == 'call':
            t = i.operands[0]
            if t.type == 2:
                calls += 1
                if t.imm not in FSTARTS:
                    badcalls.append((i.address, t.imm))
        elif i.mnemonic.startswith('j') and i.mnemonic != 'jmp' or i.mnemonic == 'jmp':
            t = i.operands[0]
            if t.type == 2:
                if t.imm not in starts and start <= t.imm < end:
                    branch_bad.append((i.address, i.mnemonic, t.imm))
    print('sweep 0x%X..0x%X: %d insns, end=0x%X (exact=%s), calls=%d, call-to-nonfunc=%d'
          % (start, end, len(insns), stop, stop == end, calls, len(badcalls)))
    if verbose:
        for a, t in badcalls[:20]:
            print('   call 0x%X -> 0x%X (not a function start)' % (a, t))
        for a, m, t in branch_bad[:20]:
            print('   %s 0x%X -> 0x%X (not an insn start in window)' % (m, a, t))


if __name__ == '__main__':
    start = int(sys.argv[1], 16)
    end = int(sys.argv[2], 16)
    report(start, end)
