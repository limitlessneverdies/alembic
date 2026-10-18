"""Per-pass string/float reference map: scan regions of sim_all.txt for rip-relative data reads.
Prints, per system, dedup'd (target VA, instruction count, decoded string or f32)."""
import sys, re, bisect, struct
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

REGIONS = [
    ('tick_arcs',                0x1400FF397, 0x140100D27),
    ('electrolysis',             0x140100D27, 0x140100F36),
    ('tick_nuclear_traces',      0x140100F36, 0x140102206),
    ('radioactive_decay',        0x140102206, 0x1401022D6),
    ('thermite',                 0x140102DA2, 0x140103F46),
    ('magnesium_burn',           0x140103F46, 0x140104BE9),
    ('organic_maturation',       0x140104BE9, 0x140104CEC),
    ('glass_etching',            0x140104CEC, 0x140104DE1),
    ('fluorine_hydrolysis',      0x140104DE1, 0x1401070C4),
    ('anhydride_hydration',      0x1401070C4, 0x1401077D0),
    ('slaking',                  0x1401077D0, 0x140107F34),
    ('dry_carbonation',          0x140107F34, 0x140108811),
    ('neat_acid_meets_water',    0x140108811, 0x14010A6B9),
    ('nitrogen_oxide_chemistry', 0x14010A6B9, 0x14010B28C),
    ('metal_hydrogen_absorption',0x14010B28C, 0x14010B555),
    ('cerium_sparks',            0x14010B555, 0x14010B7BA),
    ('spark_motion',             0x14010B7BA, 0x14010C6AE),
    ('neutron_motion',           0x14010C6AE, 0x14010D23B),
    ('halogen_displacement',     0x14010D23B, 0x14010E3CB),
    ('hg_amalgamation',          0x14010E3CB, 0x14010EF93),
    ('flame_test_emission',      0x14010EF93, 0x14010F44D),
    ('color_fires',              0x14010F44D, 0x14010F505),
    ('thermal',                  0x14010F505, 0x14010F76B),
    ('refining',                 0x14010F76B, 0x14011114C),
    ('resolve_hot_h_o_charges',  0x14011114C, 0x140111204),
    ('chemical_reactions',       0x140111204, 0x140111380),
    ('flush_chem_blast',         0x140111380, 0x1401115E9),
    ('base_neutralization',      0x1401115E9, 0x1401126A1),
    ('acid_displacement',        0x1401126A1, 0x140113D11),
    ('oxidising_attack',         0x140113D11, 0x140114EAA),
    ('alloy_acid_leach',         0x140114EAA, 0x1401160FA),
    ('alloy_formation',          0x1401160FA, 0x1401174F2),
    ('dissolve',                 0x1401174F2, 0x140118961),
    ('diffuse_solute',           0x140118961, 0x140118ED5),
    ('carbonic_degassing',       0x140118ED5, 0x140119443),
    ('reactions',                0x140119443, 0x140119655),
]

FLOAT_OPS = ('movss', 'addss', 'subss', 'mulss', 'divss', 'comiss', 'ucomiss',
             'minss', 'maxss', 'sqrtss', 'cvtsi2ss', 'movaps', 'movups')

def decode(va, maxlen=64):
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

def scan(lo, hi):
    i0 = bisect.bisect_left(addrs, lo); i1 = bisect.bisect_left(addrs, hi)
    seen = {}; order = []
    for i in range(i0, i1):
        a, mn, ops = ins[i]
        for mt in re.finditer(r'\[rip \+ 0x([0-9a-f]+)\]', ops):
            nxt = addrs[i+1] if i+1 < len(addrs) else a+16
            tgt = nxt + int(mt.group(1), 16)
            if tgt < 0x1402DF000: continue
            s = decode(tgt)
            f = f32(tgt) if mn in FLOAT_OPS and not s else None
            key = (tgt, s, f)
            if key in seen:
                seen[key][1].append(a)
            else:
                seen[key] = [s, [a]]
                order.append(key)
    return order, seen

if __name__ == '__main__':
    import io
    out = io.open(r'C:\Users\limit\alembic-re\work\rx\strmap.out', 'w', encoding='utf-8')
    want = sys.argv[1:] or None
    for name, lo, hi in REGIONS:
        if want and name not in want: continue
        order, seen = scan(lo, hi)
        out.write(f'== {name}  {lo:#x}..{hi:#x} ==\n')
        for key in order:
            tgt, s, f = key
            s, us = seen[key]
            if s:
                out.write(f'  0x{tgt:012X} {len(us):>3}x  "{s}"\n')
            elif f is not None:
                out.write(f'  0x{tgt:012X} {len(us):>3}x  <f32 {f!r}>\n')
        out.write('\n')
    out.close()
