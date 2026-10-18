import sys
def rd(p):
    b=open(p,'rb').read()
    if b[:2] in (b'\xff\xfe',b'\xfe\xff'): return b.decode('utf-16')
    return b.decode('utf-8','replace')
lines = rd(r'C:\Users\limit\rea-tools\lea-refs.txt').splitlines()
lo = int(sys.argv[1],16); hi = int(sys.argv[2],16)
n=0
for l in lines:
    if '\t' not in l: continue
    p = l.split('\t')
    try: t=int(p[1],16)
    except: continue
    if lo <= t < hi:
        n+=1
        print(f'0x{int(p[0],16):012X} -> 0x{t:012X}')
print(f'# {n} refs into [{sys.argv[1]},{sys.argv[2]})', file=sys.stderr)
