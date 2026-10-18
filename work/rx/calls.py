"""Call-window extractor: for given call targets inside FUN_1400fdf00, print the call site
plus the preceding N instructions with rip-relative targets resolved (string / f32 / hex bytes)."""
import sys, re, bisect, struct, io
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
import importlib.util
spec = importlib.util.spec_from_file_location('xdis', r'C:\Users\limit\alembic-re\work\rx\ndis.py')
m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m)

SIM = r'C:\Users\limit\alembic-re\work\rx\sim_all.txt'
ins = []
for l in open(SIM).read().splitlines():
    va = int(l[:12], 16); rest = l[14:]
    p = rest.split(None, 1)
    ins.append((va, p[0], p[1].strip() if len(p) > 1 else ''))
addrs = [a for a, _, _ in ins]
NEXT = {addrs[i]: (addrs[i+1] if i+1 < len(addrs) else addrs[i]+16) for i in range(len(addrs))}

def decode(va, maxlen=48):
    b = m.get(va, maxlen)
    out = ''; i = 0
    while i < len(b):
        c = b[i]
        if 0x20 <= c < 0x7f: out += chr(c); i += 1
        elif c >= 0x80:
            try:
                s = b[i:i+3].decode('utf-8')
                if all('\u2080' <= ch <= '\u2099' or ch.isascii() for ch in s):
                    out += s; i += 3
                else: break
            except Exception: break
        else: break
    return out

def f32(va):
    b = m.get(va, 4)
    if len(b) < 4: return None
    v = struct.unpack('<f', b)[0]
    if v != v or abs(v) == float('inf'): return None
    if v == 0.0 or 1e-8 < abs(v) < 1e8: return v
    return None

def annot(ops, nxt):
    out = ops
    for mt in re.finditer(r'\[rip \+ 0x([0-9a-f]+)\]', ops):
        tgt = nxt + int(mt.group(1), 16)
        s = decode(tgt)
        f = f32(tgt) if not s else None
        if s:
            out += f'      ; -> 0x{tgt:012X} "{s[:40]}"'
        elif f is not None:
            out += f'      ; -> 0x{tgt:012X} f32 {f!r}'
        else:
            hb = m.get(tgt, 16).hex(' ')
            out += f'      ; -> 0x{tgt:012X} bytes [{hb}]'
    return out

def windows(targets, back=14, lo=0x1400FDF00, hi=0x140137C10):
    out = io.open(r'C:\Users\limit\alembic-re\work\rx\calls.out', 'a', encoding='utf-8')
    for t in targets:
        tv = int(t, 16)
        hits = [i for i, (a, mn, ops) in enumerate(ins) if mn.startswith('call') and ops.strip() == f'0x{tv:x}' and lo <= a < hi]
        out.write(f'\n################ calls to 0x{tv:012X}  ({len(hits)} sites) ################\n')
        for h in hits:
            out.write(f'---- site 0x{ins[h][0]:012X} ----\n')
            for k in range(max(0, h-back), h+1):
                a, mn, ops = ins[k]
                s = annot(ops, NEXT[a])
                mark = '  <== CALL' if k == h else ''
                out.write(f'  {a:012X}  {mn:<8} {s}{mark}\n')
        out.write('\n')
    out.close()

if __name__ == '__main__':
    if sys.argv[1] == 'reset':
        open(r'C:\Users\limit\alembic-re\work\rx\calls.out', 'w').close()
        sys.exit()
    windows(sys.argv[1:])
