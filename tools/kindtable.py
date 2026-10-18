import sys, json
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, va2raw
els = json.load(open(r'C:\Users\limit\rea-tools\elements92.json'))
o = va2raw(0x14035D008)
kinds = DATA[o:o + 92]
for e in els:
    z = e['tail_u8'][6]
    valid = e['tail_u8'][13]
    k = kinds[z - 1] if 1 <= z <= 92 else -1
    print(f'{e["sym"]:3s} Z={z:3d} valid={valid} kind=0x{k:02X} ({k:3d})  {e["name"]}')
