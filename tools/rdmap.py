"""Recursive-descent disassembly map of alembic .text, cached to pickle.

Seeds: function starts from func-index.txt + any extra seeds appended in
extra_seeds.txt (one hex VA per line).  Follows rel8/rel32 jcc, jmp, and
fallthrough; stops at ret / indirect jumps.  Output: rdmap.pkl =
{addr: (size, mnemonic, op_str, text)}
"""
import sys, io, os, pickle, re
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from capstone import CS_ARCH_X86, CS_MODE_64, Cs
from ndis import data

HERE = os.path.dirname(os.path.abspath(__file__))
PKL = os.path.join(HERE, 'rdmap.pkl')

TEXT_VA = 0x140001000
TEXT_RAW = 0x400
TEXT_END_VA = 0x1402DEA00

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = True

def load_maps():
    if os.path.exists(PKL):
        with open(PKL, 'rb') as f:
            return pickle.load(f)
    return None

def seeds():
    s = set()
    with open(r'C:\Users\limit\rea-tools\func-index.txt', encoding='utf-8', errors='replace') as f:
        for line in f:
            m = re.search(r'@(?:0x)?([0-9a-fA-F]{6,16})', line)
            if m:
                a = int(m.group(1), 16)
                if TEXT_VA <= a < TEXT_END_VA:
                    s.add(a)
    p = os.path.join(HERE, 'extra_seeds.txt')
    if os.path.exists(p):
        with open(p, encoding='utf-8', errors='replace') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    s.add(int(line, 16))
    return s

def build():
    code = data[TEXT_RAW:TEXT_RAW + (TEXT_END_VA - TEXT_VA)]
    out = {}
    work = list(seeds())
    seen = set()
    n = 0
    while work:
        a = work.pop()
        while True:
            if a in seen or a in out:
                break
            if not (TEXT_VA <= a < TEXT_END_VA):
                break
            off = a - TEXT_VA
            ins = next(md.disasm(code[off:off + 15], a), None)
            if ins is None:
                break
            seen.add(a)
            txt = '%s %s' % (ins.mnemonic, ins.op_str)
            out[a] = (ins.size, ins.mnemonic, ins.op_str, txt)
            n += 1
            m = ins.mnemonic
            nxt = a + ins.size
            if m in ('ret', 'retq', 'hlt', 'ud2'):
                break
            if m.startswith('j'):
                if m == 'jmp':
                    t = ins.operands[0]
                    if t.type == 2:  # IMM
                        a = t.imm
                        continue
                    break
                else:
                    t = ins.operands[0]
                    if t.type == 2:
                        work.append(t.imm)
                    a = nxt
                    continue
            # call with no return (noreturn) would be missed; assume returns
            a = nxt
    print('decoded %d instructions, %d orphans in work list' % (n, len(set(work) - set(out))))
    return out

if __name__ == '__main__':
    out = build()
    with open(PKL, 'wb') as f:
        pickle.dump(out, f)
    print('cached', PKL)
