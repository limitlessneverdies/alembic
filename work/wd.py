"""wd.py - world-dynamics analysis helper over sim_all.txt (mega-function disasm).

Usage:
  python wd.py range <starthex> <endhex> [limit]
  python wd.py grepc <starthex> <endhex> <mnem>          # filter mnemonic
  python wd.py globals <starthex> <endhex>               # unique rip-relative data targets + counts
  python wd.py consts <starthex> <endhex>                # fp/imm constants seen
  python wd.py data <vahex> <len>                        # annotated hexdump
  python wd.py at <vahex> [n]                            # disasm n insns from va
  python wd.py forkw <starthex> <endhex> <base_reg>      # structural: lea/call density
  python wd.py str <vahex>                               # string at va (if .rdata tuple or cstr)
  python wd.py f <vahex>                                 # function name containing/at va
"""
import sys, io, os, re, struct, pickle
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

HERE = os.path.dirname(os.path.abspath(__file__))
RX = os.path.join(HERE, 'rx')
sys.path.insert(0, RX)
SIM = os.path.join(RX, 'sim_all.txt')
EXE = r'C:\Users\limit\Desktop\alembic.exe'
DATA = open(EXE, 'rb').read()

# sections
def _u16(o): return struct.unpack_from('<H', DATA, o)[0]
def _u32(o): return struct.unpack_from('<I', DATA, o)[0]
def _u64(o): return struct.unpack_from('<Q', DATA, o)[0]
def _f32(o): return struct.unpack_from('<f', DATA, o)[0]
def _f64(o): return struct.unpack_from('<d', DATA, o)[0]

def _secs():
    e = _u32(0x3C); coff = e + 4
    nsec = _u16(coff + 2); optsz = _u16(coff + 16); opt = coff + 20
    magic = _u16(opt)
    ib = _u64(opt + 24) if magic == 0x20B else _u32(opt + 28)
    out = []
    sec = opt + optsz
    for i in range(nsec):
        s = sec + i * 40
        nm = DATA[s:s + 8].rstrip(b'\0').decode('latin1')
        vsz = _u32(s + 8); va = _u32(s + 12); rsz = _u32(s + 16); raw = _u32(s + 20)
        out.append((nm, ib + va, vsz, raw, rsz))
    return ib, out

IB, SECS = _secs()

def va2raw(va):
    for nm, base, vsz, raw, rsz in SECS:
        if base <= va < base + max(vsz, rsz):
            return raw + (va - base)
    return None

def raw2va(raw):
    for nm, base, vszp, rawp, rsz in SECS:
        if rawp <= raw < rawp + rsz:
            return base + (raw - rawp)
    return None

def rd(va, n):
    o = va2raw(va)
    return None if o is None else DATA[o:o + n]

def cstr(va, maxlen=200):
    o = va2raw(va)
    if o is None: return None
    e = DATA.find(b'\0', o, o + maxlen)
    if e < 0: e = o + maxlen
    return DATA[o:e].decode('utf-8', 'replace')

def ruststr(va):
    """try (ptr,len) tuple at va"""
    o = va2raw(va)
    if o is None: return None
    p = _u64(o); l = _u64(o + 8)
    if l > 0x200 or p == 0: return None
    ro = va2raw(p)
    if ro is None: return None
    try:
        s = DATA[ro:ro + l].decode('utf-8')
    except Exception:
        return None
    if all(32 <= ord(c) < 127 or c in '\n\t' for c in s):
        return s
    return None

# function index
FUNCS = []
for line in open(r'C:\Users\limit\rea-tools\func-index.txt', encoding='utf-8', errors='replace'):
    p = line.split()
    if len(p) >= 3 and p[0].startswith('L') and p[2].startswith('@'):
        try: FUNCS.append((int(p[2][1:], 16), p[1]))
        except ValueError: pass
FUNCS.sort()

def fname(va):
    lo, hi = 0, len(FUNCS) - 1
    best = None
    for a, n in FUNCS:
        if a <= va: best = (a, n)
        else: break
    return best

def load_sim():
    out = []
    idx = {}
    for i, l in enumerate(open(SIM, encoding='utf-8', errors='replace')):
        m = re.match(r'^([0-9A-F]{12})  (\S+)\s*(.*)$', l.rstrip('\n'))
        if not m:
            continue
        a = int(m.group(1), 16)
        idx[a] = i
        out.append((a, m.group(2), m.group(3)))
    return out, idx

SIMINS, SIMIDX = load_sim()

MD = None
def md():
    global MD
    if MD is None:
        from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM, CS_OP_IMM, CS_OP_REG
        MD = Cs(CS_ARCH_X86, CS_MODE_64); MD.detail = True
    return MD

