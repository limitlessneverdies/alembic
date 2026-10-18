import re, sys, os
work = r'C:\Users\limit\alembic-re\work'
files = ['dis_spawners.txt','dis_conveyors.txt','dis_pipes.txt','dis_transmutations.txt','dis_radiate_plates.txt','dis_sensors.txt','dis_fans.txt','dis_filters.txt','dis_generators.txt','dis_pressure_sources.txt','dis_pressure.txt','dis_thermal.txt','dis_refining.txt']
pat = re.compile(r'^\s*([0-9A-F]{12,16})\s+(.*)$')
for f in files:
    p = os.path.join(work,f)
    if not os.path.exists(p):
        print('MISSING', f); continue
    print('=== %s' % f)
    for line in open(p, encoding='utf-8', errors='replace'):
        m = pat.match(line)
        if not m: continue
        addr, ins = m.group(1), m.group(2).strip()
        if 'no code' in ins: continue
        # substance-ish immediates
        mm = re.match(r'(cmp|mov|test|movzx|sub|add) .*?, (0x[0-9a-f]+)$', ins)
        if mm and ins.startswith('cmp'):
            v = int(mm.group(2),16)
            if 0x70 <= v <= 0x90 or v in (0x29,0x2f,0x22,0x30,0x31,0x32,0x2e,0x2d,0x2e,0x2):
                print('  %s  %s' % (addr, ins))
