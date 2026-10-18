import struct, sys
sys.path.insert(0, r'C:\Users\limit\rea-tools\scripts')
from peutils import DATA, SECS

tsec = [s for s in SECS if s[0] == '.text'][0]
_, tbase, vsz, traw, rsz = tsec
print('text: base', hex(tbase), 'raw', hex(traw), 'rsz', hex(rsz))

targets = {0x1400FDF00: 'mega_sim', 0x140137C10: 'next_fn_after_mega'}
for target, label in targets.items():
    hits = []
    data = DATA
    start = traw
    end = traw + rsz - 5
    for off in range(rsz - 5):
        b = data[start + off]
        if b == 0xE8 or b == 0xE9:
            rel = struct.unpack_from('<i', data, start + off + 1)[0]
            instr_va = tbase + off
            tgt = instr_va + 5 + rel
            if tgt == target:
                hits.append((instr_va, 'call' if b == 0xE8 else 'jmp'))
    print(f'{label} {hex(target)}: {len(hits)} direct refs')
    for va, kind in hits[:40]:
        print('   ', hex(va), kind)
    if hits:
        # resolve enclosing function guesses: print preceding 32 bytes context of first hit
        va, kind = hits[0]
        off = va - tbase
        print('   context bytes @', hex(va))
        print('  ', data[start + off - 24:start + off + 8].hex())

# also scan FF 15 (call qword [rip+disp]) sites whose slot points at a plausible fn table? just count total call-mem sites
cnt = 0
for off in range(rsz - 6):
    if DATA[traw + off] == 0xFF and DATA[traw + off + 1] == 0x15:
        cnt += 1
print('indirect call [rip+disp32] sites in .text:', cnt)
