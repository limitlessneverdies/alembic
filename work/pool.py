import struct
PATH = r'C:\Users\limit\Desktop\alembic.exe'
D = open(PATH, 'rb').read()
def va2raw(va):
    if 0x140001000 <= va < 0x1402DF000: return va - 0x140001000 + 0x400
    if 0x1402DF000 <= va < 0x140642000: return va - 0x1402DF000 + 0x2DDE00
    if 0x140642000 <= va: return va - 0x140642000 + 0x640600
    return None
# element 0 symbol ptr
p0, l0 = struct.unpack_from('<QQ', D[va2raw(0x14034F350):va2raw(0x14034F350)+16], 0)
print('pool start VA = 0x%X' % p0)
raw = va2raw(p0)
# dump 1200 bytes of pool
end = raw
s = D[raw:raw+1400]
print(repr(s[:1400].decode('latin1')))
