"""Extend the recursive-descent map with jump-table targets, to fixpoint.

Loads rdmap.pkl (base) then repeatedly:
  * scan decoded instructions for 'movsxd reg, [reg2 + reg*4]'
  * find the nearby 'lea reg2, [rip+disp32]' that defines the table base
  * read table entries (up to 256) and add in-range .text targets as new seeds
  * recursive-descent from the new seeds (same rules as rdmap.py)
until no new instructions appear.  Writes rdmap2.pkl and prints growth stats.
"""
import sys, io, os, pickle, re, struct
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from capstone import CS_ARCH_X86, CS_MODE_64, Cs
from capstone.x86 import X86_OP_MEM, X86_OP_REG, X86_OP_IMM, X86_REG_RIP, X86_REG_RAX
from ndis import data

HERE = os.path.dirname(os.path.abspath(__file__))
PKL0 = os.path.join(HERE, 'rdmap.pkl')
PKL2 = os.path.join(HERE, 'rdmap2.pkl')

TEXT_VA = 0x140001000
TEXT_RAW = 0x400
TEXT_END_VA = 0x1402DEA00
code = data[TEXT_RAW:TEXT_RAW + (TEXT_END_VA - TEXT_VA)]

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True


def desc(seeds, out):
    """recursive descent; out is dict addr->(size,mnem,opstr). returns new seeds added"""
    n = 0
    work = list(seeds)
    while work:
        a = work.pop()
        while True:
            if a in out or not (TEXT_VA <= a < TEXT_END_VA):
                break
            off = a - TEXT_VA
            ins = next(md.disasm(code[off:off + 15], a), None)
            if ins is None:
                break
            out[a] = (ins.size, ins.mnemonic, ins.op_str)
            n += 1
            m = ins.mnemonic
            nxt = a + ins.size
            if m in ('ret', 'retq', 'hlt', 'ud2'):
                break
            if m.startswith('j'):
                if m == 'jmp':
                    t = ins.operands[0]
                    if t.type == X86_OP_IMM:
                        a = t.imm
                        continue
                    break
                else:
                    t = ins.operands[0]
                    if t.type == X86_OP_IMM:
                        work.append(t.imm)
                    a = nxt
                    continue
            a = nxt
    return n


def table_targets(out, seen_tables):
    """scan decoded insns for movsxd table loads; return set of targets"""
    tgts = set()
    addrs = sorted(out)
    idx_of = {a: i for i, a in enumerate(addrs)}
    for a in addrs:
        sz, m, ops = out[a][:3]
        if m != 'movsxd':
            continue
        off = a - TEXT_VA
        ins = next(md.disasm(code[off:off + 15], a), None)
        if ins is None or len(ins.operands) < 2:
            continue
        dst, src = ins.operands[0], ins.operands[1]
        if src.type != X86_OP_MEM or src.mem.index == 0 or src.mem.scale != 4:
            continue
        base = src.mem.base
        # look back up to 12 decoded instructions for 'lea base,[rip+X]'
        i = idx_of[a]
        tbl = None
        for j in range(i - 1, max(0, i - 12) - 1, -1):
            pa = addrs[j]
            psz, pm, pops = out[pa][:3]
            if pm != 'lea':
                continue
            poff = pa - TEXT_VA
            pins = next(md.disasm(code[poff:poff + 15], pa), None)
            if pins is None or len(pins.operands) != 2:
                continue
            if pins.operands[0].type != X86_OP_REG or pins.operands[1].type != X86_OP_MEM:
                continue
            if pins.operands[1].mem.base != X86_REG_RIP:
                continue
            if pins.operands[0].reg != base:
                continue
            tbl = pins.address + pins.size + pins.operands[1].mem.disp
            break
        if tbl is None or not (0x1402E0000 <= tbl < 0x140340000):
            continue
        seen_tables.add(tbl)
        raw = data[tbl - 0x140001200: tbl - 0x140001200 + 4 * 256]
        for k in range(256):
            v = struct.unpack('<i', raw[k * 4:k * 4 + 4])[0]
            t = tbl + v
            if TEXT_VA <= t < TEXT_END_VA:
                tgts.add(t)
            else:
                break
    return tgts


def main():
    out = pickle.load(open(PKL0, 'rb'))
    print('base map: %d insns' % len(out))
    seen_tables = set()
    for rnd in range(12):
        tgts = table_targets(out, seen_tables)
        new_seeds = [t for t in tgts if t not in out]
        if not new_seeds:
            print('round %d: no new seeds, tables=%d' % (rnd, len(seen_tables)))
            break
        n = desc(new_seeds, out)
        print('round %d: seeds=%d new insns=%d total=%d tables=%d'
              % (rnd, len(new_seeds), n, len(out), len(seen_tables)))
    pickle.dump(out, open(PKL2, 'wb'))
    print('wrote', PKL2)


if __name__ == '__main__':
    main()