def annotate(va, mnem, ops):
    """resolve rip-relative mem operand + imm targets"""
    ann = []
    try:
        code = rd(va, 15)
        ins = next(md().disasm(code, va), None)
        if ins is None: return ''
        from capstone.x86 import X86_OP_MEM, X86_OP_IMM, X86_REG_RIP
        for op in ins.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                t = ins.address + ins.size + op.mem.disp
                ann.append('@%X' % t)
                s = ruststr(t)
                if s is not None:
                    ann.append('STR=' + repr(s[:90]))
                    continue
                cs = cstr(t, 120)
                if cs and len(cs) > 2 and all(32 <= ord(c) < 127 for c in cs):
                    ann.append('CSTR=' + repr(cs[:90]))
                    continue
                b = rd(t, 32)
                if b:
                    fv = struct.unpack_from('<f', b, 0)[0]
                    fv2 = struct.unpack_from('<f', b, 4)[0]
                    dv = struct.unpack_from('<d', b, 0)[0]
                    qv = struct.unpack_from('<Q', b, 0)[0]
                    parts = ['f32=%.9g' % fv, 'f32+4=%.9g' % fv2, 'f64=%.9g' % dv, 'u64=%#x' % qv]
                    if 0x140000000 <= qv < 0x140642000:
                        fn = fname(qv)
                        if fn and fn[0] == qv: parts.append('FUN=' + fn[1])
                    ann.append(' '.join(parts))
            elif op.type == X86_OP_IMM:
                t = op.imm
                fn = fname(t)
                if fn and fn[0] == t:
                    ann.append('->' + fn[1])
                elif 0x140000000 <= t < 0x140642000:
                    ann.append('->%X' % t)
    except Exception as e:
        pass
    return (' ; ' + ' '.join(ann)) if ann else ''

def cmd_range(a, b, limit=None):
    n = 0
    for va, mnem, ops in SIMINS:
        if va < a: continue
        if va >= b: break
        print('%012X  %-8s %-52s%s' % (va, mnem, ops, annotate(va, mnem, ops)))
        n += 1
        if limit and n >= limit: break

def cmd_grep(a, b, pat):
    for va, mnem, ops in SIMINS:
        if va < a: continue
        if va >= b: break
        if re.search(pat, mnem + ' ' + ops):
            print('%012X  %-8s %-52s%s' % (va, mnem, ops, annotate(va, mnem, ops)))

def cmd_globals(a, b):
    import collections
    c = collections.Counter()
    for va, mnem, ops in SIMINS:
        if va < a: continue
        if va >= b: break
        try:
            code = rd(va, 15)
            ins = next(md().disasm(code, va), None)
            if ins is None: continue
            from capstone.x86 import X86_OP_MEM, X86_REG_RIP
            for op in ins.operands:
                if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                    c[ins.address + ins.size + op.mem.disp] += 1
        except Exception: pass
    for t, n in sorted(c.items()):
        d = ''
        s = ruststr(t)
        if s is not None: d = 'STR=' + repr(s[:80])
        else:
            cs = cstr(t, 100)
            if cs and len(cs) > 2 and all(32 <= ord(ch) < 127 for ch in cs): d = 'CSTR=' + repr(cs[:80])
            else:
                bl = rd(t, 16)
                if bl:
                    d = 'f32=%.9g f64=%.9g u64=%#x' % (
                        struct.unpack_from('<f', bl, 0)[0],
                        struct.unpack_from('<d', bl, 0)[0],
                        struct.unpack_from('<Q', bl, 0)[0])
        print('%012X x%-5d %s' % (t, n, d))

def cmd_consts(a, b):
    import collections
    c = collections.Counter()
    for va, mnem, ops in SIMINS:
        if va < a: continue
        if va >= b: break
        for m in re.finditer(r'0x[0-9a-fA-F]{6,}', ops):
            c[m.group(0)] += 1
    for k, n in sorted(c.items(), key=lambda x: -x[1]):
        print('%s x%d' % (k, n))

def cmd_data(va, ln):
    o = va2raw(va)
    for i in range(o, o + ln, 16):
        chunk = DATA[i:i + 16]
        hx = ' '.join('%02X' % b for b in chunk)
        asc = ''.join(chr(b) if 32 <= b <= 126 else '.' for b in chunk)
        print('%08X  va %012X  %-48s %s' % (i, raw2va(i) or 0, hx, asc))

def cmd_at(va, n=40):
    cur = va
    for _ in range(n):
        hit = None
        for a, mnem, ops in SIMINS:
            if a >= cur:
                hit = (a, mnem, ops); break
        if not hit: break
        a, mnem, ops = hit
        if a != cur:
            print('%012X  <gap>' % cur)
            cur = a
        print('%012X  %-8s %-52s%s' % (a, mnem, ops, annotate(a, mnem, ops)))
        cur = a + 1

if __name__ == '__main__':
    c = sys.argv[1]
    if c == 'range':
        cmd_range(int(sys.argv[2], 16), int(sys.argv[3], 16), int(sys.argv[4]) if len(sys.argv) > 4 else None)
    elif c == 'grepc':
        cmd_grep(int(sys.argv[2], 16), int(sys.argv[3], 16), sys.argv[4])
    elif c == 'globals':
        cmd_globals(int(sys.argv[2], 16), int(sys.argv[3], 16))
    elif c == 'consts':
        cmd_consts(int(sys.argv[2], 16), int(sys.argv[3], 16))
    elif c == 'data':
        cmd_data(int(sys.argv[2], 16), int(sys.argv[3], 0))
    elif c == 'at':
        cmd_at(int(sys.argv[2], 16), int(sys.argv[3]) if len(sys.argv) > 3 else 40)
    elif c == 'str':
        va = int(sys.argv[2], 16)
        print('ruststr:', ruststr(va)); print('cstr:', cstr(va))
    elif c == 'f':
        va = int(sys.argv[2], 16)
        print('containing fn start:', fname(va))
