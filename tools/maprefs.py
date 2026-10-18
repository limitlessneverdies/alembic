import sys, bisect
entries = []
for line in open(r'C:\Users\limit\rea-tools\func-index.txt'):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        try:
            entries.append((int(parts[2][1:], 16), parts[1], int(parts[0][1:])))
        except ValueError:
            pass
entries.sort()
addrs = [e[0] for e in entries]

def funcof(va):
    i = bisect.bisect_right(addrs, va) - 1
    return entries[i] if i >= 0 else None

f = sys.argv[1]
a = int(sys.argv[2], 16)
b = int(sys.argv[3], 16)
for line in open(f):
    if line.startswith('#'):
        continue
    parts = line.split()
    if len(parts) < 3:
        continue
    iv = int(parts[0], 16)
    tv = int(parts[1], 16)
    if a <= tv <= b:
        fn = funcof(iv)
        if fn:
            print(f'instr 0x{iv:X} -> target 0x{tv:X}  [{fn[1]} @0x{fn[0]:X}]')
        else:
            print(f'instr 0x{iv:X} -> target 0x{tv:X}  [?]')
