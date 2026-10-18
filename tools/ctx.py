import sys, re
# list lines containing a needle with context, across extracted functions
needle = sys.argv[1]
for f in sys.argv[2:]:
    lines = open(f, encoding='utf-8', errors='replace').read().splitlines()
    for i, l in enumerate(lines):
        if needle in l:
            print(f'--- {f}:{i+1}')
            a = max(0, i-4); b = min(len(lines), i+5)
            for j in range(a, b):
                print(f'{j+1:6d}: {lines[j]}')
            print()
