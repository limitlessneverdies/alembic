import sys, struct, io
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from ndis import dis, fmt, raw_of, data

# scan .text for 4-byte disp patterns and disassemble context
TEXT_VA = 0x140001000
TEXT_RAW = 0x400
TEXT_SIZE = 0x2DDE00 - 0x400

def find_disp(disp):
    pat = struct.pack('<I', disp)
    hits = []
    start = 0
    blob = data[TEXT_RAW:TEXT_RAW+TEXT_SIZE]
    while True:
        j = blob.find(pat, start)
        if j < 0:
            break
        hits.append(TEXT_VA + j)
        start = j + 1
    return hits

for d in sys.argv[1:]:
    disp = int(d, 16)
    hits = find_disp(disp)
    print('=== disp 0x%x : %d raw byte hits' % (disp, len(hits)))
    for h in hits:
        ins = dis(h - 0x20, end=h + 0x20)
        for i in ins:
            mark = '  <-- ' if h - 0x1 <= i.address < h + 5 else ''
            txt = fmt(i)
            if mark:
                print('   ' + txt + mark)
