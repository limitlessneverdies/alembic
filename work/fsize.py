import sys, re
lines = open(r'C:\Users\limit\rea-tools\func-index.txt').read().splitlines()
ents = []
for l in lines:
    m = re.search(r'L(\d+) FUN_([0-9a-fA-F]+) @([0-9a-fA-F]+)', l)
    if m:
        ents.append((int(m.group(3), 16), m.group(2), int(m.group(1))))
ents.sort()
for arg in sys.argv[1:]:
    a = int(arg, 16)
    for i, (va, nm, ln) in enumerate(ents):
        if va == a:
            nxt = ents[i + 1][0] if i + 1 < len(ents) else va + 0
            startln = ents[i][2]
            endln = ents[i + 1][2] if i + 1 < len(ents) else None
            print(f'{nm} @{va:X}  size=0x{nxt-va:X} ({nxt-va})  lines L{startln}..L{endln}')
            break
    else:
        print(f'{arg}: not found')
