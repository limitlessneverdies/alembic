000140087A90  push    rbp
000140087A91  push    r15
000140087A93  push    r14
000140087A95  push    r13
000140087A97  push    r12
000140087A99  push    rsi
000140087A9A  push    rdi
000140087A9B  push    rbx
000140087A9C  sub     rsp, 0x388
000140087AA3  lea     rbp, [rsp + 0x80]
000140087AAB  movdqa  xmmword ptr [rbp + 0x2f0], xmm6
000140087AB3  mov     qword ptr [rbp + 0x2e8], 0xfffffffffffffffe
000140087ABE  mov     r14, rdx
000140087AC1  mov     qword ptr [rbp + 0x208], rcx
000140087AC8  cmp     qword ptr [rdx + 0x70], 0
000140087ACD  je      0x140087b12
000140087ACF  mov     rdx, qword ptr [r14 + 0x60]
000140087AD3  test    rdx, rdx
000140087AD6  je      0x14008a9eb
000140087ADC  mov     r8, qword ptr [r14 + 0x68]
000140087AE0  lea     rcx, [rbp + 8]
000140087AE4  call    0x1401c50d0
000140087AE9  cmp     qword ptr [r14 + 0x88], 0
000140087AF1  je      0x140087b2c
000140087AF3  mov     rdx, qword ptr [r14 + 0x78]
000140087AF7  test    rdx, rdx
000140087AFA  je      0x14008a9f7
000140087B00  mov     r8, qword ptr [r14 + 0x80]
000140087B07  lea     rcx, [rbp + 0x70]
000140087B0B  call    0x1401c4960
000140087B10  jmp     0x140087b3f
000140087B12  mov     qword ptr [rbp + 8], 0
000140087B1A  mov     qword ptr [rbp + 0x18], 0
000140087B22  cmp     qword ptr [r14 + 0x88], 0
000140087B2A  jne     0x140087af3
000140087B2C  mov     qword ptr [rbp + 0x70], 0
000140087B34  mov     qword ptr [rbp + 0x80], 0
000140087B3F  mov     rax, qword ptr [rbp + 0x80]
000140087B46  mov     qword ptr [rbp + 0x30], rax
000140087B4A  mov     rax, qword ptr [rbp + 0x70]
000140087B4E  mov     qword ptr [rbp + 0x20], rax
000140087B52  mov     rax, qword ptr [rbp + 0x78]
000140087B56  mov     qword ptr [rbp + 0x28], rax
000140087B5A  cmp     qword ptr [r14 + 0xa0], 0
000140087B62  je      0x140087bb0
000140087B64  mov     rdx, qword ptr [r14 + 0x90]
000140087B6B  test    rdx, rdx
000140087B6E  je      0x14008aa08
000140087B74  mov     r8, qword ptr [r14 + 0x98]
000140087B7B  lea     rcx, [rbp - 0x10]
000140087B7F  call    0x1401c54f0
000140087B84  cmp     qword ptr [r14 + 0xb8], 0
000140087B8C  je      0x140087bca
000140087B8E  mov     rdx, qword ptr [r14 + 0xa8]
000140087B95  test    rdx, rdx
000140087B98  je      0x14008aa19
000140087B9E  mov     r8, qword ptr [r14 + 0xb0]
000140087BA5  lea     rcx, [rbp + 0x70]
000140087BA9  call    0x1401c50d0
000140087BAE  jmp     0x140087bdd
000140087BB0  mov     qword ptr [rbp - 0x10], 0
000140087BB8  mov     qword ptr [rbp], 0
000140087BC0  cmp     qword ptr [r14 + 0xb8], 0
000140087BC8  jne     0x140087b8e
000140087BCA  mov     qword ptr [rbp + 0x70], 0
000140087BD2  mov     qword ptr [rbp + 0x80], 0
000140087BDD  mov     rax, qword ptr [rbp + 0x80]
000140087BE4  mov     qword ptr [rbp + 0x60], rax
000140087BE8  mov     rax, qword ptr [rbp + 0x70]
000140087BEC  mov     qword ptr [rbp + 0x50], rax
000140087BF0  mov     rax, qword ptr [rbp + 0x78]
000140087BF4  mov     qword ptr [rbp + 0x58], rax
000140087BF8  mov     r12b, byte ptr [r14 + 0x193]
000140087BFF  mov     di, word ptr [r14 + 0x100]
000140087C07  movzx   ebx, word ptr [r14 + 0x18f]
000140087C0F  lea     rcx, [rbp + 0x270]
000140087C16  mov     rdx, r14
000140087C19  call    0x1401cbd00
000140087C1E  lea     rdx, [r14 + 0x18]
000140087C22  lea     rcx, [rbp + 0x38]
000140087C26  call    0x1401cb8d0
000140087C2B  mov     r13, qword ptr [r14 + 0x40]
000140087C2F  mov     rsi, r13
000140087C32  shl     rsi, 4
000140087C36  mov     rax, r13
000140087C39  shr     rax, 0x3c
000140087C3D  setne   al
000140087C40  movabs  rcx, 0x7ffffffffffffff8
000140087C4A  cmp     rsi, rcx
000140087C4D  seta    cl
000140087C50  or      cl, al
000140087C52  je      0x140087c67
000140087C54  xor     r15d, r15d
000140087C57  mov     rcx, r15
000140087C5A  mov     rdx, rsi
000140087C5D  call    0x1402d4831
000140087C62  jmp     0x14008add8
000140087C67  mov     qword ptr [rbp + 0x210], r14
000140087C6E  mov     r14, qword ptr [r14 + 0x38]
000140087C72  test    rsi, rsi
000140087C75  je      0x140087c9d
000140087C77  call    0x140007ed0
000140087C7C  mov     r15d, 8
000140087C82  mov     edx, 8
000140087C87  mov     rcx, rsi
000140087C8A  call    0x1400549e0
000140087C8F  test    rax, rax
000140087C92  je      0x140087c57
000140087C94  mov     qword ptr [rbp + 0x2a8], r13
000140087C9B  jmp     0x140087cad
000140087C9D  mov     eax, 8
000140087CA2  mov     qword ptr [rbp + 0x2a8], 0
000140087CAD  mov     qword ptr [rbp + 0x2a0], rax
000140087CB4  mov     rcx, rax
000140087CB7  mov     rdx, r14
000140087CBA  mov     r8, rsi
000140087CBD  call    0x1402cb3f0
000140087CC2  mov     r14, qword ptr [rbp + 0x210]
000140087CC9  cmp     qword ptr [r14 + 0xe0], 0
000140087CD1  je      0x140087cf5
000140087CD3  mov     rdx, qword ptr [r14 + 0xd0]
000140087CDA  test    rdx, rdx
000140087CDD  je      0x14008aa3b
000140087CE3  mov     r8, qword ptr [r14 + 0xd8]
000140087CEA  lea     rcx, [rbp + 0x70]
000140087CEE  call    0x1401c4d30
000140087CF3  jmp     0x140087d08
000140087CF5  mov     qword ptr [rbp + 0x70], 0
000140087CFD  mov     qword ptr [rbp + 0x80], 0
000140087D08  mov     rax, qword ptr [rbp + 0x80]
000140087D0F  mov     qword ptr [rbp + 0x230], rax
000140087D16  mov     rax, qword ptr [rbp + 0x70]
000140087D1A  mov     qword ptr [rbp + 0x220], rax
000140087D21  mov     rax, qword ptr [rbp + 0x78]
000140087D25  mov     qword ptr [rbp + 0x228], rax
000140087D2C  cmp     qword ptr [r14 + 0xf8], 0
000140087D34  je      0x140087d58
000140087D36  mov     rdx, qword ptr [r14 + 0xe8]
000140087D3D  test    rdx, rdx
000140087D40  je      0x14008aa4c
000140087D46  mov     r8, qword ptr [r14 + 0xf0]
000140087D4D  lea     rcx, [rbp + 0x70]
000140087D51  call    0x1401c4d30
000140087D56  jmp     0x140087d6b
000140087D58  mov     qword ptr [rbp + 0x70], 0
000140087D60  mov     qword ptr [rbp + 0x80], 0
000140087D6B  mov     rax, qword ptr [rbp + 0x80]
000140087D72  mov     qword ptr [rbp + 0x250], rax
000140087D79  mov     rax, qword ptr [rbp + 0x70]
000140087D7D  mov     qword ptr [rbp + 0x240], rax
000140087D84  mov     rax, qword ptr [rbp + 0x78]
000140087D88  mov     qword ptr [rbp + 0x248], rax
000140087D8F  lea     rdx, [r14 + 0x48]
000140087D93  lea     rsi, [rbp + 0x2b0]
000140087D9A  mov     rcx, rsi
000140087D9D  call    0x1401cb740
000140087DA2  movd    xmm6, ebx
000140087DA6  lea     rdx, [r14 + 0x102]
000140087DAD  movzx   ebx, byte ptr [r14 + 0x194]
000140087DB5  lea     rcx, [rbp + 0x172]
000140087DBC  mov     r8d, 0x8d
000140087DC2  call    0x1402cb3f0
000140087DC7  mov     rax, qword ptr [rbp + 0x18]
000140087DCB  mov     qword ptr [rbp + 0xe0], rax
000140087DD2  movups  xmm0, xmmword ptr [rbp + 8]
000140087DD6  movaps  xmmword ptr [rbp + 0xd0], xmm0
000140087DDD  mov     rax, qword ptr [rbp + 0x30]
000140087DE1  mov     qword ptr [rbp + 0xf8], rax
000140087DE8  movaps  xmm0, xmmword ptr [rbp + 0x20]
000140087DEC  movups  xmmword ptr [rbp + 0xe8], xmm0
000140087DF3  movups  xmm0, xmmword ptr [rbp - 0x10]
000140087DF7  movaps  xmmword ptr [rbp + 0x100], xmm0
000140087DFE  mov     rax, qword ptr [rbp]
000140087E02  mov     qword ptr [rbp + 0x110], rax
000140087E09  movaps  xmm0, xmmword ptr [rbp + 0x50]
000140087E0D  movups  xmmword ptr [rbp + 0x118], xmm0
000140087E14  mov     rax, qword ptr [rbp + 0x60]
000140087E18  mov     qword ptr [rbp + 0x128], rax
000140087E1F  mov     byte ptr [rbp + 0x203], r12b
000140087E26  movups  xmm0, xmmword ptr [r14 + 0xc0]
000140087E2E  movaps  xmmword ptr [rbp + 0x130], xmm0
000140087E35  mov     word ptr [rbp + 0x170], di
000140087E3C  movups  xmm0, xmmword ptr [rbp + 0x270]
000140087E43  movaps  xmmword ptr [rbp + 0x70], xmm0
000140087E47  mov     rax, qword ptr [rbp + 0x280]
000140087E4E  mov     qword ptr [rbp + 0x80], rax
000140087E55  movups  xmm0, xmmword ptr [rbp + 0x38]
000140087E59  movups  xmmword ptr [rbp + 0x88], xmm0
000140087E60  mov     rax, qword ptr [rbp + 0x48]
000140087E64  mov     qword ptr [rbp + 0x98], rax
000140087E6B  mov     rax, qword ptr [rbp + 0x2a8]
000140087E72  mov     qword ptr [rbp + 0xa0], rax
000140087E79  mov     rax, qword ptr [rbp + 0x2a0]
000140087E80  mov     qword ptr [rbp + 0xa8], rax
000140087E87  mov     qword ptr [rbp + 0xb0], r13
000140087E8E  movaps  xmm0, xmmword ptr [rbp + 0x220]
000140087E95  movaps  xmmword ptr [rbp + 0x140], xmm0
000140087E9C  mov     rax, qword ptr [rbp + 0x230]
000140087EA3  mov     qword ptr [rbp + 0x150], rax
000140087EAA  mov     rax, qword ptr [rbp + 0x250]
000140087EB1  mov     qword ptr [rbp + 0x168], rax
000140087EB8  movaps  xmm0, xmmword ptr [rbp + 0x240]
000140087EBF  movups  xmmword ptr [rbp + 0x158], xmm0
000140087EC6  mov     rax, qword ptr [rbp + 0x2c0]
000140087ECD  mov     qword ptr [rbp + 0xc8], rax
000140087ED4  movups  xmm0, xmmword ptr [rbp + 0x2b0]
000140087EDB  movups  xmmword ptr [rbp + 0xb8], xmm0
000140087EE2  mov     byte ptr [rbp + 0x204], bl
000140087EE8  movzx   eax, word ptr [r14 + 0x191]
000140087EF0  movd    xmm0, eax
000140087EF4  punpcklwd xmm6, xmm0
000140087EF8  movd    dword ptr [rbp + 0x1ff], xmm6
000140087F00  mov     rax, qword ptr [rip + 0x5ba1c9]   ; [rip -> 0x1406420D0]
000140087F07  mov     ecx, eax
000140087F09  and     ecx, 8
000140087F0C  shr     ecx, 3
000140087F0F  cmp     rax, -0x10
000140087F13  setae   dl
000140087F16  or      dl, cl
000140087F18  je      0x140087f30
000140087F1A  lea     rcx, [rip + 0x5ba1af]   ; [rip -> 0x1406420D0]
000140087F21  xor     edx, edx
000140087F23  mov     r9d, 0x3b9aca00
000140087F29  call    0x1402d1400
000140087F2E  jmp     0x140087f3f
000140087F30  lea     rcx, [rax + 0x10]
000140087F34  lock cmpxchg qword ptr [rip + 0x5ba193], rcx   ; [rip -> 0x1406420D0]
000140087F3D  jne     0x140087f1a
000140087F3F  movzx   eax, word ptr [rip + 0x5ba1a2]   ; [rip -> 0x1406420E8]
000140087F46  mov     word ptr [rbp + 0x270], ax
000140087F4D  mov     rax, 0xfffffffffffffff0
000140087F54  lock xadd qword ptr [rip + 0x5ba173], rax   ; [rip -> 0x1406420D0]
000140087F5D  and     rax, 0xfffffffffffffff2
000140087F61  cmp     rax, 0x12
000140087F65  je      0x14008aa2a
000140087F6B  lea     rax, [rbp + 0x270]
000140087F72  mov     qword ptr [rbp + 0x38], rax
000140087F76  mov     qword ptr [rbp + 0x220], rax
000140087F7D  mov     rdx, qword ptr [rbp + 0xd0]
000140087F84  test    rdx, rdx
000140087F87  je      0x140087fab
000140087F89  mov     r8, qword ptr [rbp + 0xd8]
000140087F90  lea     rcx, [rbp + 0x2c8]
000140087F97  mov     r9d, 2
000140087F9D  call    0x140206630
000140087FA2  lea     rax, [rbp + 0xd0]
000140087FA9  jmp     0x140087fb8
000140087FAB  mov     qword ptr [rbp + 0x2c8], 0
000140087FB6  xor     eax, eax
000140087FB8  lea     rdi, [rbp + 0x100]
000140087FBF  lea     r14, [rbp + 0x140]
000140087FC6  lea     rcx, [rbp + 0x158]
000140087FCD  mov     qword ptr [rbp + 0x2a8], rcx
000140087FD4  lea     r15, [rbp + 0x2b8]
000140087FDB  lea     rcx, [rbp + 0xe0]
000140087FE2  mov     qword ptr [rbp + 0x2b8], rcx
000140087FE9  mov     qword ptr [rbp + 0x2c0], rax
000140087FF0  lea     rax, [rbp + 0x220]
000140087FF7  mov     qword ptr [rbp + 0x2b0], rax
000140087FFE  lea     r12, [rbp + 0x240]
000140088005  nop     word ptr cs:[rax + rax]
000140088010  mov     qword ptr [rbp + 0x240], rsi
000140088017  mov     rcx, r15
00014008801A  mov     rdx, r12
00014008801D  call    0x1401c43b0
000140088022  test    al, 1
000140088024  jne     0x140088010
000140088026  mov     rdx, qword ptr [rbp + 0x100]
00014008802D  mov     rax, qword ptr [rbp + 0x110]
000140088034  test    rdx, rdx
000140088037  setne   cl
00014008803A  test    rax, rax
00014008803D  setne   r8b
000140088041  and     r8b, cl
000140088044  cmp     r8b, 1
000140088048  jne     0x140088339
00014008804E  mov     r9, qword ptr [rbp + 0x108]
000140088055  movzx   ecx, word ptr [rbp + 0x270]
00014008805C  xor     r8d, r8d
00014008805F  jmp     0x140088087
000140088061  nop     word ptr cs:[rax + rax]
000140088070  xor     ebx, ebx
000140088072  sub     rdx, rbx
000140088075  mov     qword ptr [r10 + 0x10], rdx
000140088079  mov     edx, 0
00014008807E  dec     rax
000140088081  je      0x140088332
000140088087  test    r8, r8
00014008808A  je      0x1400880b0
00014008808C  movzx   r10d, word ptr [r8 + 0x13e]
000140088094  cmp     r9, r10
000140088097  jae     0x140088160
00014008809D  mov     r10, r8
0001400880A0  mov     r11, r9
0001400880A3  jmp     0x140088184
0001400880A8  nop     dword ptr [rax + rax]
0001400880B0  test    r9, r9
0001400880B3  je      0x1400880ed
0001400880B5  mov     r10, r9
0001400880B8  mov     r8, rdx
0001400880BB  and     r10, 7
0001400880BF  je      0x1400880f2
0001400880C1  xor     r11d, r11d
0001400880C4  nop     word ptr cs:[rax + rax]
0001400880D0  mov     r8, qword ptr [r8 + 0x140]
0001400880D7  inc     r11
0001400880DA  cmp     r10, r11
0001400880DD  jne     0x1400880d0
0001400880DF  mov     rdx, r9
0001400880E2  sub     rdx, r11
0001400880E5  cmp     r9, 8
0001400880E9  jae     0x140088100
0001400880EB  jmp     0x14008813e
0001400880ED  mov     r8, rdx
0001400880F0  jmp     0x14008813e
0001400880F2  mov     rdx, r9
0001400880F5  cmp     r9, 8
0001400880F9  jb      0x14008813e
0001400880FB  nop     dword ptr [rax + rax]
000140088100  mov     r8, qword ptr [r8 + 0x140]
000140088107  mov     r8, qword ptr [r8 + 0x140]
00014008810E  mov     r8, qword ptr [r8 + 0x140]
000140088115  mov     r8, qword ptr [r8 + 0x140]
00014008811C  mov     r8, qword ptr [r8 + 0x140]
000140088123  mov     r8, qword ptr [r8 + 0x140]
00014008812A  mov     r8, qword ptr [r8 + 0x140]
000140088131  mov     r8, qword ptr [r8 + 0x140]
000140088138  add     rdx, -8
00014008813C  jne     0x140088100
00014008813E  xor     edx, edx
000140088140  xor     r9d, r9d
000140088143  movzx   r10d, word ptr [r8 + 0x13e]
00014008814B  cmp     r9, r10
00014008814E  jb      0x14008809d
000140088154  nop     word ptr cs:[rax + rax]
000140088160  mov     r10, qword ptr [r8]
000140088163  test    r10, r10
000140088166  je      0x14008aa7f
00014008816C  inc     rdx
00014008816F  movzx   r11d, word ptr [r8 + 0x13c]
000140088177  mov     r8, r10
00014008817A  cmp     r11w, word ptr [r10 + 0x13e]
000140088182  jae     0x140088160
000140088184  lea     r9, [r11 + 1]
000140088188  test    rdx, rdx
00014008818B  je      0x140088230
000140088191  lea     r9, [r10 + r9*8]
000140088195  add     r9, 0x140
00014008819C  mov     rsi, rdx
00014008819F  and     rsi, 7
0001400881A3  je      0x140088320
0001400881A9  xor     ebx, ebx
0001400881AB  nop     dword ptr [rax + rax]
0001400881B0  mov     r8, qword ptr [r9]
0001400881B3  lea     r9, [r8 + 0x140]
0001400881BA  inc     rbx
0001400881BD  cmp     rsi, rbx
0001400881C0  jne     0x1400881b0
0001400881C2  mov     rsi, rdx
0001400881C5  sub     rsi, rbx
0001400881C8  cmp     rdx, 8
0001400881CC  jb      0x140088211
0001400881CE  nop     
0001400881D0  mov     rdx, qword ptr [r9]
0001400881D3  mov     rdx, qword ptr [rdx + 0x140]
0001400881DA  mov     rdx, qword ptr [rdx + 0x140]
0001400881E1  mov     rdx, qword ptr [rdx + 0x140]
0001400881E8  mov     rdx, qword ptr [rdx + 0x140]
0001400881EF  mov     rdx, qword ptr [rdx + 0x140]
0001400881F6  mov     rdx, qword ptr [rdx + 0x140]
0001400881FD  mov     r8, qword ptr [rdx + 0x140]
000140088204  lea     r9, [r8 + 0x140]
00014008820B  add     rsi, -8
00014008820F  jne     0x1400881d0
000140088211  xor     r9d, r9d
000140088214  lea     r11, [r11 + r11*2]
000140088218  mov     rdx, qword ptr [r10 + r11*8 + 0x18]
00014008821D  test    rdx, rdx
000140088220  jne     0x140088245
000140088222  jmp     0x140088079
000140088227  nop     word ptr [rax + rax]
000140088230  mov     r8, r10
000140088233  lea     r11, [r11 + r11*2]
000140088237  mov     rdx, qword ptr [r10 + r11*8 + 0x18]
00014008823C  test    rdx, rdx
00014008823F  je      0x140088079
000140088245  lea     r10, [r10 + r11*8]
000140088249  add     r10, 8
00014008824D  mov     rbx, qword ptr [r10 + 8]
000140088251  mov     r15, rdx
000140088254  neg     r15
000140088257  lea     r11, [rbx + 8]
00014008825B  mov     esi, 1
000140088260  jmp     0x140088288
000140088262  nop     word ptr cs:[rax + rax]
000140088270  lea     r12, [r15 + rsi]
000140088274  inc     r12
000140088277  inc     rsi
00014008827A  add     r11, 8
00014008827E  cmp     r12, 1
000140088282  je      0x140088070
000140088288  cmp     byte ptr [rbx + rsi*8 - 8], 0x29
00014008828D  jne     0x140088296
00014008828F  cmp     word ptr [rbx + rsi*8 - 6], cx
000140088294  jae     0x1400882a4
000140088296  cmp     byte ptr [rbx + rsi*8 - 4], 0x29
00014008829B  jne     0x140088270
00014008829D  cmp     word ptr [rbx + rsi*8 - 2], cx
0001400882A2  jb      0x140088270
0001400882A4  mov     ebx, 1
0001400882A9  cmp     rsi, rdx
0001400882AC  je      0x140088072
0001400882B2  mov     r15, rdx
0001400882B5  jmp     0x1400882e2
0001400882B7  nop     word ptr [rax + rax]
0001400882C0  lea     r12, [rbx*8]
0001400882C8  neg     r12
0001400882CB  mov     r13, qword ptr [r11]
0001400882CE  mov     qword ptr [r11 + r12], r13
0001400882D2  dec     r15
0001400882D5  add     r11, 8
0001400882D9  cmp     rsi, r15
0001400882DC  je      0x140088072
0001400882E2  cmp     byte ptr [r11], 0x29
0001400882E6  jne     0x1400882ef
0001400882E8  cmp     word ptr [r11 + 2], cx
0001400882ED  jae     0x1400882fd
0001400882EF  cmp     byte ptr [r11 + 4], 0x29
0001400882F4  jne     0x1400882c0
0001400882F6  cmp     word ptr [r11 + 6], cx
0001400882FB  jb      0x1400882c0
0001400882FD  inc     rbx
000140088300  dec     r15
000140088303  add     r11, 8
000140088307  cmp     rsi, r15
00014008830A  jne     0x1400882e2
00014008830C  jmp     0x140088072
000140088311  nop     word ptr cs:[rax + rax]
000140088320  mov     rsi, rdx
000140088323  cmp     rdx, 8
000140088327  jae     0x1400881d0
00014008832D  jmp     0x140088211
000140088332  mov     rdx, qword ptr [rbp + 0x100]
000140088339  test    rdx, rdx
00014008833C  je      0x140088359
00014008833E  mov     r8, qword ptr [rbp + 0x108]
000140088345  lea     rcx, [rbp + 0x2c0]
00014008834C  mov     r9d, 2
000140088352  call    0x1402064d0
000140088357  jmp     0x140088366
000140088359  mov     qword ptr [rbp + 0x2c0], 0
000140088364  xor     edi, edi
000140088366  lea     rax, [rbp + 0x110]
00014008836D  mov     qword ptr [rbp + 0x2b0], rax
000140088374  mov     qword ptr [rbp + 0x2b8], rdi
00014008837B  lea     r13, [rbp + 0x50]
00014008837F  mov     qword ptr [rbp + 0x240], r13
000140088386  mov     rax, qword ptr [rbp + 0x2c0]
00014008838D  mov     qword ptr [rbp + 0x258], rax
000140088394  mov     rax, qword ptr [rbp + 0x2c8]
00014008839B  mov     qword ptr [rbp + 0x260], rax
0001400883A2  mov     rax, qword ptr [rbp + 0x2d0]
0001400883A9  mov     qword ptr [rbp + 0x268], rax
0001400883B0  mov     rax, qword ptr [rbp + 0x2b0]
0001400883B7  mov     qword ptr [rbp + 0x248], rax
0001400883BE  mov     rax, qword ptr [rbp + 0x2b8]
0001400883C5  mov     qword ptr [rbp + 0x250], rax
0001400883CC  lea     rdi, [rbp + 0x258]
0001400883D3  lea     rbx, [rbp + 0x250]
0001400883DA  lea     rsi, [rbp + 0x2d0]
0001400883E1  lea     r15, [rbp + 0x2b0]
0001400883E8  lea     r12, [rbp + 0x220]
0001400883EF  pxor    xmm6, xmm6
0001400883F3  mov     r8, qword ptr [rbp + 0x258]
0001400883FA  mov     rax, qword ptr [rbp + 0x260]
000140088401  mov     rdx, qword ptr [rbp + 0x268]
000140088408  mov     qword ptr [rbp + 0x258], 0
000140088413  test    r8, r8
000140088416  je      0x14008859b
00014008841C  movzx   ecx, word ptr [r8 + 0x13e]
000140088424  cmp     rdx, rcx
000140088427  jae     0x140088430
000140088429  mov     rcx, r8
00014008842C  jmp     0x140088453
00014008842E  nop     
000140088430  mov     rcx, qword ptr [r8]
000140088433  test    rcx, rcx
000140088436  je      0x14008859b
00014008843C  inc     rax
00014008843F  movzx   edx, word ptr [r8 + 0x13c]
000140088447  mov     r8, rcx
00014008844A  cmp     dx, word ptr [rcx + 0x13e]
000140088451  jae     0x140088430
000140088453  lea     r8, [rdx + rdx*2]
000140088457  cmp     qword ptr [rcx + r8*8 + 0x18], 0
00014008845D  je      0x140088528
000140088463  inc     rdx
000140088466  test    rax, rax
000140088469  je      0x1400884f3
00014008846F  lea     rdx, [rcx + rdx*8]
000140088473  add     rdx, 0x140
00014008847A  mov     r8, rax
00014008847D  and     r8, 7
000140088481  je      0x14008851d
000140088487  xor     r9d, r9d
00014008848A  nop     word ptr [rax + rax]
000140088490  mov     rcx, qword ptr [rdx]
000140088493  lea     rdx, [rcx + 0x140]
00014008849A  inc     r9
00014008849D  cmp     r8, r9
0001400884A0  jne     0x140088490
0001400884A2  mov     r8, rax
0001400884A5  sub     r8, r9
0001400884A8  cmp     rax, 8
0001400884AC  jb      0x1400884f1
0001400884AE  nop     
0001400884B0  mov     rax, qword ptr [rdx]
0001400884B3  mov     rax, qword ptr [rax + 0x140]
0001400884BA  mov     rax, qword ptr [rax + 0x140]
0001400884C1  mov     rax, qword ptr [rax + 0x140]
0001400884C8  mov     rax, qword ptr [rax + 0x140]
0001400884CF  mov     rax, qword ptr [rax + 0x140]
0001400884D6  mov     rax, qword ptr [rax + 0x140]
0001400884DD  mov     rcx, qword ptr [rax + 0x140]
0001400884E4  lea     rdx, [rcx + 0x140]
0001400884EB  add     r8, -8
0001400884EF  jne     0x1400884b0
0001400884F1  xor     edx, edx
0001400884F3  mov     qword ptr [rbp + 0x268], rdx
0001400884FA  movdqu  xmmword ptr [rbp + 0x258], xmm6
000140088502  xor     eax, eax
000140088504  mov     r8, rcx
000140088507  movzx   ecx, word ptr [r8 + 0x13e]
00014008850F  cmp     rdx, rcx
000140088512  jae     0x140088430
000140088518  jmp     0x140088429
00014008851D  mov     r8, rax
000140088520  cmp     rax, 8
000140088524  jae     0x1400884b0
000140088526  jmp     0x1400884f1
000140088528  mov     r8, qword ptr [rbp + 0x248]
00014008852F  dec     qword ptr [r8]
000140088532  mov     qword ptr [rbp + 0x220], rcx
000140088539  mov     qword ptr [rbp + 0x228], rax
000140088540  mov     qword ptr [rbp + 0x230], rdx
000140088547  mov     rcx, r15
00014008854A  mov     rdx, r12
00014008854D  mov     r8, rbx
000140088550  mov     r9, r13
000140088553  call    0x140205e40
000140088558  mov     rdx, qword ptr [rbp + 0x2b8]
00014008855F  mov     rcx, qword ptr [rbp + 0x2c0]
000140088566  mov     rax, qword ptr [rsi + 0x10]
00014008856A  mov     qword ptr [rdi + 0x10], rax
00014008856E  movdqu  xmm0, xmmword ptr [rsi]
000140088572  movdqu  xmmword ptr [rdi], xmm0
000140088576  test    rdx, rdx
000140088579  je      0x1400883f3
00014008857F  mov     rax, rdx
000140088582  neg     rax
000140088585  jo      0x14008859b
000140088587  shl     rdx, 3
00014008858B  mov     r8d, 2
000140088591  call    0x1400549f0
000140088596  jmp     0x1400883f3
00014008859B  lea     rax, [rbp + 0x270]
0001400885A2  mov     qword ptr [rbp + 0x220], rax
0001400885A9  mov     rdx, qword ptr [rbp + 0x140]
0001400885B0  test    rdx, rdx
0001400885B3  je      0x1400885d0
0001400885B5  mov     r8, qword ptr [rbp + 0x148]
0001400885BC  lea     rcx, [rbp + 0x2c8]
0001400885C3  mov     r9d, 2
0001400885C9  call    0x140206750
0001400885CE  jmp     0x1400885de
0001400885D0  mov     qword ptr [rbp + 0x2c8], 0
0001400885DB  xor     r14d, r14d
0001400885DE  lea     rsi, [rbp + 0x2b8]
0001400885E5  lea     rax, [rbp + 0x150]
0001400885EC  mov     qword ptr [rbp + 0x2b8], rax
0001400885F3  mov     qword ptr [rbp + 0x2c0], r14
0001400885FA  mov     qword ptr [rbp + 0x2b0], r12
000140088601  lea     r13, [rbp + 0x240]
000140088608  nop     dword ptr [rax + rax]
000140088610  mov     qword ptr [rbp + 0x240], r15
000140088617  mov     rcx, rsi
00014008861A  mov     rdx, r13
00014008861D  call    0x1401c41f0
000140088622  test    al, 1
000140088624  jne     0x140088610
000140088626  lea     rax, [rbp + 0x270]
00014008862D  mov     qword ptr [rbp + 0x220], rax
000140088634  mov     rdx, qword ptr [rbp + 0x158]
00014008863B  test    rdx, rdx
00014008863E  je      0x14008865b
000140088640  mov     r8, qword ptr [rbp + 0x160]
000140088647  lea     rcx, [rbp + 0x2c8]
00014008864E  mov     r9d, 2
000140088654  call    0x140206750
000140088659  jmp     0x140088671
00014008865B  mov     qword ptr [rbp + 0x2c8], 0
000140088666  mov     qword ptr [rbp + 0x2a8], 0
000140088671  lea     rax, [rbp + 0x168]
000140088678  mov     qword ptr [rbp + 0x2b8], rax
00014008867F  mov     rax, qword ptr [rbp + 0x2a8]
000140088686  mov     qword ptr [rbp + 0x2c0], rax
00014008868D  mov     qword ptr [rbp + 0x2b0], r12
000140088694  lea     rsi, [rbp + 0x240]
00014008869B  nop     dword ptr [rax + rax]
0001400886A0  mov     qword ptr [rbp + 0x240], r15
0001400886A7  lea     rcx, [rbp + 0x2b8]
0001400886AE  mov     rdx, rsi
0001400886B1  call    0x1401c41f0
0001400886B6  test    al, 1
0001400886B8  jne     0x1400886a0
0001400886BA  lea     rdx, [rbp + 0x38]
0001400886BE  lea     rcx, [rbp + 0xb8]
0001400886C5  call    0x1401caba0
0001400886CA  cmp     qword ptr [rbp + 0xe0], 0
0001400886D2  je      0x1400886f9
0001400886D4  mov     rdx, qword ptr [rbp + 0xd0]
0001400886DB  test    rdx, rdx
0001400886DE  je      0x14008aa5d
0001400886E4  mov     r8, qword ptr [rbp + 0xd8]
0001400886EB  lea     rcx, [rbp + 0x2b0]
0001400886F2  call    0x1401c50d0
0001400886F7  jmp     0x14008870f
0001400886F9  mov     qword ptr [rbp + 0x2b0], 0
000140088704  mov     qword ptr [rbp + 0x2c0], 0
00014008870F  mov     rax, qword ptr [rbp + 0x2c0]
000140088716  mov     qword ptr [rbp + 0x280], rax
00014008871D  mov     rax, qword ptr [rbp + 0x2b0]
000140088724  mov     qword ptr [rbp + 0x270], rax
00014008872B  mov     rax, qword ptr [rbp + 0x2b8]
000140088732  mov     qword ptr [rbp + 0x278], rax
000140088739  mov     rbx, qword ptr [rbp + 0x140]
000140088740  xor     edx, edx
000140088742  mov     qword ptr [rbp + 0x298], rbx
000140088749  test    rbx, rbx
00014008874C  setne   al
00014008874F  je      0x14008875f
000140088751  mov     rcx, qword ptr [rbp + 0x150]
000140088758  mov     qword ptr [rbp + 0x298], rcx
00014008875F  mov     dl, al
000140088761  mov     qword ptr [rbp + 0x2a8], rdx
000140088768  mov     r13, qword ptr [rbp + 0x158]
00014008876F  xor     edx, edx
000140088771  mov     qword ptr [rbp + 0x290], r13
000140088778  test    r13, r13
00014008877B  setne   al
00014008877E  je      0x14008878e
000140088780  mov     rcx, qword ptr [rbp + 0x168]
000140088787  mov     qword ptr [rbp + 0x290], rcx
00014008878E  mov     r12, qword ptr [rbp + 0x148]
000140088795  mov     rdi, qword ptr [rbp + 0x160]
00014008879C  mov     dl, al
00014008879E  mov     qword ptr [rbp + 0x288], rdx
0001400887A5  mov     rcx, qword ptr [rbp + 0xc0]
0001400887AC  mov     rax, qword ptr [rbp + 0xc8]
0001400887B3  lea     rax, [rax + rax*2]
0001400887B7  shl     rax, 4
0001400887BB  mov     qword ptr [rbp + 0x2a0], rcx
0001400887C2  add     rax, rcx
0001400887C5  mov     qword ptr [rbp + 0x218], rax
0001400887CC  xor     r15d, r15d
0001400887CF  lea     r14, [rbp + 0x270]
0001400887D6  xor     esi, esi
0001400887D8  jmp     0x1400887e8
0001400887DA  nop     word ptr [rax + rax]
0001400887E0  mov     rcx, r14
0001400887E3  call    0x1401c3360
0001400887E8  mov     rax, qword ptr [rbp + 0x2a8]
0001400887EF  cmp     rax, 2
0001400887F3  je      0x14008883b
0001400887F5  cmp     rax, 3
0001400887F9  je      0x140088878
0001400887FB  cmp     qword ptr [rbp + 0x298], 0
000140088803  je      0x140088830
000140088805  test    byte ptr [rbp + 0x2a8], 1
00014008880C  je      0x14008ad6a
000140088812  test    rsi, rsi
000140088815  je      0x1400888ed
00014008881B  movzx   eax, word ptr [rsi + 0x62]
00014008881F  cmp     r12, rax
000140088822  jae     0x140088ab0
000140088828  mov     rax, rsi
00014008882B  jmp     0x140088ace
000140088830  mov     qword ptr [rbp + 0x298], 0
00014008883B  cmp     qword ptr [rbp + 0x290], 0
000140088843  je      0x14008886d
000140088845  test    byte ptr [rbp + 0x288], 1
00014008884C  je      0x14008ad5c
000140088852  test    r15, r15
000140088855  je      0x1400888af
000140088857  movzx   eax, word ptr [r15 + 0x62]
00014008885C  cmp     rdi, rax
00014008885F  jae     0x140088990
000140088865  mov     rax, r15
000140088868  jmp     0x1400889ad
00014008886D  mov     qword ptr [rbp + 0x290], 0
000140088878  mov     rcx, qword ptr [rbp + 0x2a0]
00014008887F  cmp     rcx, qword ptr [rbp + 0x218]
000140088886  je      0x140088ba3
00014008888C  mov     rax, rcx
00014008888F  add     rcx, 0x30
000140088893  add     rax, 0x28
000140088897  mov     edx, 3
00014008889C  mov     qword ptr [rbp + 0x2a8], rdx
0001400888A3  mov     qword ptr [rbp + 0x2a0], rcx
0001400888AA  jmp     0x140088b60
0001400888AF  test    rdi, rdi
0001400888B2  je      0x140088931
0001400888B4  mov     rax, rdi
0001400888B7  mov     r15, r13
0001400888BA  and     rax, 7
0001400888BE  je      0x14008893e
0001400888C0  xor     ecx, ecx
0001400888C2  nop     word ptr cs:[rax + rax]
0001400888D0  mov     r15, qword ptr [r15 + 0x68]
0001400888D4  inc     rcx
0001400888D7  cmp     rax, rcx
0001400888DA  jne     0x1400888d0
0001400888DC  mov     rax, rdi
0001400888DF  sub     rax, rcx
0001400888E2  cmp     rdi, 8
0001400888E6  jae     0x140088950
0001400888E8  jmp     0x140088976
0001400888ED  test    r12, r12
0001400888F0  je      0x140088936
0001400888F2  mov     rax, r12
0001400888F5  mov     rsi, rbx
0001400888F8  and     rax, 7
0001400888FC  je      0x140088a5d
000140088902  xor     ecx, ecx
000140088904  nop     word ptr cs:[rax + rax]
000140088910  mov     rsi, qword ptr [rsi + 0x68]
000140088914  inc     rcx
000140088917  cmp     rax, rcx
00014008891A  jne     0x140088910
00014008891C  mov     rax, r12
00014008891F  sub     rax, rcx
000140088922  cmp     r12, 8
000140088926  jae     0x140088a70
00014008892C  jmp     0x140088a96
000140088931  mov     r15, r13
000140088934  jmp     0x140088976
000140088936  mov     rsi, rbx
000140088939  jmp     0x140088a96
00014008893E  mov     rax, rdi
000140088941  cmp     rdi, 8
000140088945  jb      0x140088976
000140088947  nop     word ptr [rax + rax]
000140088950  mov     rcx, qword ptr [r15 + 0x68]
000140088954  mov     rcx, qword ptr [rcx + 0x68]
000140088958  mov     rcx, qword ptr [rcx + 0x68]
00014008895C  mov     rcx, qword ptr [rcx + 0x68]
000140088960  mov     rcx, qword ptr [rcx + 0x68]
000140088964  mov     rcx, qword ptr [rcx + 0x68]
000140088968  mov     rcx, qword ptr [rcx + 0x68]
00014008896C  mov     r15, qword ptr [rcx + 0x68]
000140088970  add     rax, -8
000140088974  jne     0x140088950
000140088976  xor     r13d, r13d
000140088979  xor     edi, edi
00014008897B  movzx   eax, word ptr [r15 + 0x62]
000140088980  cmp     rdi, rax
000140088983  jb      0x140088865
000140088989  nop     dword ptr [rax]
000140088990  mov     rax, qword ptr [r15]
000140088993  test    rax, rax
000140088996  je      0x14008aa6e
00014008899C  inc     r13
00014008899F  movzx   edi, word ptr [r15 + 0x60]
0001400889A4  mov     r15, rax
0001400889A7  cmp     di, word ptr [rax + 0x62]
0001400889AB  jae     0x140088990
0001400889AD  lea     rcx, [rdi + 1]
0001400889B1  test    r13, r13
0001400889B4  je      0x140088a1d
0001400889B6  lea     rcx, [rax + rcx*8]
0001400889BA  add     rcx, 0x68
0001400889BE  mov     rdx, r13
0001400889C1  and     rdx, 7
0001400889C5  je      0x140088a52
0001400889CB  xor     r8d, r8d
0001400889CE  nop     
0001400889D0  mov     r15, qword ptr [rcx]
0001400889D3  lea     rcx, [r15 + 0x68]
0001400889D7  inc     r8
0001400889DA  cmp     rdx, r8
0001400889DD  jne     0x1400889d0
0001400889DF  mov     rdx, r13
0001400889E2  sub     rdx, r8
0001400889E5  cmp     r13, 8
0001400889E9  jb      0x140088a19
0001400889EB  nop     dword ptr [rax + rax]
0001400889F0  mov     rcx, qword ptr [rcx]
0001400889F3  mov     rcx, qword ptr [rcx + 0x68]
0001400889F7  mov     rcx, qword ptr [rcx + 0x68]
0001400889FB  mov     rcx, qword ptr [rcx + 0x68]
0001400889FF  mov     rcx, qword ptr [rcx + 0x68]
000140088A03  mov     rcx, qword ptr [rcx + 0x68]
000140088A07  mov     rcx, qword ptr [rcx + 0x68]
000140088A0B  mov     r15, qword ptr [rcx + 0x68]
000140088A0F  lea     rcx, [r15 + 0x68]
000140088A13  add     rdx, -8
000140088A17  jne     0x1400889f0
000140088A19  xor     ecx, ecx
000140088A1B  jmp     0x140088a20
000140088A1D  mov     r15, rax
000140088A20  dec     qword ptr [rbp + 0x290]
000140088A27  lea     rax, [rax + rdi*8]
000140088A2B  add     rax, 8
000140088A2F  mov     edx, 2
000140088A34  mov     qword ptr [rbp + 0x2a8], rdx
000140088A3B  mov     edx, 1
000140088A40  mov     qword ptr [rbp + 0x288], rdx
000140088A47  xor     r13d, r13d
000140088A4A  mov     rdi, rcx
000140088A4D  jmp     0x140088b60
000140088A52  mov     rdx, r13
000140088A55  cmp     r13, 8
000140088A59  jae     0x1400889f0
000140088A5B  jmp     0x140088a19
000140088A5D  mov     rax, r12
000140088A60  cmp     r12, 8
000140088A64  jb      0x140088a96
000140088A66  nop     word ptr cs:[rax + rax]
000140088A70  mov     rcx, qword ptr [rsi + 0x68]
000140088A74  mov     rcx, qword ptr [rcx + 0x68]
000140088A78  mov     rcx, qword ptr [rcx + 0x68]
000140088A7C  mov     rcx, qword ptr [rcx + 0x68]
000140088A80  mov     rcx, qword ptr [rcx + 0x68]
000140088A84  mov     rcx, qword ptr [rcx + 0x68]
000140088A88  mov     rcx, qword ptr [rcx + 0x68]
000140088A8C  mov     rsi, qword ptr [rcx + 0x68]
000140088A90  add     rax, -8
000140088A94  jne     0x140088a70
000140088A96  xor     ebx, ebx
000140088A98  xor     r12d, r12d
000140088A9B  movzx   eax, word ptr [rsi + 0x62]
000140088A9F  cmp     r12, rax
000140088AA2  jb      0x140088828
000140088AA8  nop     dword ptr [rax + rax]
000140088AB0  mov     rax, qword ptr [rsi]
000140088AB3  test    rax, rax
000140088AB6  je      0x14008aa90
000140088ABC  inc     rbx
000140088ABF  movzx   r12d, word ptr [rsi + 0x60]
000140088AC4  mov     rsi, rax
000140088AC7  cmp     r12w, word ptr [rax + 0x62]
000140088ACC  jae     0x140088ab0
000140088ACE  lea     rcx, [r12 + 1]
000140088AD3  test    rbx, rbx
000140088AD6  je      0x140088b3d
000140088AD8  lea     rcx, [rax + rcx*8]
000140088ADC  add     rcx, 0x68
000140088AE0  mov     rdx, rbx
000140088AE3  and     rdx, 7
000140088AE7  je      0x140088b94
000140088AED  xor     r8d, r8d
000140088AF0  mov     rsi, qword ptr [rcx]
000140088AF3  lea     rcx, [rsi + 0x68]
000140088AF7  inc     r8
000140088AFA  cmp     rdx, r8
000140088AFD  jne     0x140088af0
000140088AFF  mov     rdx, rbx
000140088B02  sub     rdx, r8
000140088B05  cmp     rbx, 8
000140088B09  jb      0x140088b39
000140088B0B  nop     dword ptr [rax + rax]
000140088B10  mov     rcx, qword ptr [rcx]
000140088B13  mov     rcx, qword ptr [rcx + 0x68]
000140088B17  mov     rcx, qword ptr [rcx + 0x68]
000140088B1B  mov     rcx, qword ptr [rcx + 0x68]
000140088B1F  mov     rcx, qword ptr [rcx + 0x68]
000140088B23  mov     rcx, qword ptr [rcx + 0x68]
000140088B27  mov     rcx, qword ptr [rcx + 0x68]
000140088B2B  mov     rsi, qword ptr [rcx + 0x68]
000140088B2F  lea     rcx, [rsi + 0x68]
000140088B33  add     rdx, -8
000140088B37  jne     0x140088b10
000140088B39  xor     ecx, ecx
000140088B3B  jmp     0x140088b40
000140088B3D  mov     rsi, rax
000140088B40  dec     qword ptr [rbp + 0x298]
000140088B47  lea     rax, [rax + r12*8]
000140088B4B  add     rax, 8
000140088B4F  mov     edx, 1
000140088B54  mov     qword ptr [rbp + 0x2a8], rdx
000140088B5B  xor     ebx, ebx
000140088B5D  mov     r12, rcx
000140088B60  mov     rdx, qword ptr [rax]
000140088B63  mov     rax, rdx
000140088B66  shr     rax, 0x38
000140088B6A  cmp     rax, 1
000140088B6E  je      0x1400887e0
000140088B74  cmp     eax, 5
000140088B77  jne     0x1400887e8
000140088B7D  mov     eax, edx
000140088B7F  and     eax, 0xff0000
000140088B84  cmp     eax, 0x290000
000140088B89  jne     0x1400887e8
000140088B8F  jmp     0x1400887e0
000140088B94  mov     rdx, rbx
000140088B97  cmp     rbx, 8
000140088B9B  jae     0x140088b10
000140088BA1  jmp     0x140088b39
000140088BA3  mov     rdi, qword ptr [rbp + 0x100]
000140088BAA  mov     rax, rdi
000140088BAD  test    rdi, rdi
000140088BB0  setne   byte ptr [rbp + 0x2a0]
000140088BB7  je      0x140088bc0
000140088BB9  mov     rax, qword ptr [rbp + 0x110]
000140088BC0  mov     qword ptr [rbp + 0x290], rax
000140088BC7  mov     rbx, qword ptr [rbp + 0x108]
000140088BCE  xor     r15d, r15d
000140088BD1  pxor    xmm6, xmm6
000140088BD5  xor     ecx, ecx
000140088BD7  test    rcx, rcx
000140088BDA  jne     0x140088bfc
000140088BDC  jmp     0x140088db7
000140088BE1  nop     word ptr cs:[rax + rax]
000140088BF0  mov     rcx, r12
000140088BF3  test    rcx, rcx
000140088BF6  je      0x140088db7
000140088BFC  cmp     rcx, qword ptr [rbp + 0x2a8]
000140088C03  je      0x140088db7
000140088C09  lea     r12, [rcx + 8]
000140088C0D  mov     qword ptr [rbp + 0x248], 2
000140088C18  mov     qword ptr [rbp + 0x250], rcx
000140088C1F  add     rcx, 4
000140088C23  mov     qword ptr [rbp + 0x258], rcx
000140088C2A  xor     eax, eax
000140088C2C  jmp     0x140088c91
000140088C2E  mov     qword ptr [rbp + 0x2b0], r14
000140088C35  lea     rcx, [rbp + 0x2b8]
000140088C3C  movdqu  xmmword ptr [rcx], xmm6
000140088C40  mov     qword ptr [rbp + 0x2d0], rax
000140088C47  call    0x140007ed0
000140088C4C  mov     ecx, 0x28
000140088C51  mov     edx, 8
000140088C56  call    0x1400549e0
000140088C5B  test    rax, rax
000140088C5E  je      0x140088f9a
000140088C64  mov     qword ptr [rax], 0
000140088C6B  mov     qword ptr [rbp + 0x270], rax
000140088C72  mov     qword ptr [rbp + 0x278], 0
000140088C7D  mov     word ptr [rax + 0xa], 1
000140088C83  mov     word ptr [rax + 0xc], si
000140088C87  mov     rax, r14
000140088C8A  inc     qword ptr [rax + 0x10]
000140088C8E  mov     rax, r13
000140088C91  cmp     rax, 2
000140088C95  je      0x140088bf0
000140088C9B  lea     r13, [rax + 1]
000140088C9F  mov     qword ptr [rbp + 0x240], r13
000140088CA6  mov     rcx, qword ptr [rbp + rax*8 + 0x250]
000140088CAE  cmp     byte ptr [rcx], 0x29
000140088CB1  mov     rax, r13
000140088CB4  jne     0x140088c91
000140088CB6  movzx   esi, word ptr [rcx + 2]
000140088CBA  movzx   eax, si
000140088CBD  mov     rcx, qword ptr [rbp + 0x270]
000140088CC4  test    rcx, rcx
000140088CC7  je      0x140088c2e
000140088CCD  mov     rdx, qword ptr [rbp + 0x278]
000140088CD4  movzx   r9d, word ptr [rcx + 0xa]
000140088CD9  mov     r10d, r9d
000140088CDC  add     r10d, r10d
000140088CDF  mov     r8, 0xffffffffffffffff
000140088CE6  nop     word ptr cs:[rax + rax]
000140088CF0  test    r10, r10
000140088CF3  je      0x140088d30
000140088CF5  cmp     si, word ptr [rcx + r8*2 + 0xe]
000140088CFB  seta    r11b
000140088CFF  sbb     r11b, 0
000140088D03  inc     r8
000140088D06  add     r10, -2
000140088D0A  cmp     r11b, 1
000140088D0E  je      0x140088cf0
000140088D10  movzx   r9d, r11b
000140088D14  test    r9d, r9d
000140088D17  je      0x140088c8e
000140088D1D  sub     rdx, 1
000140088D21  jae     0x140088d39
000140088D23  jmp     0x140088d40
000140088D25  nop     word ptr cs:[rax + rax]
000140088D30  mov     r8, r9
000140088D33  sub     rdx, 1
000140088D37  jb      0x140088d40
000140088D39  mov     rcx, qword ptr [rcx + r8*8 + 0x28]
000140088D3E  jmp     0x140088cd4
000140088D40  mov     qword ptr [rbp + 0x2b0], r14
000140088D47  mov     qword ptr [rbp + 0x2b8], rcx
000140088D4E  mov     qword ptr [rbp + 0x2c0], 0
000140088D59  mov     qword ptr [rbp + 0x2c8], r8
000140088D60  mov     qword ptr [rbp + 0x2d0], rax
000140088D67  lea     rax, [rbp + 0x2b8]
000140088D6E  movdqu  xmm0, xmmword ptr [rax]
000140088D72  movdqa  xmmword ptr [rbp + 0x220], xmm0
000140088D7A  mov     rax, qword ptr [rax + 0x10]
000140088D7E  mov     qword ptr [rbp + 0x230], rax
000140088D85  lea     rax, [rbp + 0x2d2]
000140088D8C  mov     qword ptr [rsp + 0x20], rax
000140088D91  lea     rcx, [rbp + 0x38]
000140088D95  lea     rdx, [rbp + 0x220]
000140088D9C  mov     r8d, esi
000140088D9F  lea     r9, [rbp + 0x2b0]
000140088DA6  call    0x140202150
000140088DAB  mov     rax, qword ptr [rbp + 0x2b0]
000140088DB2  jmp     0x140088c8a
000140088DB7  sub     qword ptr [rbp + 0x290], 1
000140088DBF  jb      0x140088fae
000140088DC5  test    byte ptr [rbp + 0x2a0], 1
000140088DCC  je      0x14008ad78
000140088DD2  test    r15, r15
000140088DD5  je      0x140088df0
000140088DD7  movzx   eax, word ptr [r15 + 0x13e]
000140088DDF  cmp     rbx, rax
000140088DE2  jae     0x140088ea0
000140088DE8  mov     rax, r15
000140088DEB  jmp     0x140088ec3
000140088DF0  test    rbx, rbx
000140088DF3  je      0x140088e2d
000140088DF5  mov     rax, rbx
000140088DF8  mov     r15, rdi
000140088DFB  and     rax, 7
000140088DFF  je      0x140088e32
000140088E01  xor     ecx, ecx
000140088E03  nop     word ptr cs:[rax + rax]
000140088E10  mov     r15, qword ptr [r15 + 0x140]
000140088E17  inc     rcx
000140088E1A  cmp     rax, rcx
000140088E1D  jne     0x140088e10
000140088E1F  mov     rax, rbx
000140088E22  sub     rax, rcx
000140088E25  cmp     rbx, 8
000140088E29  jae     0x140088e40
000140088E2B  jmp     0x140088e7e
000140088E2D  mov     r15, rdi
000140088E30  jmp     0x140088e7e
000140088E32  mov     rax, rbx
000140088E35  cmp     rbx, 8
000140088E39  jb      0x140088e7e
000140088E3B  nop     dword ptr [rax + rax]
000140088E40  mov     rcx, qword ptr [r15 + 0x140]
000140088E47  mov     rcx, qword ptr [rcx + 0x140]
000140088E4E  mov     rcx, qword ptr [rcx + 0x140]
000140088E55  mov     rcx, qword ptr [rcx + 0x140]
000140088E5C  mov     rcx, qword ptr [rcx + 0x140]
000140088E63  mov     rcx, qword ptr [rcx + 0x140]
000140088E6A  mov     rcx, qword ptr [rcx + 0x140]
000140088E71  mov     r15, qword ptr [rcx + 0x140]
000140088E78  add     rax, -8
000140088E7C  jne     0x140088e40
000140088E7E  xor     edi, edi
000140088E80  xor     ebx, ebx
000140088E82  movzx   eax, word ptr [r15 + 0x13e]
000140088E8A  cmp     rbx, rax
000140088E8D  jb      0x140088de8
000140088E93  nop     word ptr cs:[rax + rax]
000140088EA0  mov     rax, qword ptr [r15]
000140088EA3  test    rax, rax
000140088EA6  je      0x14008aaa1
000140088EAC  inc     rdi
000140088EAF  movzx   ebx, word ptr [r15 + 0x13c]
000140088EB7  mov     r15, rax
000140088EBA  cmp     bx, word ptr [rax + 0x13e]
000140088EC1  jae     0x140088ea0
000140088EC3  lea     rdx, [rbx + 1]
000140088EC7  test    rdi, rdi
000140088ECA  je      0x140088f55
000140088ED0  lea     rcx, [rax + rdx*8]
000140088ED4  add     rcx, 0x140
000140088EDB  mov     rdx, rdi
000140088EDE  and     rdx, 7
000140088EE2  je      0x140088f8b
000140088EE8  xor     r8d, r8d
000140088EEB  nop     dword ptr [rax + rax]
000140088EF0  mov     r15, qword ptr [rcx]
000140088EF3  lea     rcx, [r15 + 0x140]
000140088EFA  inc     r8
000140088EFD  cmp     rdx, r8
000140088F00  jne     0x140088ef0
000140088F02  mov     rdx, rdi
000140088F05  sub     rdx, r8
000140088F08  cmp     rdi, 8
000140088F0C  jb      0x140088f51
000140088F0E  nop     
000140088F10  mov     rcx, qword ptr [rcx]
000140088F13  mov     rcx, qword ptr [rcx + 0x140]
000140088F1A  mov     rcx, qword ptr [rcx + 0x140]
000140088F21  mov     rcx, qword ptr [rcx + 0x140]
000140088F28  mov     rcx, qword ptr [rcx + 0x140]
000140088F2F  mov     rcx, qword ptr [rcx + 0x140]
000140088F36  mov     rcx, qword ptr [rcx + 0x140]
000140088F3D  mov     r15, qword ptr [rcx + 0x140]
000140088F44  lea     rcx, [r15 + 0x140]
000140088F4B  add     rdx, -8
000140088F4F  jne     0x140088f10
000140088F51  xor     edx, edx
000140088F53  jmp     0x140088f58
000140088F55  mov     r15, rax
000140088F58  lea     r8, [rbx + rbx*2]
000140088F5C  mov     rcx, qword ptr [rax + r8*8 + 0x10]
000140088F61  mov     rax, qword ptr [rax + r8*8 + 0x18]
000140088F66  lea     rax, [rcx + rax*8]
000140088F6A  mov     qword ptr [rbp + 0x2a8], rax
000140088F71  mov     byte ptr [rbp + 0x2a0], 1
000140088F78  xor     edi, edi
000140088F7A  mov     rbx, rdx
000140088F7D  test    rcx, rcx
000140088F80  jne     0x140088bfc
000140088F86  jmp     0x140088db7
000140088F8B  mov     rdx, rdi
000140088F8E  cmp     rdi, 8
000140088F92  jae     0x140088f10
000140088F98  jmp     0x140088f51
000140088F9A  mov     ecx, 8
000140088F9F  mov     edx, 0x28
000140088FA4  call    0x1402d4818
000140088FA9  jmp     0x14008add8
000140088FAE  mov     rax, qword ptr [rbp + 0x270]
000140088FB5  mov     rcx, qword ptr [rbp + 0x278]
000140088FBC  xor     edx, edx
000140088FBE  mov     r8, rax
000140088FC1  test    rax, rax
000140088FC4  setne   r9b
000140088FC8  je      0x140088fd1
000140088FCA  mov     r8, qword ptr [rbp + 0x280]
000140088FD1  mov     dl, r9b
000140088FD4  mov     qword ptr [rbp - 0x58], rdx
000140088FD8  mov     qword ptr [rbp - 0x50], 0
000140088FE0  mov     qword ptr [rbp - 0x48], rax
000140088FE4  mov     qword ptr [rbp - 0x40], rcx
000140088FE8  mov     qword ptr [rbp - 0x38], rdx
000140088FEC  mov     qword ptr [rbp - 0x30], 0
000140088FF4  mov     qword ptr [rbp - 0x28], rax
000140088FF8  mov     qword ptr [rbp - 0x20], rcx
000140088FFC  mov     qword ptr [rbp - 0x18], r8
000140089000  lea     rcx, [rbp + 0x2b0]
000140089007  lea     rdx, [rbp - 0x58]
00014008900B  call    0x1401c7740
000140089010  mov     rbx, qword ptr [rbp + 0x2c0]
000140089017  mov     qword ptr [rbp + 0x250], rbx
00014008901E  movdqu  xmm0, xmmword ptr [rbp + 0x2b0]
000140089026  movdqa  xmmword ptr [rbp + 0x240], xmm0
00014008902E  mov     rsi, qword ptr [rbp + 0x248]
000140089035  lea     rcx, [rbp + 0x2b0]
00014008903C  mov     rdx, rsi
00014008903F  mov     r8, rbx
000140089042  mov     r9b, 1
000140089045  call    0x1402cf200
00014008904A  mov     r14, qword ptr [rbp + 0x2b0]
000140089051  mov     rdx, qword ptr [rbp + 0x2b8]
000140089058  mov     rax, r14
00014008905B  neg     rax
00014008905E  jno     0x1400890cd
000140089060  mov     rcx, qword ptr [rbp + 0x208]
000140089067  mov     qword ptr [rcx + 8], rdx
00014008906B  movabs  rax, 0x8000000000000000
000140089075  mov     qword ptr [rcx], rax
000140089078  test    rbx, rbx
00014008907B  je      0x140089108
000140089081  lea     rdi, [rsi + 0x28]
000140089085  jmp     0x140089099
000140089087  nop     word ptr [rax + rax]
000140089090  add     rdi, 0x58
000140089094  dec     rbx
000140089097  je      0x140089108
000140089099  mov     rdx, qword ptr [rdi - 0x20]
00014008909D  test    rdx, rdx
0001400890A0  je      0x1400890b1
0001400890A2  mov     rcx, qword ptr [rdi - 0x18]
0001400890A6  mov     r8d, 1
0001400890AC  call    0x1400549f0
0001400890B1  mov     rdx, qword ptr [rdi - 8]
0001400890B5  test    rdx, rdx
0001400890B8  je      0x140089090
0001400890BA  mov     rcx, qword ptr [rdi]
0001400890BD  add     rdx, rdx
0001400890C0  mov     r8d, 1
0001400890C6  call    0x1400549f0
0001400890CB  jmp     0x140089090
0001400890CD  mov     rax, qword ptr [rbp + 0x210]
0001400890D4  mov     rdi, qword ptr [rax + 0x88]
0001400890DB  shl     rdi, 2
0001400890DF  add     rdi, 0x9d
0001400890E6  mov     qword ptr [rbp + 0x288], rdx
0001400890ED  mov     qword ptr [rbp + 0x218], r14
0001400890F4  jns     0x140089137
0001400890F6  xor     ebx, ebx
0001400890F8  mov     rcx, rbx
0001400890FB  mov     rdx, rdi
0001400890FE  call    0x1402d4831
000140089103  jmp     0x14008add8
000140089108  mov     rax, qword ptr [rbp + 0x240]
00014008910F  test    rax, rax
000140089112  je      0x140089126
000140089114  imul    rdx, rax, 0x58
000140089118  mov     r8d, 8
00014008911E  mov     rcx, rsi
000140089121  call    0x1400549f0
000140089126  lea     rcx, [rbp + 0x270]
00014008912D  call    0x1401c5fb0
000140089132  jmp     0x14008a9c7
000140089137  mov     rsi, qword ptr [rbp + 0x2c0]
00014008913E  call    0x140007ed0
000140089143  mov     ebx, 1
000140089148  mov     edx, 1
00014008914D  mov     rcx, rdi
000140089150  call    0x1400549e0
000140089155  test    rax, rax
000140089158  je      0x1400890f8
00014008915A  mov     qword ptr [rbp + 0x2b0], rdi
000140089161  mov     qword ptr [rbp + 0x2b8], rax
000140089168  mov     qword ptr [rbp + 0x2c0], 0
000140089173  cmp     rdi, 3
000140089177  jbe     0x14008aab2
00014008917D  xor     ecx, ecx
00014008917F  mov     dword ptr [rax + rcx], 0x58444341
000140089186  mov     rdi, rcx
000140089189  lea     rax, [rcx + 4]
00014008918D  mov     qword ptr [rbp + 0x2c0], rax
000140089194  cmp     rax, qword ptr [rbp + 0x2b0]
00014008919B  jne     0x1400891a9
00014008919D  lea     rcx, [rbp + 0x2b0]
0001400891A4  call    0x1402d4880
0001400891A9  mov     rax, qword ptr [rbp + 0x2b8]
0001400891B0  mov     byte ptr [rax + rdi + 4], 0xd
0001400891B5  add     rdi, 5
0001400891B9  mov     qword ptr [rbp + 0x2c0], rdi
0001400891C0  mov     rax, qword ptr [rbp + 0x2b0]
0001400891C7  sub     rax, rdi
0001400891CA  cmp     rax, 3
0001400891CE  jbe     0x14008aae8
0001400891D4  mov     rdx, qword ptr [rbp + 0x288]
0001400891DB  mov     rax, qword ptr [rbp + 0x2b8]
0001400891E2  mov     dword ptr [rax + rdi], esi
0001400891E5  add     rdi, 4
0001400891E9  mov     qword ptr [rbp + 0x2c0], rdi
0001400891F0  mov     rax, qword ptr [rbp + 0x2b0]
0001400891F7  sub     rax, rdi
0001400891FA  cmp     rsi, rax
0001400891FD  ja      0x14008ab18
000140089203  mov     rcx, qword ptr [rbp + 0x2b8]
00014008920A  add     rcx, rdi
00014008920D  mov     r8, rsi
000140089210  call    0x1402cb3f0
000140089215  add     rdi, rsi
000140089218  mov     qword ptr [rbp + 0x2c0], rdi
00014008921F  mov     rax, qword ptr [rbp + 0x2b0]
000140089226  sub     rax, rdi
000140089229  cmp     rax, 1
00014008922D  jbe     0x14008ab4c
000140089233  mov     rax, qword ptr [rbp + 0x2b8]
00014008923A  mov     word ptr [rax + rdi], 0x8d
000140089240  add     rdi, 2
000140089244  mov     qword ptr [rbp + 0x2c0], rdi
00014008924B  mov     ebx, 0x102
000140089250  mov     eax, 0x103
000140089255  lea     rsi, [rbp + 0x2b0]
00014008925C  jmp     0x140089285
00014008925E  nop     
000140089260  mov     rax, qword ptr [rbp + 0x2b8]
000140089267  mov     byte ptr [rax + r14], dil
00014008926B  mov     rdi, r14
00014008926E  inc     rdi
000140089271  mov     qword ptr [rbp + 0x2c0], rdi
000140089278  lea     rax, [rbx + 1]
00014008927C  cmp     rbx, 0x18f
000140089283  je      0x1400892a6
000140089285  mov     rcx, rdi
000140089288  movzx   edi, byte ptr [rbp + rbx + 0x70]
00014008928D  mov     rbx, rax
000140089290  mov     r14, rcx
000140089293  cmp     rcx, qword ptr [rbp + 0x2b0]
00014008929A  jne     0x140089260
00014008929C  mov     rcx, rsi
00014008929F  call    0x1402d4880
0001400892A4  jmp     0x140089260
0001400892A6  mov     rsi, qword ptr [rbp + 0xf8]
0001400892AD  mov     rax, qword ptr [rbp + 0x2b0]
0001400892B4  sub     rax, rdi
0001400892B7  cmp     rax, 3
0001400892BB  jbe     0x14008ab7c
0001400892C1  mov     rax, qword ptr [rbp + 0x2b8]
0001400892C8  mov     dword ptr [rax + rdi], esi
0001400892CB  add     rdi, 4
0001400892CF  mov     qword ptr [rbp + 0x2c0], rdi
0001400892D6  mov     rax, qword ptr [rbp + 0xe8]
0001400892DD  mov     r15, qword ptr [rbp + 0xf0]
0001400892E4  test    rax, rax
0001400892E7  setne   cl
0001400892EA  cmove   rsi, rax
0001400892EE  xor     r14d, r14d
0001400892F1  lea     rbx, [rbp + 0x2b0]
0001400892F8  sub     rsi, 1
0001400892FC  jb      0x14008953a
000140089302  nop     word ptr cs:[rax + rax]
000140089310  test    cl, 1
000140089313  je      0x14008ad86
000140089319  test    r14, r14
00014008931C  je      0x140089340
00014008931E  movzx   ecx, word ptr [r14 + 0x36]
000140089323  cmp     r15, rcx
000140089326  jae     0x1400893d0
00014008932C  mov     rcx, r14
00014008932F  mov     rdx, r15
000140089332  jmp     0x1400893ed
000140089337  nop     word ptr [rax + rax]
000140089340  test    r15, r15
000140089343  je      0x14008937a
000140089345  mov     rcx, r15
000140089348  mov     r14, rax
00014008934B  and     rcx, 7
00014008934F  je      0x14008937f
000140089351  xor     edx, edx
000140089353  nop     word ptr cs:[rax + rax]
000140089360  mov     r14, qword ptr [r14 + 0x38]
000140089364  inc     rdx
000140089367  cmp     rcx, rdx
00014008936A  jne     0x140089360
00014008936C  mov     rax, r15
00014008936F  sub     rax, rdx
000140089372  cmp     r15, 8
000140089376  jae     0x140089390
000140089378  jmp     0x1400893b6
00014008937A  mov     r14, rax
00014008937D  jmp     0x1400893b6
00014008937F  mov     rax, r15
000140089382  cmp     r15, 8
000140089386  jb      0x1400893b6
000140089388  nop     dword ptr [rax + rax]
000140089390  mov     rcx, qword ptr [r14 + 0x38]
000140089394  mov     rcx, qword ptr [rcx + 0x38]
000140089398  mov     rcx, qword ptr [rcx + 0x38]
00014008939C  mov     rcx, qword ptr [rcx + 0x38]
0001400893A0  mov     rcx, qword ptr [rcx + 0x38]
0001400893A4  mov     rcx, qword ptr [rcx + 0x38]
0001400893A8  mov     rcx, qword ptr [rcx + 0x38]
0001400893AC  mov     r14, qword ptr [rcx + 0x38]
0001400893B0  add     rax, -8
0001400893B4  jne     0x140089390
0001400893B6  xor     r15d, r15d
0001400893B9  xor     eax, eax
0001400893BB  movzx   ecx, word ptr [r14 + 0x36]
0001400893C0  cmp     r15, rcx
0001400893C3  jb      0x14008932c
0001400893C9  nop     dword ptr [rax]
0001400893D0  mov     rcx, qword ptr [r14]
0001400893D3  test    rcx, rcx
0001400893D6  je      0x14008acf9
0001400893DC  inc     rax
0001400893DF  movzx   edx, word ptr [r14 + 0x34]
0001400893E4  mov     r14, rcx
0001400893E7  cmp     dx, word ptr [rcx + 0x36]
0001400893EB  jae     0x1400893d0
0001400893ED  lea     r15, [rdx + 1]
0001400893F1  test    rax, rax
0001400893F4  je      0x140089460
0001400893F6  lea     r8, [rcx + r15*8]
0001400893FA  add     r8, 0x38
0001400893FE  mov     r9, rax
000140089401  and     r9, 7
000140089405  je      0x1400894d0
00014008940B  xor     r10d, r10d
00014008940E  nop     
000140089410  mov     r14, qword ptr [r8]
000140089413  lea     r8, [r14 + 0x38]
000140089417  inc     r10
00014008941A  cmp     r9, r10
00014008941D  jne     0x140089410
00014008941F  mov     r9, rax
000140089422  sub     r9, r10
000140089425  cmp     rax, 8
000140089429  jb      0x140089459
00014008942B  nop     dword ptr [rax + rax]
000140089430  mov     rax, qword ptr [r8]
000140089433  mov     rax, qword ptr [rax + 0x38]
000140089437  mov     rax, qword ptr [rax + 0x38]
00014008943B  mov     rax, qword ptr [rax + 0x38]
00014008943F  mov     rax, qword ptr [rax + 0x38]
000140089443  mov     rax, qword ptr [rax + 0x38]
000140089447  mov     rax, qword ptr [rax + 0x38]
00014008944B  mov     r14, qword ptr [rax + 0x38]
00014008944F  lea     r8, [r14 + 0x38]
000140089453  add     r9, -8
000140089457  jne     0x140089430
000140089459  xor     r15d, r15d
00014008945C  jmp     0x140089463
00014008945E  nop     
000140089460  mov     r14, rcx
000140089463  movzx   r13d, word ptr [rcx + rdx*4 + 8]
000140089469  movzx   r12d, word ptr [rcx + rdx*4 + 0xa]
00014008946F  mov     rax, qword ptr [rbp + 0x2b0]
000140089476  sub     rax, rdi
000140089479  cmp     rax, 1
00014008947D  jbe     0x1400894e2
00014008947F  mov     rax, qword ptr [rbp + 0x2b8]
000140089486  mov     word ptr [rax + rdi], r13w
00014008948B  add     rdi, 2
00014008948F  mov     qword ptr [rbp + 0x2c0], rdi
000140089496  mov     rax, qword ptr [rbp + 0x2b0]
00014008949D  sub     rax, rdi
0001400894A0  cmp     rax, 1
0001400894A4  jbe     0x14008950e
0001400894A6  mov     rax, qword ptr [rbp + 0x2b8]
0001400894AD  mov     word ptr [rax + rdi], r12w
0001400894B2  add     rdi, 2
0001400894B6  mov     qword ptr [rbp + 0x2c0], rdi
0001400894BD  mov     cl, 1
0001400894BF  xor     eax, eax
0001400894C1  sub     rsi, 1
0001400894C5  jae     0x140089310
0001400894CB  jmp     0x14008953a
0001400894CD  nop     dword ptr [rax]
0001400894D0  mov     r9, rax
0001400894D3  cmp     rax, 8
0001400894D7  jae     0x140089430
0001400894DD  jmp     0x140089459
0001400894E2  mov     qword ptr [rsp + 0x20], 1
0001400894EB  mov     r8d, 2
0001400894F1  mov     r9d, 1
0001400894F7  mov     rcx, rbx
0001400894FA  mov     rdx, rdi
0001400894FD  call    0x1402cc040
000140089502  mov     rdi, qword ptr [rbp + 0x2c0]
000140089509  jmp     0x14008947f
00014008950E  mov     qword ptr [rsp + 0x20], 1
000140089517  mov     r8d, 2
00014008951D  mov     r9d, 1
000140089523  mov     rcx, rbx
000140089526  mov     rdx, rdi
000140089529  call    0x1402cc040
00014008952E  mov     rdi, qword ptr [rbp + 0x2c0]
000140089535  jmp     0x1400894a6
00014008953A  mov     rsi, qword ptr [rbp + 0xe0]
000140089541  mov     rax, qword ptr [rbp + 0x2b0]
000140089548  sub     rax, rdi
00014008954B  cmp     rax, 3
00014008954F  jbe     0x14008abac
000140089555  mov     rax, qword ptr [rbp + 0x2b8]
00014008955C  mov     dword ptr [rax + rdi], esi
00014008955F  add     rdi, 4
000140089563  mov     qword ptr [rbp + 0x2c0], rdi
00014008956A  mov     rax, qword ptr [rbp + 0xd0]
000140089571  mov     r15, qword ptr [rbp + 0xd8]
000140089578  test    rax, rax
00014008957B  setne   cl
00014008957E  cmove   rsi, rax
000140089582  xor     r14d, r14d
000140089585  lea     rbx, [rbp + 0x2b0]
00014008958C  sub     rsi, 1
000140089590  jb      0x140089764
000140089596  nop     word ptr cs:[rax + rax]
0001400895A0  test    cl, 1
0001400895A3  je      0x14008ad94
0001400895A9  test    r14, r14
0001400895AC  je      0x1400895d0
0001400895AE  movzx   ecx, word ptr [r14 + 0xa]
0001400895B3  cmp     r15, rcx
0001400895B6  jae     0x140089660
0001400895BC  mov     rcx, r14
0001400895BF  mov     rdx, r15
0001400895C2  jmp     0x14008967d
0001400895C7  nop     word ptr [rax + rax]
0001400895D0  test    r15, r15
0001400895D3  je      0x14008960a
0001400895D5  mov     rcx, r15
0001400895D8  mov     r14, rax
0001400895DB  and     rcx, 7
0001400895DF  je      0x14008960f
0001400895E1  xor     edx, edx
0001400895E3  nop     word ptr cs:[rax + rax]
0001400895F0  mov     r14, qword ptr [r14 + 0x28]
0001400895F4  inc     rdx
0001400895F7  cmp     rcx, rdx
0001400895FA  jne     0x1400895f0
0001400895FC  mov     rax, r15
0001400895FF  sub     rax, rdx
000140089602  cmp     r15, 8
000140089606  jae     0x140089620
000140089608  jmp     0x140089646
00014008960A  mov     r14, rax
00014008960D  jmp     0x140089646
00014008960F  mov     rax, r15
000140089612  cmp     r15, 8
000140089616  jb      0x140089646
000140089618  nop     dword ptr [rax + rax]
000140089620  mov     rcx, qword ptr [r14 + 0x28]
000140089624  mov     rcx, qword ptr [rcx + 0x28]
000140089628  mov     rcx, qword ptr [rcx + 0x28]
00014008962C  mov     rcx, qword ptr [rcx + 0x28]
000140089630  mov     rcx, qword ptr [rcx + 0x28]
000140089634  mov     rcx, qword ptr [rcx + 0x28]
000140089638  mov     rcx, qword ptr [rcx + 0x28]
00014008963C  mov     r14, qword ptr [rcx + 0x28]
000140089640  add     rax, -8
000140089644  jne     0x140089620
000140089646  xor     r15d, r15d
000140089649  xor     eax, eax
00014008964B  movzx   ecx, word ptr [r14 + 0xa]
000140089650  cmp     r15, rcx
000140089653  jb      0x1400895bc
000140089659  nop     dword ptr [rax]
000140089660  mov     rcx, qword ptr [r14]
000140089663  test    rcx, rcx
000140089666  je      0x14008ad0a
00014008966C  inc     rax
00014008966F  movzx   edx, word ptr [r14 + 8]
000140089674  mov     r14, rcx
000140089677  cmp     dx, word ptr [rcx + 0xa]
00014008967B  jae     0x140089660
00014008967D  lea     r15, [rdx + 1]
000140089681  test    rax, rax
000140089684  je      0x1400896f0
000140089686  lea     r8, [rcx + r15*8]
00014008968A  add     r8, 0x28
00014008968E  mov     r9, rax
000140089691  and     r9, 7
000140089695  je      0x140089730
00014008969B  xor     r10d, r10d
00014008969E  nop     
0001400896A0  mov     r14, qword ptr [r8]
0001400896A3  lea     r8, [r14 + 0x28]
0001400896A7  inc     r10
0001400896AA  cmp     r9, r10
0001400896AD  jne     0x1400896a0
0001400896AF  mov     r9, rax
0001400896B2  sub     r9, r10
0001400896B5  cmp     rax, 8
0001400896B9  jb      0x1400896e9
0001400896BB  nop     dword ptr [rax + rax]
0001400896C0  mov     rax, qword ptr [r8]
0001400896C3  mov     rax, qword ptr [rax + 0x28]
0001400896C7  mov     rax, qword ptr [rax + 0x28]
0001400896CB  mov     rax, qword ptr [rax + 0x28]
0001400896CF  mov     rax, qword ptr [rax + 0x28]
0001400896D3  mov     rax, qword ptr [rax + 0x28]
0001400896D7  mov     rax, qword ptr [rax + 0x28]
0001400896DB  mov     r14, qword ptr [rax + 0x28]
0001400896DF  lea     r8, [r14 + 0x28]
0001400896E3  add     r9, -8
0001400896E7  jne     0x1400896c0
0001400896E9  xor     r15d, r15d
0001400896EC  jmp     0x1400896f3
0001400896EE  nop     
0001400896F0  mov     r14, rcx
0001400896F3  movzx   r12d, word ptr [rcx + rdx*2 + 0xc]
0001400896F9  mov     rax, qword ptr [rbp + 0x2b0]
000140089700  sub     rax, rdi
000140089703  cmp     rax, 1
000140089707  jbe     0x14008973b
000140089709  mov     rax, qword ptr [rbp + 0x2b8]
000140089710  mov     word ptr [rax + rdi], r12w
000140089715  add     rdi, 2
000140089719  mov     qword ptr [rbp + 0x2c0], rdi
000140089720  mov     cl, 1
000140089722  xor     eax, eax
000140089724  sub     rsi, 1
000140089728  jae     0x1400895a0
00014008972E  jmp     0x140089764
000140089730  mov     r9, rax
000140089733  cmp     rax, 8
000140089737  jae     0x1400896c0
000140089739  jmp     0x1400896e9
00014008973B  mov     qword ptr [rsp + 0x20], 1
000140089744  mov     r8d, 2
00014008974A  mov     r9d, 1
000140089750  mov     rcx, rbx
000140089753  mov     rdx, rdi
000140089756  call    0x1402cc040
00014008975B  mov     rdi, qword ptr [rbp + 0x2c0]
000140089762  jmp     0x140089709
000140089764  mov     rsi, qword ptr [rbp + 0x128]
00014008976B  mov     rax, qword ptr [rbp + 0x2b0]
000140089772  sub     rax, rdi
000140089775  cmp     rax, 3
000140089779  jbe     0x14008abdc
00014008977F  mov     rax, qword ptr [rbp + 0x2b8]
000140089786  mov     dword ptr [rax + rdi], esi
000140089789  add     rdi, 4
00014008978D  mov     qword ptr [rbp + 0x2c0], rdi
000140089794  mov     rax, qword ptr [rbp + 0x118]
00014008979B  mov     r15, qword ptr [rbp + 0x120]
0001400897A2  test    rax, rax
0001400897A5  setne   cl
0001400897A8  cmove   rsi, rax
0001400897AC  xor     r14d, r14d
0001400897AF  lea     rbx, [rbp + 0x2b0]
0001400897B6  sub     rsi, 1
0001400897BA  jb      0x140089984
0001400897C0  test    cl, 1
0001400897C3  je      0x14008ada2
0001400897C9  test    r14, r14
0001400897CC  je      0x1400897f0
0001400897CE  movzx   ecx, word ptr [r14 + 0xa]
0001400897D3  cmp     r15, rcx
0001400897D6  jae     0x140089880
0001400897DC  mov     rcx, r14
0001400897DF  mov     rdx, r15
0001400897E2  jmp     0x14008989d
0001400897E7  nop     word ptr [rax + rax]
0001400897F0  test    r15, r15
0001400897F3  je      0x14008982a
0001400897F5  mov     rcx, r15
0001400897F8  mov     r14, rax
0001400897FB  and     rcx, 7
0001400897FF  je      0x14008982f
000140089801  xor     edx, edx
000140089803  nop     word ptr cs:[rax + rax]
000140089810  mov     r14, qword ptr [r14 + 0x28]
000140089814  inc     rdx
000140089817  cmp     rcx, rdx
00014008981A  jne     0x140089810
00014008981C  mov     rax, r15
00014008981F  sub     rax, rdx
000140089822  cmp     r15, 8
000140089826  jae     0x140089840
000140089828  jmp     0x140089866
00014008982A  mov     r14, rax
00014008982D  jmp     0x140089866
00014008982F  mov     rax, r15
000140089832  cmp     r15, 8
000140089836  jb      0x140089866
000140089838  nop     dword ptr [rax + rax]
000140089840  mov     rcx, qword ptr [r14 + 0x28]
000140089844  mov     rcx, qword ptr [rcx + 0x28]
000140089848  mov     rcx, qword ptr [rcx + 0x28]
00014008984C  mov     rcx, qword ptr [rcx + 0x28]
000140089850  mov     rcx, qword ptr [rcx + 0x28]
000140089854  mov     rcx, qword ptr [rcx + 0x28]
000140089858  mov     rcx, qword ptr [rcx + 0x28]
00014008985C  mov     r14, qword ptr [rcx + 0x28]
000140089860  add     rax, -8
000140089864  jne     0x140089840
000140089866  xor     r15d, r15d
000140089869  xor     eax, eax
00014008986B  movzx   ecx, word ptr [r14 + 0xa]
000140089870  cmp     r15, rcx
000140089873  jb      0x1400897dc
000140089879  nop     dword ptr [rax]
000140089880  mov     rcx, qword ptr [r14]
000140089883  test    rcx, rcx
000140089886  je      0x14008ad1b
00014008988C  inc     rax
00014008988F  movzx   edx, word ptr [r14 + 8]
000140089894  mov     r14, rcx
000140089897  cmp     dx, word ptr [rcx + 0xa]
00014008989B  jae     0x140089880
00014008989D  lea     r15, [rdx + 1]
0001400898A1  test    rax, rax
0001400898A4  je      0x140089910
0001400898A6  lea     r8, [rcx + r15*8]
0001400898AA  add     r8, 0x28
0001400898AE  mov     r9, rax
0001400898B1  and     r9, 7
0001400898B5  je      0x140089950
0001400898BB  xor     r10d, r10d
0001400898BE  nop     
0001400898C0  mov     r14, qword ptr [r8]
0001400898C3  lea     r8, [r14 + 0x28]
0001400898C7  inc     r10
0001400898CA  cmp     r9, r10
0001400898CD  jne     0x1400898c0
0001400898CF  mov     r9, rax
0001400898D2  sub     r9, r10
0001400898D5  cmp     rax, 8
0001400898D9  jb      0x140089909
0001400898DB  nop     dword ptr [rax + rax]
0001400898E0  mov     rax, qword ptr [r8]
0001400898E3  mov     rax, qword ptr [rax + 0x28]
0001400898E7  mov     rax, qword ptr [rax + 0x28]
0001400898EB  mov     rax, qword ptr [rax + 0x28]
0001400898EF  mov     rax, qword ptr [rax + 0x28]
0001400898F3  mov     rax, qword ptr [rax + 0x28]
0001400898F7  mov     rax, qword ptr [rax + 0x28]
0001400898FB  mov     r14, qword ptr [rax + 0x28]
0001400898FF  lea     r8, [r14 + 0x28]
000140089903  add     r9, -8
000140089907  jne     0x1400898e0
000140089909  xor     r15d, r15d
00014008990C  jmp     0x140089913
00014008990E  nop     
000140089910  mov     r14, rcx
000140089913  movzx   r12d, word ptr [rcx + rdx*2 + 0xc]
000140089919  mov     rax, qword ptr [rbp + 0x2b0]
000140089920  sub     rax, rdi
000140089923  cmp     rax, 1
000140089927  jbe     0x14008995b
000140089929  mov     rax, qword ptr [rbp + 0x2b8]
000140089930  mov     word ptr [rax + rdi], r12w
000140089935  add     rdi, 2
000140089939  mov     qword ptr [rbp + 0x2c0], rdi
000140089940  mov     cl, 1
000140089942  xor     eax, eax
000140089944  sub     rsi, 1
000140089948  jae     0x1400897c0
00014008994E  jmp     0x140089984
000140089950  mov     r9, rax
000140089953  cmp     rax, 8
000140089957  jae     0x1400898e0
000140089959  jmp     0x140089909
00014008995B  mov     qword ptr [rsp + 0x20], 1
000140089964  mov     r8d, 2
00014008996A  mov     r9d, 1
000140089970  mov     rcx, rbx
000140089973  mov     rdx, rdi
000140089976  call    0x1402cc040
00014008997B  mov     rdi, qword ptr [rbp + 0x2c0]
000140089982  jmp     0x140089929
000140089984  movzx   esi, word ptr [rbp + 0x170]
00014008998B  mov     rax, qword ptr [rbp + 0x2b0]
000140089992  sub     rax, rdi
000140089995  cmp     rax, 1
000140089999  jbe     0x14008ac0c
00014008999F  mov     rax, qword ptr [rbp + 0x2b8]
0001400899A6  mov     word ptr [rax + rdi], si
0001400899AA  mov     rsi, rdi
0001400899AD  lea     rax, [rdi + 2]
0001400899B1  mov     qword ptr [rbp + 0x2c0], rax
0001400899B8  movzx   ebx, byte ptr [rbp + 0x1ff]
0001400899BF  cmp     rax, qword ptr [rbp + 0x2b0]
0001400899C6  jne     0x1400899d4
0001400899C8  lea     rcx, [rbp + 0x2b0]
0001400899CF  call    0x1402d4880
0001400899D4  mov     rax, qword ptr [rbp + 0x2b8]
0001400899DB  mov     byte ptr [rax + rsi + 2], bl
0001400899DF  lea     rax, [rsi + 3]
0001400899E3  mov     qword ptr [rbp + 0x2c0], rax
0001400899EA  movzx   ebx, byte ptr [rbp + 0x203]
0001400899F1  cmp     rax, qword ptr [rbp + 0x2b0]
0001400899F8  jne     0x140089a06
0001400899FA  lea     rcx, [rbp + 0x2b0]
000140089A01  call    0x1402d4880
000140089A06  mov     rax, qword ptr [rbp + 0x2b8]
000140089A0D  mov     rdi, rsi
000140089A10  mov     byte ptr [rax + rsi + 3], bl
000140089A14  add     rdi, 4
000140089A18  mov     qword ptr [rbp + 0x2c0], rdi
000140089A1F  mov     rsi, qword ptr [rbp + 0x150]
000140089A26  mov     rax, qword ptr [rbp + 0x2b0]
000140089A2D  sub     rax, rdi
000140089A30  cmp     rax, 3
000140089A34  jbe     0x14008ac3c
000140089A3A  mov     rax, qword ptr [rbp + 0x2b8]
000140089A41  mov     dword ptr [rax + rdi], esi
000140089A44  add     rdi, 4
000140089A48  mov     qword ptr [rbp + 0x2c0], rdi
000140089A4F  mov     rax, qword ptr [rbp + 0x140]
000140089A56  mov     r15, qword ptr [rbp + 0x148]
000140089A5D  test    rax, rax
000140089A60  setne   cl
000140089A63  cmove   rsi, rax
000140089A67  xor     r14d, r14d
000140089A6A  lea     rbx, [rbp + 0x2b0]
000140089A71  sub     rsi, 1
000140089A75  jb      0x140089c44
000140089A7B  nop     dword ptr [rax + rax]
000140089A80  test    cl, 1
000140089A83  je      0x14008adb0
000140089A89  test    r14, r14
000140089A8C  je      0x140089ab0
000140089A8E  movzx   ecx, word ptr [r14 + 0x62]
000140089A93  cmp     r15, rcx
000140089A96  jae     0x140089b40
000140089A9C  mov     rcx, r14
000140089A9F  mov     rdx, r15
000140089AA2  jmp     0x140089b5d
000140089AA7  nop     word ptr [rax + rax]
000140089AB0  test    r15, r15
000140089AB3  je      0x140089aea
000140089AB5  mov     rcx, r15
000140089AB8  mov     r14, rax
000140089ABB  and     rcx, 7
000140089ABF  je      0x140089aef
000140089AC1  xor     edx, edx
000140089AC3  nop     word ptr cs:[rax + rax]
000140089AD0  mov     r14, qword ptr [r14 + 0x68]
000140089AD4  inc     rdx
000140089AD7  cmp     rcx, rdx
000140089ADA  jne     0x140089ad0
000140089ADC  mov     rax, r15
000140089ADF  sub     rax, rdx
000140089AE2  cmp     r15, 8
000140089AE6  jae     0x140089b00
000140089AE8  jmp     0x140089b26
000140089AEA  mov     r14, rax
000140089AED  jmp     0x140089b26
000140089AEF  mov     rax, r15
000140089AF2  cmp     r15, 8
000140089AF6  jb      0x140089b26
000140089AF8  nop     dword ptr [rax + rax]
000140089B00  mov     rcx, qword ptr [r14 + 0x68]
000140089B04  mov     rcx, qword ptr [rcx + 0x68]
000140089B08  mov     rcx, qword ptr [rcx + 0x68]
000140089B0C  mov     rcx, qword ptr [rcx + 0x68]
000140089B10  mov     rcx, qword ptr [rcx + 0x68]
000140089B14  mov     rcx, qword ptr [rcx + 0x68]
000140089B18  mov     rcx, qword ptr [rcx + 0x68]
000140089B1C  mov     r14, qword ptr [rcx + 0x68]
000140089B20  add     rax, -8
000140089B24  jne     0x140089b00
000140089B26  xor     r15d, r15d
000140089B29  xor     eax, eax
000140089B2B  movzx   ecx, word ptr [r14 + 0x62]
000140089B30  cmp     r15, rcx
000140089B33  jb      0x140089a9c
000140089B39  nop     dword ptr [rax]
000140089B40  mov     rcx, qword ptr [r14]
000140089B43  test    rcx, rcx
000140089B46  je      0x14008ad2c
000140089B4C  inc     rax
000140089B4F  movzx   edx, word ptr [r14 + 0x60]
000140089B54  mov     r14, rcx
000140089B57  cmp     dx, word ptr [rcx + 0x62]
000140089B5B  jae     0x140089b40
000140089B5D  lea     r15, [rdx + 1]
000140089B61  test    rax, rax
000140089B64  je      0x140089bd0
000140089B66  lea     r8, [rcx + r15*8]
000140089B6A  add     r8, 0x68
000140089B6E  mov     r9, rax
000140089B71  and     r9, 7
000140089B75  je      0x140089c10
000140089B7B  xor     r10d, r10d
000140089B7E  nop     
000140089B80  mov     r14, qword ptr [r8]
000140089B83  lea     r8, [r14 + 0x68]
000140089B87  inc     r10
000140089B8A  cmp     r9, r10
000140089B8D  jne     0x140089b80
000140089B8F  mov     r9, rax
000140089B92  sub     r9, r10
000140089B95  cmp     rax, 8
000140089B99  jb      0x140089bc9
000140089B9B  nop     dword ptr [rax + rax]
000140089BA0  mov     rax, qword ptr [r8]
000140089BA3  mov     rax, qword ptr [rax + 0x68]
000140089BA7  mov     rax, qword ptr [rax + 0x68]
000140089BAB  mov     rax, qword ptr [rax + 0x68]
000140089BAF  mov     rax, qword ptr [rax + 0x68]
000140089BB3  mov     rax, qword ptr [rax + 0x68]
000140089BB7  mov     rax, qword ptr [rax + 0x68]
000140089BBB  mov     r14, qword ptr [rax + 0x68]
000140089BBF  lea     r8, [r14 + 0x68]
000140089BC3  add     r9, -8
000140089BC7  jne     0x140089ba0
000140089BC9  xor     r15d, r15d
000140089BCC  jmp     0x140089bd3
000140089BCE  nop     
000140089BD0  mov     r14, rcx
000140089BD3  mov     r12, qword ptr [rcx + rdx*8 + 8]
000140089BD8  mov     rax, qword ptr [rbp + 0x2b0]
000140089BDF  sub     rax, rdi
000140089BE2  cmp     rax, 7
000140089BE6  jbe     0x140089c1b
000140089BE8  mov     rax, qword ptr [rbp + 0x2b8]
000140089BEF  mov     qword ptr [rax + rdi], r12
000140089BF3  add     rdi, 8
000140089BF7  mov     qword ptr [rbp + 0x2c0], rdi
000140089BFE  mov     cl, 1
000140089C00  xor     eax, eax
000140089C02  sub     rsi, 1
000140089C06  jae     0x140089a80
000140089C0C  jmp     0x140089c44
000140089C0E  nop     
000140089C10  mov     r9, rax
000140089C13  cmp     rax, 8
000140089C17  jae     0x140089ba0
000140089C19  jmp     0x140089bc9
000140089C1B  mov     qword ptr [rsp + 0x20], 1
000140089C24  mov     r8d, 8
000140089C2A  mov     r9d, 1
000140089C30  mov     rcx, rbx
000140089C33  mov     rdx, rdi
000140089C36  call    0x1402cc040
000140089C3B  mov     rdi, qword ptr [rbp + 0x2c0]
000140089C42  jmp     0x140089be8
000140089C44  mov     rsi, qword ptr [rbp + 0x168]
000140089C4B  mov     rax, qword ptr [rbp + 0x2b0]
000140089C52  sub     rax, rdi
000140089C55  cmp     rax, 3
000140089C59  jbe     0x14008ac6c
000140089C5F  mov     rax, qword ptr [rbp + 0x2b8]
000140089C66  mov     dword ptr [rax + rdi], esi
000140089C69  add     rdi, 4
000140089C6D  mov     qword ptr [rbp + 0x2c0], rdi
000140089C74  mov     rax, qword ptr [rbp + 0x158]
000140089C7B  mov     r15, qword ptr [rbp + 0x160]
000140089C82  test    rax, rax
000140089C85  setne   cl
000140089C88  cmove   rsi, rax
000140089C8C  xor     r14d, r14d
000140089C8F  lea     rbx, [rbp + 0x2b0]
000140089C96  sub     rsi, 1
000140089C9A  jb      0x140089e64
000140089CA0  test    cl, 1
000140089CA3  je      0x14008adbe
000140089CA9  test    r14, r14
000140089CAC  je      0x140089cd0
000140089CAE  movzx   ecx, word ptr [r14 + 0x62]
000140089CB3  cmp     r15, rcx
000140089CB6  jae     0x140089d60
000140089CBC  mov     rcx, r14
000140089CBF  mov     rdx, r15
000140089CC2  jmp     0x140089d7d
000140089CC7  nop     word ptr [rax + rax]
000140089CD0  test    r15, r15
000140089CD3  je      0x140089d0a
000140089CD5  mov     rcx, r15
000140089CD8  mov     r14, rax
000140089CDB  and     rcx, 7
000140089CDF  je      0x140089d0f
000140089CE1  xor     edx, edx
000140089CE3  nop     word ptr cs:[rax + rax]
000140089CF0  mov     r14, qword ptr [r14 + 0x68]
000140089CF4  inc     rdx
000140089CF7  cmp     rcx, rdx
000140089CFA  jne     0x140089cf0
000140089CFC  mov     rax, r15
000140089CFF  sub     rax, rdx
000140089D02  cmp     r15, 8
000140089D06  jae     0x140089d20
000140089D08  jmp     0x140089d46
000140089D0A  mov     r14, rax
000140089D0D  jmp     0x140089d46
000140089D0F  mov     rax, r15
000140089D12  cmp     r15, 8
000140089D16  jb      0x140089d46
000140089D18  nop     dword ptr [rax + rax]
000140089D20  mov     rcx, qword ptr [r14 + 0x68]
000140089D24  mov     rcx, qword ptr [rcx + 0x68]
000140089D28  mov     rcx, qword ptr [rcx + 0x68]
000140089D2C  mov     rcx, qword ptr [rcx + 0x68]
000140089D30  mov     rcx, qword ptr [rcx + 0x68]
000140089D34  mov     rcx, qword ptr [rcx + 0x68]
000140089D38  mov     rcx, qword ptr [rcx + 0x68]
000140089D3C  mov     r14, qword ptr [rcx + 0x68]
000140089D40  add     rax, -8
000140089D44  jne     0x140089d20
000140089D46  xor     r15d, r15d
000140089D49  xor     eax, eax
000140089D4B  movzx   ecx, word ptr [r14 + 0x62]
000140089D50  cmp     r15, rcx
000140089D53  jb      0x140089cbc
000140089D59  nop     dword ptr [rax]
000140089D60  mov     rcx, qword ptr [r14]
000140089D63  test    rcx, rcx
000140089D66  je      0x14008ad3d
000140089D6C  inc     rax
000140089D6F  movzx   edx, word ptr [r14 + 0x60]
000140089D74  mov     r14, rcx
000140089D77  cmp     dx, word ptr [rcx + 0x62]
000140089D7B  jae     0x140089d60
000140089D7D  lea     r15, [rdx + 1]
000140089D81  test    rax, rax
000140089D84  je      0x140089df0
000140089D86  lea     r8, [rcx + r15*8]
000140089D8A  add     r8, 0x68
000140089D8E  mov     r9, rax
000140089D91  and     r9, 7
000140089D95  je      0x140089e30
000140089D9B  xor     r10d, r10d
000140089D9E  nop     
000140089DA0  mov     r14, qword ptr [r8]
000140089DA3  lea     r8, [r14 + 0x68]
000140089DA7  inc     r10
000140089DAA  cmp     r9, r10
000140089DAD  jne     0x140089da0
000140089DAF  mov     r9, rax
000140089DB2  sub     r9, r10
000140089DB5  cmp     rax, 8
000140089DB9  jb      0x140089de9
000140089DBB  nop     dword ptr [rax + rax]
000140089DC0  mov     rax, qword ptr [r8]
000140089DC3  mov     rax, qword ptr [rax + 0x68]
000140089DC7  mov     rax, qword ptr [rax + 0x68]
000140089DCB  mov     rax, qword ptr [rax + 0x68]
000140089DCF  mov     rax, qword ptr [rax + 0x68]
000140089DD3  mov     rax, qword ptr [rax + 0x68]
000140089DD7  mov     rax, qword ptr [rax + 0x68]
000140089DDB  mov     r14, qword ptr [rax + 0x68]
000140089DDF  lea     r8, [r14 + 0x68]
000140089DE3  add     r9, -8
000140089DE7  jne     0x140089dc0
000140089DE9  xor     r15d, r15d
000140089DEC  jmp     0x140089df3
000140089DEE  nop     
000140089DF0  mov     r14, rcx
000140089DF3  mov     r12, qword ptr [rcx + rdx*8 + 8]
000140089DF8  mov     rax, qword ptr [rbp + 0x2b0]
000140089DFF  sub     rax, rdi
000140089E02  cmp     rax, 7
000140089E06  jbe     0x140089e3b
000140089E08  mov     rax, qword ptr [rbp + 0x2b8]
000140089E0F  mov     qword ptr [rax + rdi], r12
000140089E13  add     rdi, 8
000140089E17  mov     qword ptr [rbp + 0x2c0], rdi
000140089E1E  mov     cl, 1
000140089E20  xor     eax, eax
000140089E22  sub     rsi, 1
000140089E26  jae     0x140089ca0
000140089E2C  jmp     0x140089e64
000140089E2E  nop     
000140089E30  mov     r9, rax
000140089E33  cmp     rax, 8
000140089E37  jae     0x140089dc0
000140089E39  jmp     0x140089de9
000140089E3B  mov     qword ptr [rsp + 0x20], 1
000140089E44  mov     r8d, 8
000140089E4A  mov     r9d, 1
000140089E50  mov     rcx, rbx
000140089E53  mov     rdx, rdi
000140089E56  call    0x1402cc040
000140089E5B  mov     rdi, qword ptr [rbp + 0x2c0]
000140089E62  jmp     0x140089e08
000140089E64  mov     rsi, qword ptr [rbp + 0xc8]
000140089E6B  mov     rax, qword ptr [rbp + 0x2b0]
000140089E72  sub     rax, rdi
000140089E75  cmp     rax, 3
000140089E79  jbe     0x14008ac9c
000140089E7F  mov     rax, qword ptr [rbp + 0x2b8]
000140089E86  mov     dword ptr [rax + rdi], esi
000140089E89  add     rdi, 4
000140089E8D  mov     qword ptr [rbp + 0x2c0], rdi
000140089E94  test    rsi, rsi
000140089E97  je      0x14008a07b
000140089E9D  mov     r13, qword ptr [rbp + 0xc0]
000140089EA4  lea     r15, [rsi + rsi*2]
000140089EA8  shl     r15, 4
000140089EAC  add     r15, r13
000140089EAF  lea     rax, [r13 + 0x30]
000140089EB3  lea     rsi, [rbp + 0x2b0]
000140089EBA  nop     word ptr [rax + rax]
000140089EC0  mov     r12, rax
000140089EC3  movzx   ebx, byte ptr [r13 + 0x20]
000140089EC8  mov     r14, rdi
000140089ECB  cmp     rdi, qword ptr [rbp + 0x2b0]
000140089ED2  jne     0x140089edc
000140089ED4  mov     rcx, rsi
000140089ED7  call    0x1402d4880
000140089EDC  mov     rax, qword ptr [rbp + 0x2b8]
000140089EE3  mov     rdi, r14
000140089EE6  mov     byte ptr [rax + r14], bl
000140089EEA  inc     rdi
000140089EED  mov     qword ptr [rbp + 0x2c0], rdi
000140089EF4  mov     r14, qword ptr [r13 + 8]
000140089EF8  mov     rbx, qword ptr [r13 + 0x10]
000140089EFC  mov     rax, qword ptr [rbp + 0x2b0]
000140089F03  sub     rax, rdi
000140089F06  cmp     rax, 1
000140089F0A  jbe     0x140089fce
000140089F10  mov     rax, qword ptr [rbp + 0x2b8]
000140089F17  mov     word ptr [rax + rdi], bx
000140089F1B  add     rdi, 2
000140089F1F  mov     qword ptr [rbp + 0x2c0], rdi
000140089F26  mov     rax, qword ptr [rbp + 0x2b0]
000140089F2D  sub     rax, rdi
000140089F30  cmp     rbx, rax
000140089F33  ja      0x140089ffa
000140089F39  mov     rcx, qword ptr [rbp + 0x2b8]
000140089F40  add     rcx, rdi
000140089F43  mov     rdx, r14
000140089F46  mov     r8, rbx
000140089F49  call    0x1402cb3f0
000140089F4E  add     rdi, rbx
000140089F51  mov     qword ptr [rbp + 0x2c0], rdi
000140089F58  mov     rbx, qword ptr [r13 + 0x18]
000140089F5C  mov     rax, qword ptr [rbp + 0x2b0]
000140089F63  sub     rax, rdi
000140089F66  cmp     rax, 7
000140089F6A  jbe     0x14008a023
000140089F70  mov     rax, qword ptr [rbp + 0x2b8]
000140089F77  mov     qword ptr [rax + rdi], rbx
000140089F7B  add     rdi, 8
000140089F7F  mov     qword ptr [rbp + 0x2c0], rdi
000140089F86  mov     rbx, qword ptr [r13 + 0x28]
000140089F8A  mov     rax, qword ptr [rbp + 0x2b0]
000140089F91  sub     rax, rdi
000140089F94  cmp     rax, 7
000140089F98  jbe     0x14008a04f
000140089F9E  mov     rax, qword ptr [rbp + 0x2b8]
000140089FA5  mov     qword ptr [rax + rdi], rbx
000140089FA9  add     rdi, 8
000140089FAD  mov     qword ptr [rbp + 0x2c0], rdi
000140089FB4  lea     rax, [r12 + 0x30]
000140089FB9  mov     r13, r12
000140089FBC  cmp     r12, r15
000140089FBF  cmove   rax, r12
000140089FC3  jne     0x140089ec0
000140089FC9  jmp     0x14008a07b
000140089FCE  mov     qword ptr [rsp + 0x20], 1
000140089FD7  mov     r8d, 2
000140089FDD  mov     r9d, 1
000140089FE3  mov     rcx, rsi
000140089FE6  mov     rdx, rdi
000140089FE9  call    0x1402cc040
000140089FEE  mov     rdi, qword ptr [rbp + 0x2c0]
000140089FF5  jmp     0x140089f10
000140089FFA  mov     qword ptr [rsp + 0x20], 1
00014008A003  mov     r9d, 1
00014008A009  mov     rcx, rsi
00014008A00C  mov     rdx, rdi
00014008A00F  mov     r8, rbx
00014008A012  call    0x1402cc040
00014008A017  mov     rdi, qword ptr [rbp + 0x2c0]
00014008A01E  jmp     0x140089f39
00014008A023  mov     qword ptr [rsp + 0x20], 1
00014008A02C  mov     r8d, 8
00014008A032  mov     r9d, 1
00014008A038  mov     rcx, rsi
00014008A03B  mov     rdx, rdi
00014008A03E  call    0x1402cc040
00014008A043  mov     rdi, qword ptr [rbp + 0x2c0]
00014008A04A  jmp     0x140089f70
00014008A04F  mov     qword ptr [rsp + 0x20], 1
00014008A058  mov     r8d, 8
00014008A05E  mov     r9d, 1
00014008A064  mov     rcx, rsi
00014008A067  mov     rdx, rdi
00014008A06A  call    0x1402cc040
00014008A06F  mov     rdi, qword ptr [rbp + 0x2c0]
00014008A076  jmp     0x140089f9e
00014008A07B  movzx   ebx, byte ptr [rbp + 0x204]
00014008A082  mov     rsi, rdi
00014008A085  cmp     rdi, qword ptr [rbp + 0x2b0]
00014008A08C  jne     0x14008a09a
00014008A08E  lea     rcx, [rbp + 0x2b0]
00014008A095  call    0x1402d4880
00014008A09A  mov     rax, qword ptr [rbp + 0x2b8]
00014008A0A1  mov     byte ptr [rax + rsi], bl
00014008A0A4  lea     rax, [rsi + 1]
00014008A0A8  mov     qword ptr [rbp + 0x2c0], rax
00014008A0AF  movzx   ebx, byte ptr [rbp + 0x130]
00014008A0B6  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A0BD  jne     0x14008a0cb
00014008A0BF  lea     rcx, [rbp + 0x2b0]
00014008A0C6  call    0x1402d4880
00014008A0CB  mov     rax, qword ptr [rbp + 0x2b8]
00014008A0D2  mov     byte ptr [rax + rsi + 1], bl
00014008A0D6  lea     rax, [rsi + 2]
00014008A0DA  mov     qword ptr [rbp + 0x2c0], rax
00014008A0E1  movzx   ebx, byte ptr [rbp + 0x131]
00014008A0E8  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A0EF  jne     0x14008a0fd
00014008A0F1  lea     rcx, [rbp + 0x2b0]
00014008A0F8  call    0x1402d4880
00014008A0FD  mov     rax, qword ptr [rbp + 0x2b8]
00014008A104  mov     byte ptr [rax + rsi + 2], bl
00014008A108  lea     rax, [rsi + 3]
00014008A10C  mov     qword ptr [rbp + 0x2c0], rax
00014008A113  movzx   ebx, byte ptr [rbp + 0x132]
00014008A11A  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A121  jne     0x14008a12f
00014008A123  lea     rcx, [rbp + 0x2b0]
00014008A12A  call    0x1402d4880
00014008A12F  mov     rax, qword ptr [rbp + 0x2b8]
00014008A136  mov     byte ptr [rax + rsi + 3], bl
00014008A13A  lea     rax, [rsi + 4]
00014008A13E  mov     qword ptr [rbp + 0x2c0], rax
00014008A145  movzx   ebx, byte ptr [rbp + 0x133]
00014008A14C  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A153  jne     0x14008a161
00014008A155  lea     rcx, [rbp + 0x2b0]
00014008A15C  call    0x1402d4880
00014008A161  mov     rax, qword ptr [rbp + 0x2b8]
00014008A168  mov     byte ptr [rax + rsi + 4], bl
00014008A16C  lea     rax, [rsi + 5]
00014008A170  mov     qword ptr [rbp + 0x2c0], rax
00014008A177  movzx   ebx, byte ptr [rbp + 0x134]
00014008A17E  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A185  jne     0x14008a193
00014008A187  lea     rcx, [rbp + 0x2b0]
00014008A18E  call    0x1402d4880
00014008A193  mov     rax, qword ptr [rbp + 0x2b8]
00014008A19A  mov     byte ptr [rax + rsi + 5], bl
00014008A19E  lea     rax, [rsi + 6]
00014008A1A2  mov     qword ptr [rbp + 0x2c0], rax
00014008A1A9  movzx   ebx, byte ptr [rbp + 0x135]
00014008A1B0  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A1B7  jne     0x14008a1c5
00014008A1B9  lea     rcx, [rbp + 0x2b0]
00014008A1C0  call    0x1402d4880
00014008A1C5  mov     rax, qword ptr [rbp + 0x2b8]
00014008A1CC  mov     byte ptr [rax + rsi + 6], bl
00014008A1D0  lea     rax, [rsi + 7]
00014008A1D4  mov     qword ptr [rbp + 0x2c0], rax
00014008A1DB  movzx   ebx, byte ptr [rbp + 0x136]
00014008A1E2  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A1E9  jne     0x14008a1f7
00014008A1EB  lea     rcx, [rbp + 0x2b0]
00014008A1F2  call    0x1402d4880
00014008A1F7  mov     rax, qword ptr [rbp + 0x2b8]
00014008A1FE  mov     byte ptr [rax + rsi + 7], bl
00014008A202  lea     rax, [rsi + 8]
00014008A206  mov     qword ptr [rbp + 0x2c0], rax
00014008A20D  movzx   ebx, byte ptr [rbp + 0x137]
00014008A214  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A21B  jne     0x14008a229
00014008A21D  lea     rcx, [rbp + 0x2b0]
00014008A224  call    0x1402d4880
00014008A229  mov     rax, qword ptr [rbp + 0x2b8]
00014008A230  mov     byte ptr [rax + rsi + 8], bl
00014008A234  lea     rax, [rsi + 9]
00014008A238  mov     qword ptr [rbp + 0x2c0], rax
00014008A23F  movzx   ebx, byte ptr [rbp + 0x138]
00014008A246  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A24D  jne     0x14008a25b
00014008A24F  lea     rcx, [rbp + 0x2b0]
00014008A256  call    0x1402d4880
00014008A25B  mov     rax, qword ptr [rbp + 0x2b8]
00014008A262  mov     byte ptr [rax + rsi + 9], bl
00014008A266  lea     rax, [rsi + 0xa]
00014008A26A  mov     qword ptr [rbp + 0x2c0], rax
00014008A271  movzx   ebx, byte ptr [rbp + 0x139]
00014008A278  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A27F  jne     0x14008a28d
00014008A281  lea     rcx, [rbp + 0x2b0]
00014008A288  call    0x1402d4880
00014008A28D  mov     rax, qword ptr [rbp + 0x2b8]
00014008A294  mov     byte ptr [rax + rsi + 0xa], bl
00014008A298  lea     rax, [rsi + 0xb]
00014008A29C  mov     qword ptr [rbp + 0x2c0], rax
00014008A2A3  movzx   ebx, byte ptr [rbp + 0x13a]
00014008A2AA  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A2B1  jne     0x14008a2bf
00014008A2B3  lea     rcx, [rbp + 0x2b0]
00014008A2BA  call    0x1402d4880
00014008A2BF  mov     rax, qword ptr [rbp + 0x2b8]
00014008A2C6  mov     byte ptr [rax + rsi + 0xb], bl
00014008A2CA  lea     rax, [rsi + 0xc]
00014008A2CE  mov     qword ptr [rbp + 0x2c0], rax
00014008A2D5  movzx   ebx, byte ptr [rbp + 0x13b]
00014008A2DC  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A2E3  jne     0x14008a2f1
00014008A2E5  lea     rcx, [rbp + 0x2b0]
00014008A2EC  call    0x1402d4880
00014008A2F1  mov     rax, qword ptr [rbp + 0x2b8]
00014008A2F8  mov     byte ptr [rax + rsi + 0xc], bl
00014008A2FC  lea     rax, [rsi + 0xd]
00014008A300  mov     qword ptr [rbp + 0x2c0], rax
00014008A307  movzx   ebx, byte ptr [rbp + 0x13c]
00014008A30E  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A315  jne     0x14008a323
00014008A317  lea     rcx, [rbp + 0x2b0]
00014008A31E  call    0x1402d4880
00014008A323  mov     rax, qword ptr [rbp + 0x2b8]
00014008A32A  mov     byte ptr [rax + rsi + 0xd], bl
00014008A32E  lea     rax, [rsi + 0xe]
00014008A332  mov     qword ptr [rbp + 0x2c0], rax
00014008A339  movzx   ebx, byte ptr [rbp + 0x13d]
00014008A340  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A347  jne     0x14008a355
00014008A349  lea     rcx, [rbp + 0x2b0]
00014008A350  call    0x1402d4880
00014008A355  mov     rax, qword ptr [rbp + 0x2b8]
00014008A35C  mov     byte ptr [rax + rsi + 0xe], bl
00014008A360  lea     rax, [rsi + 0xf]
00014008A364  mov     qword ptr [rbp + 0x2c0], rax
00014008A36B  movzx   ebx, byte ptr [rbp + 0x13e]
00014008A372  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A379  jne     0x14008a387
00014008A37B  lea     rcx, [rbp + 0x2b0]
00014008A382  call    0x1402d4880
00014008A387  mov     rax, qword ptr [rbp + 0x2b8]
00014008A38E  mov     byte ptr [rax + rsi + 0xf], bl
00014008A392  lea     rax, [rsi + 0x10]
00014008A396  mov     qword ptr [rbp + 0x2c0], rax
00014008A39D  movzx   ebx, byte ptr [rbp + 0x13f]
00014008A3A4  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A3AB  jne     0x14008a3b9
00014008A3AD  lea     rcx, [rbp + 0x2b0]
00014008A3B4  call    0x1402d4880
00014008A3B9  mov     rax, qword ptr [rbp + 0x2b8]
00014008A3C0  mov     byte ptr [rax + rsi + 0x10], bl
00014008A3C4  lea     rax, [rsi + 0x11]
00014008A3C8  mov     qword ptr [rbp + 0x2c0], rax
00014008A3CF  movzx   ebx, byte ptr [rbp + 0x200]
00014008A3D6  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A3DD  jne     0x14008a3eb
00014008A3DF  lea     rcx, [rbp + 0x2b0]
00014008A3E6  call    0x1402d4880
00014008A3EB  mov     rax, qword ptr [rbp + 0x2b8]
00014008A3F2  mov     rdx, rsi
00014008A3F5  mov     byte ptr [rax + rsi + 0x11], bl
00014008A3F9  add     rdx, 0x12
00014008A3FD  mov     qword ptr [rbp + 0x2c0], rdx
00014008A404  mov     rsi, qword ptr [rbp + 0x110]
00014008A40B  mov     rax, qword ptr [rbp + 0x2b0]
00014008A412  sub     rax, rdx
00014008A415  cmp     rax, 3
00014008A419  jbe     0x14008accc
00014008A41F  mov     rax, qword ptr [rbp + 0x2b8]
00014008A426  mov     dword ptr [rax + rdx], esi
00014008A429  add     rdx, 4
00014008A42D  mov     qword ptr [rbp + 0x2c0], rdx
00014008A434  mov     rax, qword ptr [rbp + 0x100]
00014008A43B  mov     rcx, qword ptr [rbp + 0x108]
00014008A442  mov     qword ptr [rbp + 0x298], rcx
00014008A449  test    rax, rax
00014008A44C  cmove   rsi, rax
00014008A450  mov     qword ptr [rbp + 0x290], rsi
00014008A457  setne   r8b
00014008A45B  xor     r15d, r15d
00014008A45E  jmp     0x14008a465
00014008A460  xor     eax, eax
00014008A462  mov     r8b, 1
00014008A465  cmp     qword ptr [rbp + 0x290], 0
00014008A46D  je      0x14008a8fc
00014008A473  test    r8b, 1
00014008A477  je      0x14008adcc
00014008A47D  test    r15, r15
00014008A480  mov     r12, qword ptr [rbp + 0x298]
00014008A487  je      0x14008a4b0
00014008A489  movzx   ecx, word ptr [r15 + 0x13e]
00014008A491  cmp     r12, rcx
00014008A494  jae     0x14008a560
00014008A49A  mov     r13, r15
00014008A49D  jmp     0x14008a584
00014008A4A2  nop     word ptr cs:[rax + rax]
00014008A4B0  test    r12, r12
00014008A4B3  je      0x14008a4ed
00014008A4B5  mov     rcx, r12
00014008A4B8  mov     r15, rax
00014008A4BB  and     rcx, 7
00014008A4BF  je      0x14008a4f2
00014008A4C1  xor     r8d, r8d
00014008A4C4  nop     word ptr cs:[rax + rax]
00014008A4D0  mov     r15, qword ptr [r15 + 0x140]
00014008A4D7  inc     r8
00014008A4DA  cmp     rcx, r8
00014008A4DD  jne     0x14008a4d0
00014008A4DF  mov     rax, r12
00014008A4E2  sub     rax, r8
00014008A4E5  cmp     r12, 8
00014008A4E9  jae     0x14008a500
00014008A4EB  jmp     0x14008a53e
00014008A4ED  mov     r15, rax
00014008A4F0  jmp     0x14008a53e
00014008A4F2  mov     rax, r12
00014008A4F5  cmp     r12, 8
00014008A4F9  jb      0x14008a53e
00014008A4FB  nop     dword ptr [rax + rax]
00014008A500  mov     rcx, qword ptr [r15 + 0x140]
00014008A507  mov     rcx, qword ptr [rcx + 0x140]
00014008A50E  mov     rcx, qword ptr [rcx + 0x140]
00014008A515  mov     rcx, qword ptr [rcx + 0x140]
00014008A51C  mov     rcx, qword ptr [rcx + 0x140]
00014008A523  mov     rcx, qword ptr [rcx + 0x140]
00014008A52A  mov     rcx, qword ptr [rcx + 0x140]
00014008A531  mov     r15, qword ptr [rcx + 0x140]
00014008A538  add     rax, -8
00014008A53C  jne     0x14008a500
00014008A53E  xor     r12d, r12d
00014008A541  xor     eax, eax
00014008A543  movzx   ecx, word ptr [r15 + 0x13e]
00014008A54B  cmp     r12, rcx
00014008A54E  jb      0x14008a49a
00014008A554  nop     word ptr cs:[rax + rax]
00014008A560  mov     r13, qword ptr [r15]
00014008A563  test    r13, r13
00014008A566  je      0x14008ad4e
00014008A56C  inc     rax
00014008A56F  movzx   r12d, word ptr [r15 + 0x13c]
00014008A577  mov     r15, r13
00014008A57A  cmp     r12w, word ptr [r13 + 0x13e]
00014008A582  jae     0x14008a560
00014008A584  lea     rcx, [r12 + 1]
00014008A589  test    rax, rax
00014008A58C  je      0x14008a620
00014008A592  lea     rcx, [rcx*8 + 0x140]
00014008A59A  add     rcx, r13
00014008A59D  mov     r9, rax
00014008A5A0  and     r9, 7
00014008A5A4  je      0x14008a890
00014008A5AA  xor     r8d, r8d
00014008A5AD  nop     dword ptr [rax]
00014008A5B0  mov     r15, qword ptr [rcx]
00014008A5B3  lea     rcx, [r15 + 0x140]
00014008A5BA  inc     r8
00014008A5BD  cmp     r9, r8
00014008A5C0  jne     0x14008a5b0
00014008A5C2  mov     r9, rax
00014008A5C5  sub     r9, r8
00014008A5C8  cmp     rax, 8
00014008A5CC  jb      0x14008a611
00014008A5CE  nop     
00014008A5D0  mov     rax, qword ptr [rcx]
00014008A5D3  mov     rax, qword ptr [rax + 0x140]
00014008A5DA  mov     rax, qword ptr [rax + 0x140]
00014008A5E1  mov     rax, qword ptr [rax + 0x140]
00014008A5E8  mov     rax, qword ptr [rax + 0x140]
00014008A5EF  mov     rax, qword ptr [rax + 0x140]
00014008A5F6  mov     rax, qword ptr [rax + 0x140]
00014008A5FD  mov     r15, qword ptr [rax + 0x140]
00014008A604  lea     rcx, [r15 + 0x140]
00014008A60B  add     r9, -8
00014008A60F  jne     0x14008a5d0
00014008A611  mov     qword ptr [rbp + 0x298], 0
00014008A61C  jmp     0x14008a62a
00014008A61E  nop     
00014008A620  mov     qword ptr [rbp + 0x298], rcx
00014008A627  mov     r15, r13
00014008A62A  movzx   ebx, word ptr [r13 + r12*4 + 0x110]
00014008A633  movzx   esi, word ptr [r13 + r12*4 + 0x112]
00014008A63C  mov     rax, qword ptr [rbp + 0x2b0]
00014008A643  sub     rax, rdx
00014008A646  cmp     rax, 1
00014008A64A  jbe     0x14008a8a2
00014008A650  mov     rax, qword ptr [rbp + 0x2b8]
00014008A657  mov     word ptr [rax + rdx], bx
00014008A65B  add     rdx, 2
00014008A65F  mov     qword ptr [rbp + 0x2c0], rdx
00014008A666  mov     rax, qword ptr [rbp + 0x2b0]
00014008A66D  sub     rax, rdx
00014008A670  cmp     rax, 1
00014008A674  jbe     0x14008a8cf
00014008A67A  lea     rax, [r12 + r12*2]
00014008A67E  lea     rbx, [rax*8 + 8]
00014008A686  add     rbx, r13
00014008A689  mov     rax, qword ptr [rbp + 0x2b8]
00014008A690  mov     word ptr [rax + rdx], si
00014008A694  mov     rdi, rdx
00014008A697  lea     rax, [rdx + 2]
00014008A69B  mov     qword ptr [rbp + 0x2c0], rax
00014008A6A2  mov     rsi, qword ptr [rbx + 0x10]
00014008A6A6  cmp     rsi, 6
00014008A6AA  mov     ecx, 6
00014008A6AF  cmovae  rsi, rcx
00014008A6B3  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A6BA  jne     0x14008a6c8
00014008A6BC  lea     rcx, [rbp + 0x2b0]
00014008A6C3  call    0x1402d4880
00014008A6C8  dec     qword ptr [rbp + 0x290]
00014008A6CF  mov     rax, qword ptr [rbp + 0x2b8]
00014008A6D6  mov     rdx, rdi
00014008A6D9  mov     byte ptr [rax + rdi + 2], sil
00014008A6DE  add     rdx, 3
00014008A6E2  mov     qword ptr [rbp + 0x2c0], rdx
00014008A6E9  mov     rcx, qword ptr [rbx + 0x10]
00014008A6ED  mov     r8b, 1
00014008A6F0  mov     eax, 0
00014008A6F5  test    rcx, rcx
00014008A6F8  je      0x14008a465
00014008A6FE  mov     r13, qword ptr [rbx + 8]
00014008A702  lea     rax, [rcx*8]
00014008A70A  add     rax, r13
00014008A70D  mov     qword ptr [rbp + 0x2a0], rax
00014008A714  lea     rax, [r13 + 8]
00014008A718  mov     esi, 5
00014008A71D  nop     dword ptr [rax]
00014008A720  movzx   edi, byte ptr [r13]
00014008A725  movzx   r12d, word ptr [r13 + 2]
00014008A72A  movzx   ebx, byte ptr [r13 + 4]
00014008A72F  movzx   ecx, word ptr [r13 + 6]
00014008A734  mov     word ptr [rbp + 0x2a8], cx
00014008A73B  mov     r13, rax
00014008A73E  mov     r14, rdx
00014008A741  cmp     rdx, qword ptr [rbp + 0x2b0]
00014008A748  jne     0x14008a756
00014008A74A  lea     rcx, [rbp + 0x2b0]
00014008A751  call    0x1402d4880
00014008A756  mov     rax, qword ptr [rbp + 0x2b8]
00014008A75D  mov     byte ptr [rax + r14], dil
00014008A761  inc     r14
00014008A764  mov     qword ptr [rbp + 0x2c0], r14
00014008A76B  mov     rax, qword ptr [rbp + 0x2b0]
00014008A772  sub     rax, r14
00014008A775  cmp     rax, 1
00014008A779  jbe     0x14008a826
00014008A77F  mov     rax, qword ptr [rbp + 0x2b8]
00014008A786  mov     word ptr [rax + r14], r12w
00014008A78B  mov     rdi, r14
00014008A78E  lea     rax, [r14 + 2]
00014008A792  mov     qword ptr [rbp + 0x2c0], rax
00014008A799  cmp     rax, qword ptr [rbp + 0x2b0]
00014008A7A0  jne     0x14008a7ae
00014008A7A2  lea     rcx, [rbp + 0x2b0]
00014008A7A9  call    0x1402d4880
00014008A7AE  mov     rax, qword ptr [rbp + 0x2b8]
00014008A7B5  mov     rdx, rdi
00014008A7B8  mov     byte ptr [rax + rdi + 2], bl
00014008A7BC  add     rdx, 3
00014008A7C0  mov     qword ptr [rbp + 0x2c0], rdx
00014008A7C7  mov     rax, qword ptr [rbp + 0x2b0]
00014008A7CE  sub     rax, rdx
00014008A7D1  cmp     rax, 1
00014008A7D5  jbe     0x14008a856
00014008A7D7  mov     rax, qword ptr [rbp + 0x2b8]
00014008A7DE  movzx   ecx, word ptr [rbp + 0x2a8]
00014008A7E5  mov     word ptr [rax + rdx], cx
00014008A7E9  add     rdx, 2
00014008A7ED  mov     qword ptr [rbp + 0x2c0], rdx
00014008A7F4  sub     rsi, 1
00014008A7F8  setb    al
00014008A7FB  cmp     r13, qword ptr [rbp + 0x2a0]
00014008A802  sete    cl
00014008A805  or      cl, al
00014008A807  mov     eax, ecx
00014008A809  xor     al, 1
00014008A80B  movzx   eax, al
00014008A80E  lea     rax, [rax*8]
00014008A816  add     rax, r13
00014008A819  test    cl, cl
00014008A81B  je      0x14008a720
00014008A821  jmp     0x14008a460
00014008A826  mov     qword ptr [rsp + 0x20], 1
00014008A82F  mov     r8d, 2
00014008A835  mov     r9d, 1
00014008A83B  lea     rcx, [rbp + 0x2b0]
00014008A842  mov     rdx, r14
00014008A845  call    0x1402cc040
00014008A84A  mov     r14, qword ptr [rbp + 0x2c0]
00014008A851  jmp     0x14008a77f
00014008A856  mov     qword ptr [rsp + 0x20], 1
00014008A85F  mov     r8d, 2
00014008A865  mov     r9d, 1
00014008A86B  lea     rcx, [rbp + 0x2b0]
00014008A872  call    0x1402cc040
00014008A877  mov     rdx, qword ptr [rbp + 0x2c0]
00014008A87E  jmp     0x14008a7d7
00014008A883  nop     word ptr cs:[rax + rax]
00014008A890  mov     r9, rax
00014008A893  cmp     rax, 8
00014008A897  jae     0x14008a5d0
00014008A89D  jmp     0x14008a611
00014008A8A2  mov     qword ptr [rsp + 0x20], 1
00014008A8AB  mov     r8d, 2
00014008A8B1  mov     r9d, 1
00014008A8B7  lea     rcx, [rbp + 0x2b0]
00014008A8BE  call    0x1402cc040
00014008A8C3  mov     rdx, qword ptr [rbp + 0x2c0]
00014008A8CA  jmp     0x14008a650
00014008A8CF  mov     qword ptr [rsp + 0x20], 1
00014008A8D8  mov     r8d, 2
00014008A8DE  mov     r9d, 1
00014008A8E4  lea     rcx, [rbp + 0x2b0]
00014008A8EB  call    0x1402cc040
00014008A8F0  mov     rdx, qword ptr [rbp + 0x2c0]
00014008A8F7  jmp     0x14008a67a
00014008A8FC  mov     rax, qword ptr [rbp + 0x2c0]
00014008A903  mov     rcx, qword ptr [rbp + 0x208]
00014008A90A  mov     qword ptr [rcx + 0x10], rax
00014008A90E  movdqu  xmm0, xmmword ptr [rbp + 0x2b0]
00014008A916  movdqu  xmmword ptr [rcx], xmm0
00014008A91A  mov     rdx, qword ptr [rbp + 0x218]
00014008A921  test    rdx, rdx
00014008A924  je      0x14008a938
00014008A926  mov     r8d, 1
00014008A92C  mov     rcx, qword ptr [rbp + 0x288]
00014008A933  call    0x1400549f0
00014008A938  mov     rsi, qword ptr [rbp + 0x248]
00014008A93F  mov     rdi, qword ptr [rbp + 0x250]
00014008A946  test    rdi, rdi
00014008A949  je      0x14008a99d
00014008A94B  lea     rbx, [rsi + 0x28]
00014008A94F  jmp     0x14008a969
00014008A951  nop     word ptr cs:[rax + rax]
00014008A960  add     rbx, 0x58
00014008A964  dec     rdi
00014008A967  je      0x14008a99d
00014008A969  mov     rdx, qword ptr [rbx - 0x20]
00014008A96D  test    rdx, rdx
00014008A970  je      0x14008a981
00014008A972  mov     rcx, qword ptr [rbx - 0x18]
00014008A976  mov     r8d, 1
00014008A97C  call    0x1400549f0
00014008A981  mov     rdx, qword ptr [rbx - 8]
00014008A985  test    rdx, rdx
00014008A988  je      0x14008a960
00014008A98A  mov     rcx, qword ptr [rbx]
00014008A98D  add     rdx, rdx
00014008A990  mov     r8d, 1
00014008A996  call    0x1400549f0
00014008A99B  jmp     0x14008a960
00014008A99D  mov     rax, qword ptr [rbp + 0x240]
00014008A9A4  test    rax, rax
00014008A9A7  je      0x14008a9bb
00014008A9A9  imul    rdx, rax, 0x58
00014008A9AD  mov     r8d, 8
00014008A9B3  mov     rcx, rsi
00014008A9B6  call    0x1400549f0
00014008A9BB  lea     rcx, [rbp + 0x270]
00014008A9C2  call    0x1401c5fb0
00014008A9C7  lea     rcx, [rbp + 0x70]
00014008A9CB  call    0x14006cbc0
00014008A9D0  movaps  xmm6, xmmword ptr [rbp + 0x2f0]
00014008A9D7  add     rsp, 0x388
00014008A9DE  pop     rbx
00014008A9DF  pop     rdi
00014008A9E0  pop     rsi
00014008A9E1  pop     r12
00014008A9E3  pop     r13
00014008A9E5  pop     r14
00014008A9E7  pop     r15
00014008A9E9  pop     rbp
00014008A9EA  ret     
00014008A9EB  lea     rcx, [rip + 0x36f8a6]   ; [rip -> 0x1403FA298]
00014008A9F2  call    0x1402d4d20
00014008A9F7  lea     rcx, [rip + 0x36f89a]   ; [rip -> 0x1403FA298]
00014008A9FE  call    0x1402d4d20
00014008AA03  jmp     0x14008add8
00014008AA08  lea     rcx, [rip + 0x36f889]   ; [rip -> 0x1403FA298]
00014008AA0F  call    0x1402d4d20
00014008AA14  jmp     0x14008add8
00014008AA19  lea     rcx, [rip + 0x36f878]   ; [rip -> 0x1403FA298]
00014008AA20  call    0x1402d4d20
00014008AA25  jmp     0x14008add8
00014008AA2A  lea     rcx, [rip + 0x5b769f]   ; [rip -> 0x1406420D0]
00014008AA31  call    0x1402d1c80
00014008AA36  jmp     0x140087f6b
00014008AA3B  lea     rcx, [rip + 0x36f856]   ; [rip -> 0x1403FA298]
00014008AA42  call    0x1402d4d20
00014008AA47  jmp     0x14008add8
00014008AA4C  lea     rcx, [rip + 0x36f845]   ; [rip -> 0x1403FA298]
00014008AA53  call    0x1402d4d20
00014008AA58  jmp     0x14008add8
00014008AA5D  lea     rcx, [rip + 0x36f834]   ; [rip -> 0x1403FA298]
00014008AA64  call    0x1402d4d20
00014008AA69  jmp     0x14008add8
00014008AA6E  lea     rcx, [rip + 0x36f6eb]   ; [rip -> 0x1403FA160]
00014008AA75  call    0x1402d4d20
00014008AA7A  jmp     0x14008add8
00014008AA7F  lea     rcx, [rip + 0x36f6f2]   ; [rip -> 0x1403FA178]
00014008AA86  call    0x1402d4d20
00014008AA8B  jmp     0x14008add8
00014008AA90  lea     rcx, [rip + 0x36f6c9]   ; [rip -> 0x1403FA160]
00014008AA97  call    0x1402d4d20
00014008AA9C  jmp     0x14008add8
00014008AAA1  lea     rcx, [rip + 0x36f6b8]   ; [rip -> 0x1403FA160]
00014008AAA8  call    0x1402d4d20
00014008AAAD  jmp     0x14008add8
00014008AAB2  mov     qword ptr [rsp + 0x20], 1
00014008AABB  lea     rcx, [rbp + 0x2b0]
00014008AAC2  mov     r8d, 4
00014008AAC8  mov     r9d, 1
00014008AACE  xor     edx, edx
00014008AAD0  call    0x1402cc040
00014008AAD5  mov     rax, qword ptr [rbp + 0x2b8]
00014008AADC  mov     rcx, qword ptr [rbp + 0x2c0]
00014008AAE3  jmp     0x14008917f
00014008AAE8  mov     qword ptr [rsp + 0x20], 1
00014008AAF1  lea     rcx, [rbp + 0x2b0]
00014008AAF8  mov     r8d, 4
00014008AAFE  mov     r9d, 1
00014008AB04  mov     rdx, rdi
00014008AB07  call    0x1402cc040
00014008AB0C  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AB13  jmp     0x1400891d4
00014008AB18  mov     qword ptr [rsp + 0x20], 1
00014008AB21  lea     rcx, [rbp + 0x2b0]
00014008AB28  mov     r9d, 1
00014008AB2E  mov     rdx, rdi
00014008AB31  mov     r8, rsi
00014008AB34  call    0x1402cc040
00014008AB39  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AB40  mov     rdx, qword ptr [rbp + 0x288]
00014008AB47  jmp     0x140089203
00014008AB4C  mov     qword ptr [rsp + 0x20], 1
00014008AB55  lea     rcx, [rbp + 0x2b0]
00014008AB5C  mov     r8d, 2
00014008AB62  mov     r9d, 1
00014008AB68  mov     rdx, rdi
00014008AB6B  call    0x1402cc040
00014008AB70  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AB77  jmp     0x140089233
00014008AB7C  mov     qword ptr [rsp + 0x20], 1
00014008AB85  lea     rcx, [rbp + 0x2b0]
00014008AB8C  mov     r8d, 4
00014008AB92  mov     r9d, 1
00014008AB98  mov     rdx, rdi
00014008AB9B  call    0x1402cc040
00014008ABA0  mov     rdi, qword ptr [rbp + 0x2c0]
00014008ABA7  jmp     0x1400892c1
00014008ABAC  mov     qword ptr [rsp + 0x20], 1
00014008ABB5  lea     rcx, [rbp + 0x2b0]
00014008ABBC  mov     r8d, 4
00014008ABC2  mov     r9d, 1
00014008ABC8  mov     rdx, rdi
00014008ABCB  call    0x1402cc040
00014008ABD0  mov     rdi, qword ptr [rbp + 0x2c0]
00014008ABD7  jmp     0x140089555
00014008ABDC  mov     qword ptr [rsp + 0x20], 1
00014008ABE5  lea     rcx, [rbp + 0x2b0]
00014008ABEC  mov     r8d, 4
00014008ABF2  mov     r9d, 1
00014008ABF8  mov     rdx, rdi
00014008ABFB  call    0x1402cc040
00014008AC00  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AC07  jmp     0x14008977f
00014008AC0C  mov     qword ptr [rsp + 0x20], 1
00014008AC15  lea     rcx, [rbp + 0x2b0]
00014008AC1C  mov     r8d, 2
00014008AC22  mov     r9d, 1
00014008AC28  mov     rdx, rdi
00014008AC2B  call    0x1402cc040
00014008AC30  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AC37  jmp     0x14008999f
00014008AC3C  mov     qword ptr [rsp + 0x20], 1
00014008AC45  lea     rcx, [rbp + 0x2b0]
00014008AC4C  mov     r8d, 4
00014008AC52  mov     r9d, 1
00014008AC58  mov     rdx, rdi
00014008AC5B  call    0x1402cc040
00014008AC60  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AC67  jmp     0x140089a3a
00014008AC6C  mov     qword ptr [rsp + 0x20], 1
00014008AC75  lea     rcx, [rbp + 0x2b0]
00014008AC7C  mov     r8d, 4
00014008AC82  mov     r9d, 1
00014008AC88  mov     rdx, rdi
00014008AC8B  call    0x1402cc040
00014008AC90  mov     rdi, qword ptr [rbp + 0x2c0]
00014008AC97  jmp     0x140089c5f
00014008AC9C  mov     qword ptr [rsp + 0x20], 1
00014008ACA5  lea     rcx, [rbp + 0x2b0]
00014008ACAC  mov     r8d, 4
00014008ACB2  mov     r9d, 1
00014008ACB8  mov     rdx, rdi
00014008ACBB  call    0x1402cc040
00014008ACC0  mov     rdi, qword ptr [rbp + 0x2c0]
00014008ACC7  jmp     0x140089e7f
00014008ACCC  mov     qword ptr [rsp + 0x20], 1
00014008ACD5  lea     rcx, [rbp + 0x2b0]
00014008ACDC  mov     r8d, 4
00014008ACE2  mov     r9d, 1
00014008ACE8  call    0x1402cc040
00014008ACED  mov     rdx, qword ptr [rbp + 0x2c0]
00014008ACF4  jmp     0x14008a41f
00014008ACF9  lea     rcx, [rip + 0x36f460]   ; [rip -> 0x1403FA160]
00014008AD00  call    0x1402d4d20
00014008AD05  jmp     0x14008add8
00014008AD0A  lea     rcx, [rip + 0x36f44f]   ; [rip -> 0x1403FA160]
00014008AD11  call    0x1402d4d20
00014008AD16  jmp     0x14008add8
00014008AD1B  lea     rcx, [rip + 0x36f43e]   ; [rip -> 0x1403FA160]
00014008AD22  call    0x1402d4d20
00014008AD27  jmp     0x14008add8
00014008AD2C  lea     rcx, [rip + 0x36f42d]   ; [rip -> 0x1403FA160]
00014008AD33  call    0x1402d4d20
00014008AD38  jmp     0x14008add8
00014008AD3D  lea     rcx, [rip + 0x36f41c]   ; [rip -> 0x1403FA160]
00014008AD44  call    0x1402d4d20
00014008AD49  jmp     0x14008add8
00014008AD4E  lea     rcx, [rip + 0x36f40b]   ; [rip -> 0x1403FA160]
00014008AD55  call    0x1402d4d20
00014008AD5A  jmp     0x14008add8
00014008AD5C  lea     rcx, [rip + 0x36f3cd]   ; [rip -> 0x1403FA130]
00014008AD63  call    0x1402d4d20
00014008AD68  jmp     0x14008add8
00014008AD6A  lea     rcx, [rip + 0x36f3bf]   ; [rip -> 0x1403FA130]
00014008AD71  call    0x1402d4d20
00014008AD76  jmp     0x14008add8
00014008AD78  lea     rcx, [rip + 0x36f3b1]   ; [rip -> 0x1403FA130]
00014008AD7F  call    0x1402d4d20
00014008AD84  jmp     0x14008add8
00014008AD86  lea     rcx, [rip + 0x36f3a3]   ; [rip -> 0x1403FA130]
00014008AD8D  call    0x1402d4d20
00014008AD92  jmp     0x14008add8
00014008AD94  lea     rcx, [rip + 0x36f395]   ; [rip -> 0x1403FA130]
00014008AD9B  call    0x1402d4d20
00014008ADA0  jmp     0x14008add8
00014008ADA2  lea     rcx, [rip + 0x36f387]   ; [rip -> 0x1403FA130]
00014008ADA9  call    0x1402d4d20
00014008ADAE  jmp     0x14008add8
00014008ADB0  lea     rcx, [rip + 0x36f379]   ; [rip -> 0x1403FA130]
00014008ADB7  call    0x1402d4d20
00014008ADBC  jmp     0x14008add8
00014008ADBE  lea     rcx, [rip + 0x36f36b]   ; [rip -> 0x1403FA130]
00014008ADC5  call    0x1402d4d20
00014008ADCA  jmp     0x14008add8
00014008ADCC  lea     rcx, [rip + 0x36f35d]   ; [rip -> 0x1403FA130]
00014008ADD3  call    0x1402d4d20
00014008ADD8  ud2     
00014008ADDA  nop     word ptr [rax + rax]
