import sys, struct
from capstone import *

EXE = r'C:\Users\limit\Desktop\alembic.exe'
IMAGE = 0x140000000
SECT = [(0x140001000, 0x400, 0x2DDE00 - 0x400),   # (VA, rawptr, size) .text
        (0x1402DF000, 0x2DDE00, 0x640600 - 0x2DDE00),
        (0x140642000, 0x640600, 0x14070A000 - 0x140642000)]

data = open(EXE, 'rb').read()

def raw_of(va):
    for v, r, sz in SECT:
        if v <= va < v + sz:
            return r + (va - v)
    return None

def get(va, n):
    r = raw_of(va)
    return data[r:r+n] if r is not None else b''

def dis(va, count=None, end=None, detail=False):
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    n = end - va if end else (count or 16) * 16
    code = get(va, n)
    out = []
    for ins in md.disasm(code, va):
        out.append(ins)
        if count and len(out) >= count: break
        if end and ins.address >= end: out.pop(); break
    return out

def fmt(ins):
    ops = ins.op_str
    tgt = ''
    if ins.mnemonic.startswith('call') or ins.mnemonic.startswith('j'):
        tgt = '*' if ins.mnemonic in ('call','jmp') else ''
    return f'{ins.address:012X}  {ins.mnemonic:<7} {ops}'

if __name__ == '__main__':
    a = int(sys.argv[1], 16)
    if len(sys.argv) > 2:
        b = int(sys.argv[2], 16)
        for i in dis(a, end=b):
            print(fmt(i))
    else:
        for i in dis(a, 20):
            print(fmt(i))
