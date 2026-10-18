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
for arg in sys.argv[1:]:
    va = int(arg, 16)
    i = bisect.bisect_right(addrs, va) - 1
    if i >= 0:
        print(f'VA 0x{va:X} -> func {entries[i][1]} @0x{entries[i][0]:X} (starts L{entries[i][2]})')
    else:
        print(f'VA 0x{va:X} -> before first function')
