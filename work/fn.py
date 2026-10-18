import sys, re
idx = r'C:\Users\limit\rea-tools\func-index.txt'
bigf = r'C:\Users\limit\rea-tools\extracted\alembic_all_extracted.c'

entries = []
for line in open(idx):
    parts = line.split()
    if len(parts) >= 3 and parts[0].startswith('L') and parts[2].startswith('@'):
        entries.append((int(parts[0][1:]), parts[1], parts[2]))
entries.sort()
byname = {nm: k for k, (ln, nm, ad) in enumerate(entries)}
byaddr = {}
for k, (ln, nm, ad) in enumerate(entries):
    byaddr[int(ad[1:], 16)] = k

def body(k):
    start = entries[k][0]
    end = entries[k + 1][0] if k + 1 < len(entries) else None
    lines = open(bigf, encoding='utf-8', errors='replace').read().splitlines()
    return lines[start - 1:end - 1] if end else lines[start - 1:]

def containing(addr):
    best = None
    for a, k in byaddr.items():
        if a <= addr and (best is None or a > best[0]):
            best = (a, k)
    return best

if __name__ == '__main__':
    out = []
    for arg in sys.argv[1:]:
        if arg.startswith('@'):
            k = containing(int(arg[1:], 16))[1]
            out.append(f'#### via addr {arg} -> {entries[k][1]}\n' + '\n'.join(body(k)))
        else:
            k = byname[arg]
            # include callees referenced
            txt = '\n'.join(body(k))
            out.append(f'#### {arg}\n' + txt)
    print('\n\n'.join(out))
