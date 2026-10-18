00014007E200  push    rbp
00014007E201  push    r15
00014007E203  push    r14
00014007E205  push    r13
00014007E207  push    r12
00014007E209  push    rsi
00014007E20A  push    rdi
00014007E20B  push    rbx
00014007E20C  sub     rsp, 0x1e8
00014007E213  lea     rbp, [rsp + 0x80]
00014007E21B  movaps  xmmword ptr [rbp + 0x150], xmm14
00014007E223  movdqa  xmmword ptr [rbp + 0x140], xmm13
00014007E22C  movaps  xmmword ptr [rbp + 0x130], xmm12
00014007E234  movaps  xmmword ptr [rbp + 0x120], xmm11
00014007E23C  movaps  xmmword ptr [rbp + 0x110], xmm10
00014007E244  movaps  xmmword ptr [rbp + 0x100], xmm9
00014007E24C  movaps  xmmword ptr [rbp + 0xf0], xmm8
00014007E254  movaps  xmmword ptr [rbp + 0xe0], xmm7
00014007E25B  movaps  xmmword ptr [rbp + 0xd0], xmm6
00014007E262  mov     qword ptr [rbp + 0xc8], 0xfffffffffffffffe
00014007E26D  movaps  xmm6, xmm3
00014007E270  mov     r12, rdx
00014007E273  mov     qword ptr [rbp - 0x28], rcx
00014007E277  mov     qword ptr [rbp + 0x10], 0
00014007E27F  mov     qword ptr [rbp + 0x18], 8
00014007E287  mov     qword ptr [rbp + 0x20], 0
00014007E28F  mov     qword ptr [rbp + 0x60], 0
00014007E297  mov     qword ptr [rbp + 0x68], 1
00014007E29F  mov     qword ptr [rbp + 0x70], 0
00014007E2A7  mov     qword ptr [rbp + 0x40], 0
00014007E2AF  mov     qword ptr [rbp + 0x48], 8
00014007E2B7  mov     qword ptr [rbp + 0x50], 0
00014007E2BF  mov     qword ptr [rbp + 0x80], 0
00014007E2CA  mov     qword ptr [rbp + 0x88], 1
00014007E2D5  mov     qword ptr [rbp + 0x90], 0
00014007E2E0  add     r8, rdx
00014007E2E3  mov     qword ptr [rbp + 0xa8], r8
00014007E2EA  mov     r15d, 1
00014007E2F0  xor     r13d, r13d
00014007E2F3  movdqa  xmm7, xmmword ptr [rip + 0x277825]   ; [rip -> 0x1402F5B20]
00014007E2FB  movq    xmm8, qword ptr [rip + 0x27782c]   ; [rip -> 0x1402F5B30]
00014007E304  movdqa  xmm9, xmmword ptr [rip + 0x277833]   ; [rip -> 0x1402F5B40]
00014007E30D  movdqa  xmm10, xmmword ptr [rip + 0x260d6a]   ; [rip -> 0x1402DF080]
00014007E316  movq    xmm11, qword ptr [rip + 0x277831]   ; [rip -> 0x1402F5B50]
00014007E31F  movdqa  xmm12, xmmword ptr [rip + 0x277838]   ; [rip -> 0x1402F5B60]
00014007E328  pcmpeqd xmm13, xmm13
00014007E32D  movdqa  xmm14, xmmword ptr [rip + 0x27783a]   ; [rip -> 0x1402F5B70]
00014007E336  xor     ebx, ebx
00014007E338  mov     eax, 1
00014007E33D  mov     qword ptr [rbp + 0xb8], rax
00014007E344  xor     edi, edi
00014007E346  jmp     0x14007e39d
00014007E348  nop     dword ptr [rax + rax]
00014007E350  mov     rax, qword ptr [rbp + 0x48]
00014007E354  mov     rcx, rsi
00014007E357  shl     rcx, 5
00014007E35B  mov     rdx, qword ptr [rbp + 0xb0]
00014007E362  mov     qword ptr [rax + rcx], rdx
00014007E366  mov     rdx, qword ptr [rbp + 0xb8]
00014007E36D  mov     qword ptr [rax + rcx + 8], rdx
00014007E372  mov     qword ptr [rax + rcx + 0x10], r14
00014007E377  mov     byte ptr [rax + rcx + 0x18], dil
00014007E37C  inc     rsi
00014007E37F  mov     qword ptr [rbp + 0x50], rsi
00014007E383  mov     dil, 1
00014007E386  xor     r13d, r13d
00014007E389  xor     ebx, ebx
00014007E38B  mov     r15d, 1
00014007E391  mov     eax, 1
00014007E396  mov     qword ptr [rbp + 0xb8], rax
00014007E39D  xor     r14d, r14d
00014007E3A0  jmp     0x14007e3cb
00014007E3A2  nop     word ptr cs:[rax + rax]
00014007E3B0  mov     byte ptr [r15 + rax], sil
00014007E3B4  add     r13, rbx
00014007E3B7  mov     qword ptr [rbp + 0x90], r13
00014007E3BE  mov     rbx, r13
00014007E3C1  mov     qword ptr [rbp + 0xb8], r15
00014007E3C8  mov     r14, r13
00014007E3CB  cmp     r12, qword ptr [rbp + 0xa8]
00014007E3D2  mov     qword ptr [rbp], r12
00014007E3D6  je      0x14007e89f
00014007E3DC  movzx   ecx, byte ptr [r12]
00014007E3E1  movzx   esi, cl
00014007E3E4  test    sil, sil
00014007E3E7  js      0x14007e400
00014007E3E9  inc     r12
00014007E3EC  cmp     esi, 0x20
00014007E3EF  jbe     0x14007e470
00014007E3F1  jmp     0x14007e486
00014007E3F6  nop     word ptr cs:[rax + rax]
00014007E400  mov     eax, esi
00014007E402  and     eax, 0x1f
00014007E405  movzx   edx, byte ptr [r12 + 1]
00014007E40B  and     edx, 0x3f
00014007E40E  cmp     sil, 0xdf
00014007E412  jbe     0x14007e44b
00014007E414  movzx   esi, byte ptr [r12 + 2]
00014007E41A  shl     edx, 6
00014007E41D  and     esi, 0x3f
00014007E420  or      esi, edx
00014007E422  cmp     cl, 0xf0
00014007E425  jb      0x14007e45d
00014007E427  mov     rcx, r12
00014007E42A  add     r12, 4
00014007E42E  movzx   ecx, byte ptr [rcx + 3]
00014007E432  and     eax, 7
00014007E435  shl     eax, 0x12
00014007E438  shl     esi, 6
00014007E43B  and     ecx, 0x3f
00014007E43E  or      ecx, esi
00014007E440  or      ecx, eax
00014007E442  mov     esi, ecx
00014007E444  cmp     esi, 0x20
00014007E447  jbe     0x14007e470
00014007E449  jmp     0x14007e486
00014007E44B  add     r12, 2
00014007E44F  shl     eax, 6
00014007E452  or      eax, edx
00014007E454  mov     esi, eax
00014007E456  cmp     esi, 0x20
00014007E459  jbe     0x14007e470
00014007E45B  jmp     0x14007e486
00014007E45D  add     r12, 3
00014007E461  shl     eax, 0xc
00014007E464  or      esi, eax
00014007E466  cmp     esi, 0x20
00014007E469  ja      0x14007e486
00014007E46B  nop     dword ptr [rax + rax]
00014007E470  mov     eax, esi
00014007E472  movabs  rcx, 0x100003e00
00014007E47C  bt      rcx, rax
00014007E480  jb      0x14007e680
00014007E486  cmp     esi, 0x80
00014007E48C  jb      0x14007e510
00014007E492  mov     eax, esi
00014007E494  shr     eax, 8
00014007E497  cmp     eax, 0x1f
00014007E49A  jg      0x14007e4c0
00014007E49C  test    eax, eax
00014007E49E  je      0x14007e4dc
00014007E4A0  cmp     eax, 0x16
00014007E4A3  jne     0x14007e510
00014007E4A5  cmp     esi, 0x1680
00014007E4AB  sete    al
00014007E4AE  test    al, 1
00014007E4B0  je      0x14007e510
00014007E4B2  jmp     0x14007e680
00014007E4B7  nop     word ptr [rax + rax]
00014007E4C0  cmp     eax, 0x20
00014007E4C3  je      0x14007e4f4
00014007E4C5  cmp     eax, 0x30
00014007E4C8  jne     0x14007e510
00014007E4CA  cmp     esi, 0x3000
00014007E4D0  sete    al
00014007E4D3  test    al, 1
00014007E4D5  je      0x14007e510
00014007E4D7  jmp     0x14007e680
00014007E4DC  movzx   eax, sil
00014007E4E0  mov     rcx, qword ptr [rip + 0x5c5911]   ; [rip -> 0x140643DF8]
00014007E4E7  movzx   eax, byte ptr [rcx + rax]
00014007E4EB  test    al, 1
00014007E4ED  je      0x14007e510
00014007E4EF  jmp     0x14007e680
00014007E4F4  movzx   eax, sil
00014007E4F8  mov     rcx, qword ptr [rip + 0x5c58f9]   ; [rip -> 0x140643DF8]
00014007E4FF  movzx   eax, byte ptr [rcx + rax]
00014007E503  shr     al, 1
00014007E505  test    al, 1
00014007E507  jne     0x14007e680
00014007E50D  nop     dword ptr [rax]
00014007E510  movd    xmm0, esi
00014007E514  pshufd  xmm1, xmm0, 0
00014007E519  movdqa  xmm2, xmm1
00014007E51D  paddd   xmm2, xmm7
00014007E521  pshufd  xmm0, xmm0, 0x50
00014007E526  paddd   xmm0, xmm8
00014007E52B  pand    xmm1, xmm9
00014007E530  pcmpeqd xmm1, xmm14
00014007E535  pxor    xmm0, xmm10
00014007E53A  pcmpgtd xmm0, xmm11
00014007E53F  pxor    xmm2, xmm10
00014007E544  pcmpgtd xmm2, xmm12
00014007E549  packssdw xmm2, xmm0
00014007E54D  pxor    xmm2, xmm13
00014007E552  pshufhw xmm0, xmm1, 0x84
00014007E557  shufps  xmm0, xmm2, 0x23
00014007E55B  shufps  xmm2, xmm0, 0x24
00014007E55F  pmovmskb eax, xmm2
00014007E563  test    eax, 0xaaaa
00014007E568  jne     0x14007e6f0
00014007E56E  mov     r13d, 1
00014007E574  cmp     esi, 0x80
00014007E57A  jb      0x14007e59a
00014007E57C  mov     r13d, 2
00014007E582  cmp     esi, 0x800
00014007E588  jb      0x14007e59a
00014007E58A  cmp     esi, 0x10000
00014007E590  mov     r13d, 4
00014007E596  sbb     r13, 0
00014007E59A  mov     rcx, qword ptr [rbp + 0x80]
00014007E5A1  sub     rcx, rbx
00014007E5A4  mov     rax, rbx
00014007E5A7  cmp     r13, rcx
00014007E5AA  ja      0x14007e635
00014007E5B0  cmp     esi, 0x80
00014007E5B6  jb      0x14007e3b0
00014007E5BC  mov     ecx, esi
00014007E5BE  and     cl, 0x3f
00014007E5C1  or      cl, 0x80
00014007E5C4  mov     edx, esi
00014007E5C6  shr     edx, 6
00014007E5C9  cmp     esi, 0x800
00014007E5CF  jae     0x14007e5e2
00014007E5D1  or      dl, 0xc0
00014007E5D4  mov     byte ptr [r15 + rax], dl
00014007E5D8  mov     byte ptr [r15 + rax + 1], cl
00014007E5DD  jmp     0x14007e3b4
00014007E5E2  and     dl, 0x3f
00014007E5E5  or      dl, 0x80
00014007E5E8  mov     r8d, esi
00014007E5EB  shr     r8d, 0xc
00014007E5EF  cmp     esi, 0x10000
00014007E5F5  jae     0x14007e60e
00014007E5F7  or      r8b, 0xe0
00014007E5FB  mov     byte ptr [r15 + rax], r8b
00014007E5FF  mov     byte ptr [r15 + rax + 1], dl
00014007E604  mov     byte ptr [r15 + rax + 2], cl
00014007E609  jmp     0x14007e3b4
00014007E60E  and     r8b, 0x3f
00014007E612  or      r8b, 0x80
00014007E616  shr     esi, 0x12
00014007E619  or      sil, 0xf0
00014007E61D  mov     byte ptr [r15 + rax], sil
00014007E621  mov     byte ptr [r15 + rax + 1], r8b
00014007E626  mov     byte ptr [r15 + rax + 2], dl
00014007E62B  mov     byte ptr [r15 + rax + 3], cl
00014007E630  jmp     0x14007e3b4
00014007E635  mov     qword ptr [rsp + 0x20], 1
00014007E63E  mov     r9d, 1
00014007E644  lea     rcx, [rbp + 0x80]
00014007E64B  mov     rdx, rbx
00014007E64E  mov     r8, r13
00014007E651  call    0x1402cc040
00014007E656  mov     r15, qword ptr [rbp + 0x88]
00014007E65D  mov     rax, qword ptr [rbp + 0x90]
00014007E664  cmp     esi, 0x80
00014007E66A  jb      0x14007e3b0
00014007E670  jmp     0x14007e5bc
00014007E675  nop     word ptr cs:[rax + rax]
00014007E680  test    r14, r14
00014007E683  je      0x14007e6d0
00014007E685  mov     rax, qword ptr [rbp + 0x80]
00014007E68C  mov     qword ptr [rbp + 0xb0], rax
00014007E693  mov     qword ptr [rbp + 0x80], 0
00014007E69E  mov     qword ptr [rbp + 0x88], 1
00014007E6A9  mov     qword ptr [rbp + 0x90], 0
00014007E6B4  mov     rsi, qword ptr [rbp + 0x50]
00014007E6B8  cmp     rsi, qword ptr [rbp + 0x40]
00014007E6BC  jne     0x14007e350
00014007E6C2  lea     rcx, [rbp + 0x40]
00014007E6C6  call    0x1402cc420
00014007E6CB  jmp     0x14007e350
00014007E6D0  cmp     qword ptr [rbp + 0x50], 0
00014007E6D5  movzx   edi, dil
00014007E6D9  mov     eax, 1
00014007E6DE  cmovne  edi, eax
00014007E6E1  jmp     0x14007e39d
00014007E6E6  nop     word ptr cs:[rax + rax]
00014007E6F0  test    rbx, rbx
00014007E6F3  je      0x14007e793
00014007E6F9  mov     rax, qword ptr [rbp + 0x80]
00014007E700  mov     qword ptr [rbp + 0xb8], rax
00014007E707  mov     rax, qword ptr [rbp + 0x88]
00014007E70E  mov     qword ptr [rbp + 0xb0], rax
00014007E715  mov     qword ptr [rbp + 0x80], 0
00014007E720  mov     qword ptr [rbp + 0x88], 1
00014007E72B  mov     qword ptr [rbp + 0x90], 0
00014007E736  mov     r14, qword ptr [rbp + 0x50]
00014007E73A  cmp     r14, qword ptr [rbp + 0x40]
00014007E73E  jne     0x14007e749
00014007E740  lea     rcx, [rbp + 0x40]
00014007E744  call    0x1402cc420
00014007E749  mov     rax, qword ptr [rbp + 0x48]
00014007E74D  mov     rcx, r14
00014007E750  shl     rcx, 5
00014007E754  mov     rdx, qword ptr [rbp + 0xb8]
00014007E75B  mov     qword ptr [rax + rcx], rdx
00014007E75F  mov     rdx, qword ptr [rbp + 0xb0]
00014007E766  mov     qword ptr [rax + rcx + 8], rdx
00014007E76B  mov     qword ptr [rax + rcx + 0x10], rbx
00014007E770  mov     byte ptr [rax + rcx + 0x18], dil
00014007E775  inc     r14
00014007E778  mov     qword ptr [rbp + 0x50], r14
00014007E77C  mov     r15d, 1
00014007E782  xor     r13d, r13d
00014007E785  mov     eax, 1
00014007E78A  mov     qword ptr [rbp + 0xb8], rax
00014007E791  xor     edi, edi
00014007E793  mov     dword ptr [rbp + 0x28], 0
00014007E79A  cmp     esi, 0x80
00014007E7A0  jae     0x14007e7b0
00014007E7A2  mov     byte ptr [rbp + 0x28], sil
00014007E7A6  mov     esi, 1
00014007E7AB  jmp     0x14007e820
00014007E7AD  nop     dword ptr [rax]
00014007E7B0  mov     eax, esi
00014007E7B2  and     al, 0x3f
00014007E7B4  or      al, 0x80
00014007E7B6  mov     ecx, esi
00014007E7B8  shr     ecx, 6
00014007E7BB  cmp     esi, 0x800
00014007E7C1  jae     0x14007e7d3
00014007E7C3  or      cl, 0xc0
00014007E7C6  mov     byte ptr [rbp + 0x28], cl
00014007E7C9  mov     byte ptr [rbp + 0x29], al
00014007E7CC  mov     esi, 2
00014007E7D1  jmp     0x14007e820
00014007E7D3  and     cl, 0x3f
00014007E7D6  or      cl, 0x80
00014007E7D9  mov     edx, esi
00014007E7DB  shr     edx, 0xc
00014007E7DE  cmp     esi, 0x10000
00014007E7E4  jae     0x14007e7f9
00014007E7E6  or      dl, 0xe0
00014007E7E9  mov     byte ptr [rbp + 0x28], dl
00014007E7EC  mov     byte ptr [rbp + 0x29], cl
00014007E7EF  mov     byte ptr [rbp + 0x2a], al
00014007E7F2  mov     esi, 3
00014007E7F7  jmp     0x14007e820
00014007E7F9  and     dl, 0x3f
00014007E7FC  or      dl, 0x80
00014007E7FF  shr     esi, 0x12
00014007E802  or      sil, 0xf0
00014007E806  mov     byte ptr [rbp + 0x28], sil
00014007E80A  mov     byte ptr [rbp + 0x29], dl
00014007E80D  mov     byte ptr [rbp + 0x2a], cl
00014007E810  mov     byte ptr [rbp + 0x2b], al
00014007E813  mov     esi, 4
00014007E818  nop     dword ptr [rax + rax]
00014007E820  call    0x140007ed0
00014007E825  mov     edx, 1
00014007E82A  mov     rcx, rsi
00014007E82D  call    0x1400549e0
00014007E832  test    rax, rax
00014007E835  je      0x14007ed10
00014007E83B  mov     qword ptr [rbp + 8], rax
00014007E83F  mov     rcx, rax
00014007E842  lea     rdx, [rbp + 0x28]
00014007E846  mov     qword ptr [rbp + 0xb0], rsi
00014007E84D  mov     r8, rsi
00014007E850  call    0x1402cb3f0
00014007E855  mov     rsi, qword ptr [rbp + 0x50]
00014007E859  cmp     rsi, qword ptr [rbp + 0x40]
00014007E85D  jne     0x14007e868
00014007E85F  lea     rcx, [rbp + 0x40]
00014007E863  call    0x1402cc420
00014007E868  mov     rax, qword ptr [rbp + 0x48]
00014007E86C  mov     rcx, rsi
00014007E86F  shl     rcx, 5
00014007E873  mov     rdx, qword ptr [rbp + 0xb0]
00014007E87A  mov     qword ptr [rax + rcx], rdx
00014007E87E  mov     r8, qword ptr [rbp + 8]
00014007E882  mov     qword ptr [rax + rcx + 8], r8
00014007E887  mov     qword ptr [rax + rcx + 0x10], rdx
00014007E88C  mov     byte ptr [rax + rcx + 0x18], dil
00014007E891  inc     rsi
00014007E894  mov     qword ptr [rbp + 0x50], rsi
00014007E898  xor     ebx, ebx
00014007E89A  jmp     0x14007e344
00014007E89F  test    r13, r13
00014007E8A2  je      0x14007e913
00014007E8A4  mov     rax, qword ptr [rbp + 0x80]
00014007E8AB  mov     qword ptr [rbp + 0xb8], rax
00014007E8B2  mov     rax, qword ptr [rbp + 0x88]
00014007E8B9  mov     qword ptr [rbp + 0xb0], rax
00014007E8C0  mov     rbx, qword ptr [rbp + 0x40]
00014007E8C4  mov     rsi, qword ptr [rbp + 0x50]
00014007E8C8  cmp     rsi, rbx
00014007E8CB  movzx   r15d, word ptr [rbp + 0x1d0]
00014007E8D3  jne     0x14007e8e2
00014007E8D5  lea     rcx, [rbp + 0x40]
00014007E8D9  call    0x1402cc420
00014007E8DE  mov     rbx, qword ptr [rbp + 0x40]
00014007E8E2  mov     r14, qword ptr [rbp + 0x48]
00014007E8E6  mov     rax, rsi
00014007E8E9  shl     rax, 5
00014007E8ED  mov     rcx, qword ptr [rbp + 0xb8]
00014007E8F4  mov     qword ptr [r14 + rax], rcx
00014007E8F8  mov     rcx, qword ptr [rbp + 0xb0]
00014007E8FF  mov     qword ptr [r14 + rax + 8], rcx
00014007E904  mov     qword ptr [r14 + rax + 0x10], r13
00014007E909  mov     byte ptr [r14 + rax + 0x18], dil
00014007E90E  inc     rsi
00014007E911  jmp     0x14007e945
00014007E913  mov     rsi, qword ptr [rbp + 0x50]
00014007E917  mov     rbx, qword ptr [rbp + 0x40]
00014007E91B  mov     r14, qword ptr [rbp + 0x48]
00014007E91F  mov     rdx, qword ptr [rbp + 0x80]
00014007E926  test    rdx, rdx
00014007E929  movzx   r15d, word ptr [rbp + 0x1d0]
00014007E931  je      0x14007e945
00014007E933  mov     rcx, qword ptr [rbp + 0x88]
00014007E93A  mov     r8d, 1
00014007E940  call    0x1400549f0
00014007E945  shl     rsi, 5
00014007E949  add     rsi, r14
00014007E94C  mov     qword ptr [rbp + 0x40], r14
00014007E950  mov     qword ptr [rbp + 0x48], r14
00014007E954  mov     qword ptr [rbp + 0xb0], rbx
00014007E95B  mov     qword ptr [rbp + 0x50], rbx
00014007E95F  mov     qword ptr [rbp + 0x58], rsi
00014007E963  lea     r12, [rbp - 0x40]
00014007E967  lea     r13, [rbp + 0x80]
00014007E96E  lea     rbx, [rip - 0x76c45]   ; [rip -> 0x140007D30]
00014007E975  mov     qword ptr [rbp + 8], r14
00014007E979  mov     rdi, r14
00014007E97C  nop     dword ptr [rax]
00014007E980  mov     r14, rdi
00014007E983  cmp     rdi, rsi
00014007E986  je      0x14007ebbc
00014007E98C  lea     rdi, [r14 + 0x20]
00014007E990  mov     qword ptr [rbp + 0x48], rdi
00014007E994  mov     rax, qword ptr [r14]
00014007E997  movups  xmm0, xmmword ptr [r14 + 8]
00014007E99C  movaps  xmmword ptr [rbp - 0x50], xmm0
00014007E9A0  mov     rcx, rax
00014007E9A3  neg     rcx
00014007E9A6  jo      0x14007ebb9
00014007E9AC  movzx   ecx, byte ptr [r14 + 0x18]
00014007E9B1  mov     qword ptr [rbp - 0x40], rax
00014007E9B5  movaps  xmm0, xmmword ptr [rbp - 0x50]
00014007E9B9  lea     rax, [rbp - 0x38]
00014007E9BD  movups  xmmword ptr [rax], xmm0
00014007E9C0  cmp     qword ptr [rbp + 0x70], 0
00014007E9C5  je      0x14007ea10
00014007E9C7  lea     rax, [rbp + 0x60]
00014007E9CB  test    cl, 1
00014007E9CE  je      0x14007ea20
00014007E9D0  mov     qword ptr [rbp + 0x80], rax
00014007E9D7  mov     qword ptr [rbp + 0x88], rbx
00014007E9DE  mov     qword ptr [rbp + 0x90], r12
00014007E9E5  mov     qword ptr [rbp + 0x98], rbx
00014007E9EC  lea     rcx, [rbp + 0x28]
00014007E9F0  lea     rdx, [rip + 0x27965a]   ; [rip -> 0x1402F8051]
00014007E9F7  mov     r8, r13
00014007E9FA  call    0x1401b1160
00014007E9FF  jmp     0x14007ea4f
00014007EA01  nop     word ptr cs:[rax + rax]
00014007EA10  lea     rcx, [rbp - 0x20]
00014007EA14  mov     rdx, r12
00014007EA17  call    0x1401b2f50
00014007EA1C  jmp     0x14007ea5f
00014007EA1E  nop     
00014007EA20  mov     qword ptr [rbp + 0x80], rax
00014007EA27  mov     qword ptr [rbp + 0x88], rbx
00014007EA2E  mov     qword ptr [rbp + 0x90], r12
00014007EA35  mov     qword ptr [rbp + 0x98], rbx
00014007EA3C  lea     rcx, [rbp + 0x28]
00014007EA40  lea     rdx, [rip + 0x279607]   ; [rip -> 0x1402F804E]
00014007EA47  mov     r8, r13
00014007EA4A  call    0x1401b1160
00014007EA4F  movups  xmm0, xmmword ptr [rbp + 0x28]
00014007EA53  movaps  xmmword ptr [rbp - 0x20], xmm0
00014007EA57  mov     rax, qword ptr [rbp + 0x38]
00014007EA5B  mov     qword ptr [rbp - 0x10], rax
00014007EA5F  mov     rdx, qword ptr [rbp - 0x18]
00014007EA63  mov     r8, qword ptr [rbp - 0x10]
00014007EA67  mov     rcx, r13
00014007EA6A  mov     qword ptr [rbp + 0xb8], rdx
00014007EA71  mov     r9d, r15d
00014007EA74  call    0x140095750
00014007EA79  movss   xmm0, dword ptr [rbp + 0x80]
00014007EA81  ucomiss xmm0, xmm6
00014007EA84  jbe     0x14007eb70
00014007EA8A  mov     r14, qword ptr [rbp + 0x70]
00014007EA8E  test    r14, r14
00014007EA91  je      0x14007eb70
00014007EA97  mov     rax, qword ptr [rbp + 0x60]
00014007EA9B  mov     qword ptr [rbp + 0xa8], rax
00014007EAA2  mov     rax, qword ptr [rbp + 0x68]
00014007EAA6  mov     qword ptr [rbp], rax
00014007EAAA  mov     qword ptr [rbp + 0x60], 0
00014007EAB2  mov     qword ptr [rbp + 0x68], 1
00014007EABA  mov     qword ptr [rbp + 0x70], 0
00014007EAC2  mov     r15, qword ptr [rbp + 0x20]
00014007EAC6  cmp     r15, qword ptr [rbp + 0x10]
00014007EACA  jne     0x14007ead5
00014007EACC  lea     rcx, [rbp + 0x10]
00014007EAD0  call    0x1402cc340
00014007EAD5  mov     rax, qword ptr [rbp + 0x18]
00014007EAD9  lea     rcx, [r15 + r15*2]
00014007EADD  mov     rdx, qword ptr [rbp + 0xa8]
00014007EAE4  mov     qword ptr [rax + rcx*8], rdx
00014007EAE8  mov     rdx, qword ptr [rbp]
00014007EAEC  mov     qword ptr [rax + rcx*8 + 8], rdx
00014007EAF1  mov     qword ptr [rax + rcx*8 + 0x10], r14
00014007EAF6  inc     r15
00014007EAF9  mov     qword ptr [rbp + 0x20], r15
00014007EAFD  mov     rax, qword ptr [rbp - 0x30]
00014007EB01  mov     qword ptr [rbp + 0x90], rax
00014007EB08  movups  xmm0, xmmword ptr [rbp - 0x40]
00014007EB0C  movaps  xmmword ptr [rbp + 0x80], xmm0
00014007EB13  mov     rdx, qword ptr [rbp + 0x60]
00014007EB17  test    rdx, rdx
00014007EB1A  je      0x14007eb2b
00014007EB1C  mov     rcx, qword ptr [rbp + 0x68]
00014007EB20  mov     r8d, 1
00014007EB26  call    0x1400549f0
00014007EB2B  mov     rax, qword ptr [rbp + 0x90]
00014007EB32  mov     qword ptr [rbp + 0x70], rax
00014007EB36  movaps  xmm0, xmmword ptr [rbp + 0x80]
00014007EB3D  movaps  xmmword ptr [rbp + 0x60], xmm0
00014007EB41  mov     rdx, qword ptr [rbp - 0x20]
00014007EB45  test    rdx, rdx
00014007EB48  movzx   r15d, word ptr [rbp + 0x1d0]
00014007EB50  je      0x14007e980
00014007EB56  mov     r8d, 1
00014007EB5C  mov     rcx, qword ptr [rbp + 0xb8]
00014007EB63  call    0x1400549f0
00014007EB68  jmp     0x14007e980
00014007EB6D  nop     dword ptr [rax]
00014007EB70  mov     rdx, qword ptr [rbp + 0x60]
00014007EB74  test    rdx, rdx
00014007EB77  je      0x14007eb88
00014007EB79  mov     rcx, qword ptr [rbp + 0x68]
00014007EB7D  mov     r8d, 1
00014007EB83  call    0x1400549f0
00014007EB88  mov     rax, qword ptr [rbp - 0x10]
00014007EB8C  mov     qword ptr [rbp + 0x70], rax
00014007EB90  movaps  xmm0, xmmword ptr [rbp - 0x20]
00014007EB94  movaps  xmmword ptr [rbp + 0x60], xmm0
00014007EB98  mov     rdx, qword ptr [rbp - 0x40]
00014007EB9C  test    rdx, rdx
00014007EB9F  je      0x14007e980
00014007EBA5  mov     rcx, qword ptr [rbp - 0x38]
00014007EBA9  mov     r8d, 1
00014007EBAF  call    0x1400549f0
00014007EBB4  jmp     0x14007e980
00014007EBB9  mov     r14, rdi
00014007EBBC  sub     rsi, r14
00014007EBBF  mov     rdi, qword ptr [rbp + 0xb0]
00014007EBC6  je      0x14007ec02
00014007EBC8  shr     rsi, 5
00014007EBCC  add     r14, 8
00014007EBD0  jmp     0x14007ebe9
00014007EBD2  nop     word ptr cs:[rax + rax]
00014007EBE0  add     r14, 0x20
00014007EBE4  dec     rsi
00014007EBE7  je      0x14007ec02
00014007EBE9  mov     rdx, qword ptr [r14 - 8]
00014007EBED  test    rdx, rdx
00014007EBF0  je      0x14007ebe0
00014007EBF2  mov     rcx, qword ptr [r14]
00014007EBF5  mov     r8d, 1
00014007EBFB  call    0x1400549f0
00014007EC00  jmp     0x14007ebe0
00014007EC02  test    rdi, rdi
00014007EC05  je      0x14007ec1d
00014007EC07  shl     rdi, 5
00014007EC0B  mov     r8d, 8
00014007EC11  mov     rcx, qword ptr [rbp + 8]
00014007EC15  mov     rdx, rdi
00014007EC18  call    0x1400549f0
00014007EC1D  mov     rsi, qword ptr [rbp + 0x70]
00014007EC21  test    rsi, rsi
00014007EC24  je      0x14007ec8b
00014007EC26  mov     rax, qword ptr [rbp + 0x60]
00014007EC2A  mov     qword ptr [rbp + 0xb8], rax
00014007EC31  mov     rax, qword ptr [rbp + 0x68]
00014007EC35  mov     qword ptr [rbp + 0xa8], rax
00014007EC3C  mov     rdi, qword ptr [rbp + 0x20]
00014007EC40  cmp     rdi, qword ptr [rbp + 0x10]
00014007EC44  jne     0x14007ec4f
00014007EC46  lea     rcx, [rbp + 0x10]
00014007EC4A  call    0x1402cc340
00014007EC4F  mov     rax, qword ptr [rbp + 0x18]
00014007EC53  lea     rcx, [rdi + rdi*2]
00014007EC57  mov     rdx, qword ptr [rbp + 0xb8]
00014007EC5E  mov     qword ptr [rax + rcx*8], rdx
00014007EC62  mov     rdx, qword ptr [rbp + 0xa8]
00014007EC69  mov     qword ptr [rax + rcx*8 + 8], rdx
00014007EC6E  mov     qword ptr [rax + rcx*8 + 0x10], rsi
00014007EC73  inc     rdi
00014007EC76  mov     qword ptr [rbp + 0x20], rdi
00014007EC7A  mov     rax, qword ptr [rbp - 0x28]
00014007EC7E  mov     qword ptr [rax + 0x10], rdi
00014007EC82  movups  xmm0, xmmword ptr [rbp + 0x10]
00014007EC86  movups  xmmword ptr [rax], xmm0
00014007EC89  jmp     0x14007ecb6
00014007EC8B  mov     rax, qword ptr [rbp + 0x20]
00014007EC8F  mov     rcx, qword ptr [rbp - 0x28]
00014007EC93  mov     qword ptr [rcx + 0x10], rax
00014007EC97  movups  xmm0, xmmword ptr [rbp + 0x10]
00014007EC9B  movups  xmmword ptr [rcx], xmm0
00014007EC9E  mov     rdx, qword ptr [rbp + 0x60]
00014007ECA2  test    rdx, rdx
00014007ECA5  je      0x14007ecb6
00014007ECA7  mov     rcx, qword ptr [rbp + 0x68]
00014007ECAB  mov     r8d, 1
00014007ECB1  call    0x1400549f0
00014007ECB6  movaps  xmm6, xmmword ptr [rbp + 0xd0]
00014007ECBD  movaps  xmm7, xmmword ptr [rbp + 0xe0]
00014007ECC4  movaps  xmm8, xmmword ptr [rbp + 0xf0]
00014007ECCC  movaps  xmm9, xmmword ptr [rbp + 0x100]
00014007ECD4  movaps  xmm10, xmmword ptr [rbp + 0x110]
00014007ECDC  movaps  xmm11, xmmword ptr [rbp + 0x120]
00014007ECE4  movaps  xmm12, xmmword ptr [rbp + 0x130]
00014007ECEC  movaps  xmm13, xmmword ptr [rbp + 0x140]
00014007ECF4  movaps  xmm14, xmmword ptr [rbp + 0x150]
00014007ECFC  add     rsp, 0x1e8
00014007ED03  pop     rbx
00014007ED04  pop     rdi
00014007ED05  pop     rsi
00014007ED06  pop     r12
00014007ED08  pop     r13
00014007ED0A  pop     r14
00014007ED0C  pop     r15
00014007ED0E  pop     rbp
00014007ED0F  ret     
00014007ED10  mov     ecx, 1
00014007ED15  mov     rdx, rsi
00014007ED18  call    0x1402d4831
00014007ED1D  ud2     
00014007ED1F  nop     
