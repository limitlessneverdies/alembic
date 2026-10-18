import sys
from ndis import dis, fmt

a = int(sys.argv[1], 16)
b = int(sys.argv[2], 16)
out = []
for i in dis(a, end=b):
    out.append(fmt(i))
print('\n'.join(out))
