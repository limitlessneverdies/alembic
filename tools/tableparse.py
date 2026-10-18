import sys, struct
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, raw2va, va2raw, u64

# usage: python tableparse.py <startraw> <stride_dec> <count> [nameptr_off] [len_off] [fnptr_off]
o = int(sys.argv[1], 16)
stride = int(sys.argv[2], 0)
n = int(sys.argv[3], 0)
np_off = int(sys.argv[4], 0) if len(sys.argv) > 4 else 0
ln_off = int(sys.argv[5], 0) if len(sys.argv) > 5 else 8
fn_off = int(sys.argv[6], 0) if len(sys.argv) > 6 else 0x10
for k in range(n):
    b = o + k * stride
    if b + stride > len(DATA): break
    namep = u64(b + np_off); namel = u64(b + ln_off); fnp = u64(b + fn_off)
    s = ''
    if 0x140001000 <= namep <= 0x1407A0000 and 1 <= namel <= 120:
        r = va2raw(namep)
        if r is not None:
            s = DATA[r:r + namel].decode('latin1', 'replace')
    print(f'{k:4d} raw {b:06X}: name={namep:012X} len={namel:3d} fn={fnp:012X}  "{s}"')
