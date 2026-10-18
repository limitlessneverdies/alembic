import sys, bisect
IDX = r'C:\Users\limit\rea-tools\func-index.txt'
ent=[]
for line in open(IDX):
    p=line.split()
    if len(p)>=3 and p[0].startswith('L') and p[2].startswith('@'):
        ent.append((int(p[0][1:]), p[1], p[2]))
ent.sort()
ls=[e[0] for e in ent]
def funcof(ln):
    i=bisect.bisect_right(ls, ln)-1
    if i<0: return None
    return ent[i]
if __name__=='__main__':
    for a in sys.argv[1:]:
        ln=int(a)
        e=funcof(ln)
        nxt=ent[bisect.bisect_right(ls,ln)]
        print(f'L{ln} -> {e[1]} {e[2]}  (span L{e[0]}..L{nxt[0]-1}, lines={nxt[0]-e[0]})')
