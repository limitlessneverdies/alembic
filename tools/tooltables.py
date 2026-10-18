import sys, io, struct
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from ndis import get, dis, fmt

def rel_jump_table(va, n):
    print('REL JUMP TABLE @ %s (base for add)' % hex(va))
    for i in range(n):
        d = struct.unpack_from('<i', get(va + i * 4, 4))[0]
        print('   [%d] disp=%+d  target=%s' % (i, d, hex(va + d)))

def qword_table(va, n, what='qword'):
    print('%s TABLE @ %s' % (what.upper(), hex(va)))
    for i in range(n):
        q = struct.unpack_from('<Q', get(va + i * 8, 8))[0]
        note = ''
        try:
            s = get(q, 40).split(b'\x00')[0]
            if len(s) > 2 and all(32 <= c < 127 or c > 127 for c in s):
                note = 'str=%r' % s[:40]
        except Exception:
            pass
        print('   [%d] %s  %s' % (i, hex(q), note))

if __name__ == '__main__':
    print('== table A (per-frame tool switch, at 0x14001B3C1) ==')
    rel_jump_table(0x1402EBB8C, 7)
    print()
    print('== table B1 (qword by tool id, at 0x14002CFCB) ==')
    qword_table(0x1402EAA20, 7)
    print()
    print('== table B2 (rel i32 by tool id, at 0x14002CFDD) ==')
    rel_jump_table(0x1402EAA58, 7)
