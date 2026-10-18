import sys, struct
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, raw2va

# Extract printable ASCII runs from a raw range: python runs.py <startraw> <endraw> [minlen]
start = int(sys.argv[1], 16)
end = int(sys.argv[2], 16)
minlen = int(sys.argv[3]) if len(sys.argv) > 3 else 4

i = start
while i < end:
    b = DATA[i]
    if 32 <= b <= 126:
        j = i
        while j < end and 32 <= DATA[j] <= 126:
            j += 1
        run = DATA[i:j].decode('latin1')
        if len(run) >= minlen:
            va = raw2va(i)
            print(f'{va:012X} (raw {i:06X}) len={j-i}: {run}')
        i = j
    else:
        i += 1
