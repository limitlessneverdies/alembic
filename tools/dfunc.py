import sys, io
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
from ndis import dis, fmt

args = sys.argv[1:]
if args and args[0].startswith('out='):
    sys.stdout = open(args[0][4:], 'w', encoding='utf-8')
    args = args[1:]

for a in args:
    va = int(a, 16)
    ins = dis(va, count=60)
    print('===== FUNC @ %s =====' % hex(va))
    # stop at ret
    for i in ins:
        print('  %012X  %-9s %s' % (i.address, i.mnemonic, i.op_str))
        if i.mnemonic in ('ret', 'retq') or (i.mnemonic == 'jmp' and 'rip' in i.op_str):
            break
