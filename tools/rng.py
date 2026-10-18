import sys, io
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from ndis import dis, fmt

# usage: rng.py <start_hex> <end_hex>
start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
if len(sys.argv) > 3:
    step = int(sys.argv[3])
else:
    step = 1000
if len(sys.argv) > 4:
    _f = open(sys.argv[4], 'w', encoding='utf-8')
    class _T:
        def write(self, s):
            _f.write(s)
        def flush(self):
            _f.flush()
    sys.stdout = _T()

a = start
while a < end:
    ins = dis(a, count=step)
    for i in ins:
        print('  %012X  %-9s %s' % (i.address, i.mnemonic, i.op_str))
        if i.address + i.size > end:
            break
    last = ins[-1]
    a = last.address + last.size
    if last.address >= end:
        break
