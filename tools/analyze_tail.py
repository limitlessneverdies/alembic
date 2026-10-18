import json
d = json.load(open(r'C:\Users\limit\rea-tools\elements92.json', encoding='utf-8'))
print(f"{'i':>3} {'sym':4} {'melt':>6} {'boil':>6} {'rad':>4} {'Z':>3} {'per':>3} {'grp':>3} {'val':>3} {'4a':>5} {'4c':>3} {'4d':>3} {'4e':>3}")
for e in d:
    t = e['tail_u8']
    u16 = lambda i: t[i] | (t[i + 1] << 8)
    print(f"{e['i']:3d} {str(e['sym']):4} {e['tail_i16'][0]:6d} {e['tail_i16'][1]:6d} {u16(4):4d} {t[6]:3d} {t[7]:3d} {t[8]:3d} {t[9]:3d} {u16(10):5d} {t[12]:3d} {t[13]:3d} {u16(14):3d}")
