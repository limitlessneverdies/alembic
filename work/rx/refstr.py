import sys, re, bisect
sys.path.insert(0, r'C:\Users\limit\alembic-re\work\rx')
import importlib.util
spec=importlib.util.spec_from_file_location('xdis', r'C:\Users\limit\alembic-re\work\rx\ndis.py')
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
SIM=r'C:\Users\limit\alembic-re\work\rx\sim_all.txt'
ins=[]
for l in open(SIM).read().splitlines():
    va=int(l[:12],16); rest=l[14:]
    parts=rest.split(None,1)
    mn=parts[0]; ops=parts[1].strip() if len(parts)>1 else ''
    ins.append((va,mn,ops))
addrs=[a for a,_,_ in ins]
def idx(va): return bisect.bisect_left(addrs,va)

def str_at(va, maxlen=40):
    b=m.get(va, maxlen)
    out=''
    i=0
    while i<len(b):
        c=b[i]
        if c==0x20 or (0x21<=c<0x7f):
            out+=chr(c); i+=1
        elif c>=0x80:  # maybe utf8 subscript
            try:
                s=b[i:i+3].decode('utf-8')
                out+=s; i+=3
            except Exception:
                break
        else:
            break
    return out

if __name__=='__main__':
    lo=int(sys.argv[1],16); hi=int(sys.argv[2],16)
    i0,i1=idx(lo),idx(hi)
    seen={}
    order=[]
    for a,mn,ops in ins[i0:i1]:
        for mt in re.finditer(r'\[rip \+ 0x([0-9a-f]+)\]', ops):
            d=int(mt.group(1),16)
            # instruction length: next addr - a
            j=addrs.index(a)
            nxt=addrs[j+1] if j+1<len(addrs) else a+10
            tgt=nxt+d
            if 0x1402DF000 <= tgt < 0x140642000 or 0x140642000<=tgt<0x14070A000:
                s=str_at(tgt)
                if tgt in seen: 
                    seen[tgt][1].append(a)
                else:
                    seen[tgt]=[s,[a]]
                    order.append(tgt)
    for tgt in order:
        s,us=seen[tgt]
        print(f'0x{tgt:012X}  {len(us):>3}x  "{s}"')
