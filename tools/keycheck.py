"""Inventory of key queries: find 'mov cx, IMM' (or mov eax/ecx+r8w) feeding
calls to the three key-state queries 0x140176a20 / 0x140176c20 / 0x140176e50.

keycheck.py
Prints: query_addr, key value (hex/char), call address of the query fn.
"""
import sys, io, os, pickle
HERE = os.path.dirname(os.path.abspath(__file__))

_p = os.path.join(HERE, 'rdmap2.pkl')
with open(_p, 'rb') as f:
    M = pickle.load(f)

QUERIES = {0x140176A20: 'down?', 0x140176C20: 'pressed?', 0x140176E50: 'q3?'}

addrs = sorted(M)
rows = []
for i, a in enumerate(addrs):
    e = M[a]
    if e[1] != 'call':
        continue
    t = e[2]
    try:
        tv = int(t, 16)
    except ValueError:
        continue
    if tv not in QUERIES:
        continue
    # scan back up to 6 insns for a mov with imm to cx/ecx
    key = None
    for j in range(i - 1, max(0, i - 7) - 1, -1):
        pe = M[addrs[j]]
        if pe[1] == 'mov' and (', 0x' in pe[2] or ', 0x' in pe[2]):
            ops = pe[2]
            if ops.split(',')[0].strip() in ('cx', 'ecx', 'r8w', 'dx', 'word ptr [rsp + 0x26]'):
                try:
                    key = int(ops.split(',')[1].strip(), 16)
                except ValueError:
                    key = None
                if key is not None:
                    break
    rows.append((a, tv, key))

print('# %d key-query call sites' % len(rows))
for a, tv, key in rows:
    ks = ''
    if key is not None:
        if 0x20 <= key < 0x7f:
            ks = repr(chr(key))
        else:
            ks = 'X11?'
    print('%012X  query=0x%X (%s)  key=%s %s' % (a, tv, QUERIES[tv], ('0x%x' % key) if key is not None else '?', ks))
