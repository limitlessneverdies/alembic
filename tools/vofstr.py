import sys, io

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

EXE = r'C:\Users\limit\Desktop\alembic.exe'
RD = 0x2DDE00
RDVA = 0x1402DF000
d = open(EXE, 'rb').read()

for pat in sys.argv[1:]:
    pb = pat.encode('utf-8')
    i = 0
    while True:
        j = d.find(pb, i)
        if j < 0:
            break
        print('%-40r raw %-10s va %s' % (pat, hex(j), hex(j - RD + RDVA)))
        i = j + 1
