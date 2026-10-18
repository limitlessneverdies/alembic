"""Scan the sim mega-function disassembly (via rdmap2.pkl) for substance/flags comparisons.
Usage: sig.py <start_hex> <end_hex> [offset_hex]
Prints every instruction in range that compares or moves an immediate against [reg+disp].
"""
import sys, os, re, pickle
HERE = r'C:\Users\limit\rea-tools\scripts'
sys.path.insert(0, HERE)
import rdmap

m = rdmap.load_maps()
start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
out = sys.stdout
if len(sys.argv) > 3:
    out = open(sys.argv[3], 'w', encoding='utf-8')

a = start
while a < end:
    if a in m:
        sz, mm, ops, txt = m[a]
        out.write('  %012X  %s\n' % (a, txt))
        a += sz
    else:
        out.write('  %012X  <no code>\n' % a)
        a += 1
