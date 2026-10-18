import struct, sys
PATH=r'C:\Users\limit\Desktop\alembic.exe'
D=open(PATH,'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va < 0x140840000: return va - 0x140642000 + 0x640600
    return None
def rb(va, n):
    o=va2raw(va); return D[o:o+n]

# tile -> element from FUN_140098410 switch
cases = {0x12:0,0x13:1,0x14:5,0x15:6,0x16:7,0x17:8,0x18:9,0x19:10,0x1a:11,0x1b:12,0x1c:13,0x1d:14,0x1e:15,
0x1f:16,0x20:18,0x21:19,0x22:25,0x23:28,0x24:78,0x25:79,0x26:91,0x2d:17,0x30:29,0x31:46,0x32:27,0x33:81,
0x34:4,0x35:87,0x36:54,0x37:2,0x38:3,0x39:20,0x3a:21,0x3b:22,0x3c:23,0x3d:24,0x3e:26,0x3f:30,0x40:31,
0x41:32,0x42:33,0x43:34,0x44:35,0x45:36,0x46:37,0x47:38,0x48:39,0x49:40,0x4a:41,0x4b:42,0x4c:43,0x4d:44,
0x4e:45,0x4f:47,0x50:48,0x51:49,0x52:50,0x53:51,0x54:52,0x55:53,0x56:55,0x57:56,0x58:57,0x59:58,0x5a:59,
0x5b:60,0x5c:61,0x5d:62,0x5e:63,0x5f:64,0x60:65,0x61:66,0x62:67,0x63:68,0x64:69,0x65:70,0x66:71,0x67:72,
0x68:73,0x69:74,0x6a:75,0x6b:76,0x6c:77,0x6d:80,0x6e:82,0x6f:83,0x70:84,0x71:85,0x72:86,0x73:88,0x74:89,0x75:90}

syms = ["H","He","Li","Be","B","C","N","O","F","Ne","Na","Mg","Al","Si","P","S","Cl","Ar","K","Ca","Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn","Ga","Ge","As","Se","Br","Kr","Rb","Sr","Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd","In","Sn","Sb","Te","I","Xe","Cs","Ba","La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb","Lu","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg","Tl","Pb","Bi","Po","At","Rn","Fr","Ra","Ac","Th","Pa","U"]

arr = rb(0x14035D008, 92)
print('array at 0x14035D008 (elem idx -> id):')
inv = {}
for i, v in enumerate(arr):
    got = cases.get(v, None)
    ok = 'OK ' if got == i else f'MISMATCH(->{got} {syms[got] if got is not None else "none"})'
    print(f'  {i:2d} {syms[i]:2s} -> 0x{v:02X}  {ok}')
    inv.setdefault(v, []).append(i)
# inverse check
print('\ntile ids not used by any element:')
for t in range(0x12, 0x90):
    if t not in inv:
        got = cases.get(t)
        print(f'  0x{t:02X} ({t}) -> element {got} {syms[got] if got is not None else "N/A"}')
print('\nduplicate tile ids:', {hex(k): v for k, v in inv.items() if len(v) > 1})
print('\nU tile id = 0x%02X' % arr[91])
