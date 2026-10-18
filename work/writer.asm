0001400CF7F0  push    rbp
0001400CF7F1  push    r15
0001400CF7F3  push    r14
0001400CF7F5  push    r13
0001400CF7F7  push    r12
0001400CF7F9  push    rsi
0001400CF7FA  push    rdi
0001400CF7FB  push    rbx
0001400CF7FC  sub     rsp, 0x1f8
0001400CF803  lea     rbp, [rsp + 0x80]
0001400CF80B  mov     qword ptr [rbp + 0x170], 0xfffffffffffffffe
0001400CF816  mov     r12, r9
0001400CF819  mov     qword ptr [rbp + 8], r8
0001400CF81D  mov     qword ptr [rbp + 0x10], rdx
0001400CF821  mov     rbx, rcx
0001400CF824  mov     eax, dword ptr [rip + 0x5727d6]   ; [rip -> 0x140642000]
0001400CF82A  test    eax, eax
0001400CF82C  jne     0x1400d0bef
0001400CF832  mov     rax, qword ptr [rip + 0x5728b7]   ; [rip -> 0x1406420F0]
0001400CF839  mov     ecx, eax
0001400CF83B  and     ecx, 8
0001400CF83E  shr     ecx, 3
0001400CF841  cmp     rax, -0x10
0001400CF845  setae   dl
0001400CF848  or      dl, cl
0001400CF84A  je      0x1400cf862
0001400CF84C  lea     rcx, [rip + 0x57289d]   ; [rip -> 0x1406420F0]
0001400CF853  xor     edx, edx
0001400CF855  mov     r9d, 0x3b9aca00
0001400CF85B  call    0x1402d1400
0001400CF860  jmp     0x1400cf871
0001400CF862  lea     rcx, [rax + 0x10]
0001400CF866  lock cmpxchg qword ptr [rip + 0x572881], rcx   ; [rip -> 0x1406420F0]
0001400CF86F  jne     0x1400cf84c
0001400CF871  mov     rax, qword ptr [rip + 0x572888]   ; [rip -> 0x140642100]
0001400CF878  mov     rcx, qword ptr [rip + 0x572889]   ; [rip -> 0x140642108]
0001400CF87F  lea     rcx, [rcx + rcx*4]
0001400CF883  shl     rcx, 4
0001400CF887  add     rcx, rax
0001400CF88A  mov     qword ptr [rbp + 0xd0], rax
0001400CF891  mov     qword ptr [rbp + 0xd8], rcx
0001400CF898  mov     qword ptr [rbp + 0xe0], 0
0001400CF8A3  lea     rcx, [rbp + 0x120]
0001400CF8AA  lea     rdx, [rbp + 0xd0]
0001400CF8B1  call    0x1401c72f0
0001400CF8B6  mov     rax, qword ptr [rbp + 0x130]
0001400CF8BD  mov     qword ptr [rbp + 0x50], rax
0001400CF8C1  movdqu  xmm0, xmmword ptr [rbp + 0x120]
0001400CF8C9  movdqa  xmmword ptr [rbp + 0x40], xmm0
0001400CF8CE  mov     rax, 0xfffffffffffffff0
0001400CF8D5  lock xadd qword ptr [rip + 0x572812], rax   ; [rip -> 0x1406420F0]
0001400CF8DE  and     rax, 0xfffffffffffffff2
0001400CF8E2  cmp     rax, 0x12
0001400CF8E6  je      0x1400d0c31
0001400CF8EC  mov     rax, qword ptr [rip + 0x5727fd]   ; [rip -> 0x1406420F0]
0001400CF8F3  mov     ecx, eax
0001400CF8F5  and     ecx, 8
0001400CF8F8  shr     ecx, 3
0001400CF8FB  cmp     rax, -0x10
0001400CF8FF  setae   dl
0001400CF902  or      dl, cl
0001400CF904  je      0x1400cf91c
0001400CF906  lea     rcx, [rip + 0x5727e3]   ; [rip -> 0x1406420F0]
0001400CF90D  xor     edx, edx
0001400CF90F  mov     r9d, 0x3b9aca00
0001400CF915  call    0x1402d1400
0001400CF91A  jmp     0x1400cf92b
0001400CF91C  lea     rcx, [rax + 0x10]
0001400CF920  lock cmpxchg qword ptr [rip + 0x5727c7], rcx   ; [rip -> 0x1406420F0]
0001400CF929  jne     0x1400cf906
0001400CF92B  mov     rax, qword ptr [rip + 0x5727d6]   ; [rip -> 0x140642108]
0001400CF932  cmp     rax, 0xff
0001400CF938  mov     esi, 0xff
0001400CF93D  cmovb   rsi, rax
0001400CF941  mov     rax, 0xfffffffffffffff0
0001400CF948  lock xadd qword ptr [rip + 0x57279f], rax   ; [rip -> 0x1406420F0]
0001400CF951  and     rax, 0xfffffffffffffff2
0001400CF955  cmp     rax, 0x12
0001400CF959  je      0x1400d0c42
0001400CF95F  mov     rdi, qword ptr [rbx + 0x48]
0001400CF963  mov     rdx, rbx
0001400CF966  mov     rbx, rdi
0001400CF969  shl     rbx, 4
0001400CF96D  mov     rax, rdi
0001400CF970  shr     rax, 0x3c
0001400CF974  setne   al
0001400CF977  movabs  rcx, 0x7ffffffffffffffe
0001400CF981  cmp     rbx, rcx
0001400CF984  seta    cl
0001400CF987  or      cl, al
0001400CF989  je      0x1400cf99e
0001400CF98B  xor     r13d, r13d
0001400CF98E  mov     rcx, r13
0001400CF991  mov     rdx, rbx
0001400CF994  call    0x1402d4831
0001400CF999  jmp     0x1400d105f
0001400CF99E  mov     qword ptr [rbp + 0x148], rdx
0001400CF9A5  mov     r15, qword ptr [rdx + 0x40]
0001400CF9A9  test    rbx, rbx
0001400CF9AC  je      0x1400cf9da
0001400CF9AE  call    0x140007ed0
0001400CF9B3  mov     r13d, 2
0001400CF9B9  mov     edx, 2
0001400CF9BE  mov     rcx, rbx
0001400CF9C1  call    0x1400549e0
0001400CF9C6  test    rax, rax
0001400CF9C9  je      0x1400cf98e
0001400CF9CB  mov     rcx, rax
0001400CF9CE  mov     r14, r12
0001400CF9D1  mov     qword ptr [rbp + 0xc0], rdi
0001400CF9D8  jmp     0x1400cf9ed
0001400CF9DA  mov     r14, r12
0001400CF9DD  mov     ecx, 2
0001400CF9E2  mov     qword ptr [rbp + 0xc0], 0
0001400CF9ED  mov     qword ptr [rbp + 0xb8], rcx
0001400CF9F4  mov     rdx, r15
0001400CF9F7  mov     r12, rbx
0001400CF9FA  mov     r8, rbx
0001400CF9FD  call    0x1402cb3f0
0001400CFA02  test    rdi, rdi
0001400CFA05  mov     rbx, qword ptr [rbp + 0x148]
0001400CFA0C  je      0x1400cfa86
0001400CFA0E  xor     eax, eax
0001400CFA10  mov     rdx, qword ptr [rbp + 0xb8]
0001400CFA17  jmp     0x1400cfa29
0001400CFA19  nop     dword ptr [rax]
0001400CFA20  add     rax, 0x10
0001400CFA24  cmp     r12, rax
0001400CFA27  je      0x1400cfa86
0001400CFA29  movzx   ecx, byte ptr [rdx + rax + 0xd]
0001400CFA2E  cmp     cl, 2
0001400CFA31  jne     0x1400cfa60
0001400CFA33  movzx   ecx, byte ptr [rdx + rax + 6]
0001400CFA38  cmp     cl, sil
0001400CFA3B  jb      0x1400cfa71
0001400CFA3D  test    cl, cl
0001400CFA3F  je      0x1400cfa71
0001400CFA41  cmp     byte ptr [rdx + rax + 0xa], 0
0001400CFA46  je      0x1400cfa71
0001400CFA48  mov     byte ptr [rdx + rax + 6], 0
0001400CFA4D  mov     byte ptr [rdx + rax + 0xa], 0
0001400CFA52  jmp     0x1400cfa71
0001400CFA54  nop     word ptr cs:[rax + rax]
0001400CFA60  cmp     cl, 0x29
0001400CFA63  jne     0x1400cfa71
0001400CFA65  cmp     byte ptr [rdx + rax + 6], sil
0001400CFA6A  jb      0x1400cfa71
0001400CFA6C  mov     byte ptr [rdx + rax + 6], 0
0001400CFA71  cmp     byte ptr [rdx + rax + 0xf], 0x29
0001400CFA76  jne     0x1400cfa20
0001400CFA78  cmp     byte ptr [rdx + rax + 0xc], sil
0001400CFA7D  jb      0x1400cfa20
0001400CFA7F  mov     byte ptr [rdx + rax + 0xc], 0
0001400CFA84  jmp     0x1400cfa20
0001400CFA86  lea     rdx, [rbx + 0x670]
0001400CFA8D  lea     rcx, [rbp + 0xd0]
0001400CFA94  call    0x140087a90
0001400CFA99  mov     rcx, qword ptr [rbp + 0xd0]
0001400CFAA0  mov     rsi, qword ptr [rbp + 0xd8]
0001400CFAA7  mov     rax, rcx
0001400CFAAA  neg     rax
0001400CFAAD  jo      0x1400cfbc0
0001400CFAB3  mov     qword ptr [rbp + 0x88], rsi
0001400CFABA  mov     qword ptr [rbp + 0x80], rcx
0001400CFAC1  mov     rax, qword ptr [rbp + 0xe0]
0001400CFAC8  mov     qword ptr [rbp + 0x60], rax
0001400CFACC  mov     rdx, qword ptr [rbp + 0x48]
0001400CFAD0  mov     r8, qword ptr [rbp + 0x50]
0001400CFAD4  lea     rcx, [rbp + 0xd0]
0001400CFADB  xor     r9d, r9d
0001400CFADE  call    0x1402cf200
0001400CFAE3  mov     rcx, qword ptr [rbp + 0xd0]
0001400CFAEA  mov     rsi, qword ptr [rbp + 0xd8]
0001400CFAF1  mov     rax, rcx
0001400CFAF4  neg     rax
0001400CFAF7  jo      0x1400cfba2
0001400CFAFD  mov     qword ptr [rbp + 0x90], rsi
0001400CFB04  mov     r13, qword ptr [rbp + 0x1e0]
0001400CFB0B  cmp     r13, 0xffff
0001400CFB12  mov     qword ptr [rbp + 0x98], rcx
0001400CFB19  jbe     0x1400cfc41
0001400CFB1F  call    0x140007ed0
0001400CFB24  mov     ecx, 0x15
0001400CFB29  mov     edx, 1
0001400CFB2E  call    0x1400549e0
0001400CFB33  test    rax, rax
0001400CFB36  je      0x1400d103f
0001400CFB3C  movdqu  xmm0, xmmword ptr [rip + 0x282274]   ; [rip -> 0x140351DB8] str='save name is too long'
0001400CFB44  movdqu  xmmword ptr [rax], xmm0
0001400CFB48  movabs  rcx, 0x676e6f6c206f6f74
0001400CFB52  mov     qword ptr [rax + 0xd], rcx
0001400CFB56  mov     qword ptr [rbp + 0xd0], 0x15
0001400CFB61  mov     qword ptr [rbp + 0xd8], rax
0001400CFB68  mov     qword ptr [rbp + 0xe0], 0x15
0001400CFB73  lea     rdx, [rbp + 0xd0]
0001400CFB7A  mov     cl, 0x15
0001400CFB7C  call    0x1401f7520
0001400CFB81  mov     rsi, rax
0001400CFB84  mov     rdx, qword ptr [rbp + 0x98]
0001400CFB8B  test    rdx, rdx
0001400CFB8E  je      0x1400cfba2
0001400CFB90  mov     r8d, 1
0001400CFB96  mov     rcx, qword ptr [rbp + 0x90]
0001400CFB9D  call    0x1400549f0
0001400CFBA2  mov     rdx, qword ptr [rbp + 0x80]
0001400CFBA9  test    rdx, rdx
0001400CFBAC  je      0x1400cfbc0
0001400CFBAE  mov     r8d, 1
0001400CFBB4  mov     rcx, qword ptr [rbp + 0x88]
0001400CFBBB  call    0x1400549f0
0001400CFBC0  mov     rdx, qword ptr [rbp + 0xc0]
0001400CFBC7  test    rdx, rdx
0001400CFBCA  je      0x1400cfbe2
0001400CFBCC  shl     rdx, 4
0001400CFBD0  mov     r8d, 2
0001400CFBD6  mov     rcx, qword ptr [rbp + 0xb8]
0001400CFBDD  call    0x1400549f0
0001400CFBE2  mov     rdi, qword ptr [rbp + 0x48]
0001400CFBE6  mov     rbx, qword ptr [rbp + 0x50]
0001400CFBEA  test    rbx, rbx
0001400CFBED  je      0x1400d0bbd
0001400CFBF3  lea     r14, [rdi + 0x28]
0001400CFBF7  jmp     0x1400cfc0d
0001400CFBF9  nop     dword ptr [rax]
0001400CFC00  add     r14, 0x58
0001400CFC04  dec     rbx
0001400CFC07  je      0x1400d0bbd
0001400CFC0D  mov     rdx, qword ptr [r14 - 0x20]
0001400CFC11  test    rdx, rdx
0001400CFC14  je      0x1400cfc25
0001400CFC16  mov     rcx, qword ptr [r14 - 0x18]
0001400CFC1A  mov     r8d, 1
0001400CFC20  call    0x1400549f0
0001400CFC25  mov     rdx, qword ptr [r14 - 8]
0001400CFC29  test    rdx, rdx
0001400CFC2C  je      0x1400cfc00
0001400CFC2E  mov     rcx, qword ptr [r14]
0001400CFC31  add     rdx, rdx
0001400CFC34  mov     r8d, 1
0001400CFC3A  call    0x1400549f0
0001400CFC3F  jmp     0x1400cfc00
0001400CFC41  mov     rax, qword ptr [rbp + 0xe0]
0001400CFC48  mov     qword ptr [rbp + 0x68], rax
0001400CFC4C  call    0x14009c310
0001400CFC51  mov     qword ptr [rbp + 0x158], 0
0001400CFC5C  mov     qword ptr [rbp + 0x160], 1
0001400CFC67  mov     qword ptr [rbp + 0x168], 0
0001400CFC72  mov     qword ptr [rsp + 0x20], 1
0001400CFC7B  lea     rcx, [rbp + 0x158]
0001400CFC82  mov     r8d, 4
0001400CFC88  mov     r9d, 1
0001400CFC8E  xor     edx, edx
0001400CFC90  call    0x1402cc040
0001400CFC95  mov     rax, qword ptr [rbp + 0x160]
0001400CFC9C  mov     r15, qword ptr [rbp + 0x168]
0001400CFCA3  mov     dword ptr [rax + r15], 0x4e494c41
0001400CFCAB  lea     rax, [r15 + 4]
0001400CFCAF  mov     qword ptr [rbp + 0x168], rax
0001400CFCB6  cmp     rax, qword ptr [rbp + 0x158]
0001400CFCBD  jne     0x1400cfccb
0001400CFCBF  lea     rcx, [rbp + 0x158]
0001400CFCC6  call    0x1402d4880
0001400CFCCB  mov     rax, qword ptr [rbp + 0x160]
0001400CFCD2  mov     byte ptr [rax + r15 + 4], 7
0001400CFCD8  add     r15, 5
0001400CFCDC  mov     qword ptr [rbp + 0x168], r15
0001400CFCE3  mov     rax, qword ptr [rbp + 0x158]
0001400CFCEA  sub     rax, r15
0001400CFCED  cmp     rax, 1
0001400CFCF1  jbe     0x1400d0c53
0001400CFCF7  mov     rax, qword ptr [rbp + 0x160]
0001400CFCFE  mov     word ptr [rax + r15], r13w
0001400CFD03  add     r15, 2
0001400CFD07  mov     qword ptr [rbp + 0x168], r15
0001400CFD0E  mov     rax, qword ptr [rbp + 0x158]
0001400CFD15  sub     rax, r15
0001400CFD18  cmp     r13, rax
0001400CFD1B  ja      0x1400d0c83
0001400CFD21  mov     rcx, qword ptr [rbp + 0x160]
0001400CFD28  add     rcx, r15
0001400CFD2B  mov     rdx, r14
0001400CFD2E  mov     r8, r13
0001400CFD31  call    0x1402cb3f0
0001400CFD36  add     r15, r13
0001400CFD39  mov     qword ptr [rbp + 0x168], r15
0001400CFD40  cmp     byte ptr [rbx + 0x7ff], 0
0001400CFD47  je      0x1400cfd97
0001400CFD49  call    0x140007ed0
0001400CFD4E  mov     esi, 0x18
0001400CFD53  mov     ecx, 0x18
0001400CFD58  mov     edx, 1
0001400CFD5D  call    0x1400549e0
0001400CFD62  test    rax, rax
0001400CFD65  je      0x1400d1050
0001400CFD6B  movdqu  xmm0, xmmword ptr [rip + 0x22911f]   ; [rip -> 0x1402F8E92]
0001400CFD73  movdqu  xmmword ptr [rax], xmm0
0001400CFD77  movabs  rcx, 0x64656b636f6c6e75
0001400CFD81  mov     qword ptr [rbp + 0xc8], rax
0001400CFD88  mov     qword ptr [rax + 0x10], rcx
0001400CFD8C  mov     r14d, 0x18
0001400CFD92  jmp     0x1400d02c4
0001400CFD97  xor     esi, esi
0001400CFD99  lea     r14, [rip + 0x572264]   ; [rip -> 0x140642004]
0001400CFDA0  xor     edi, edi
0001400CFDA2  jmp     0x1400cfdc1
0001400CFDA4  nop     word ptr cs:[rax + rax]
0001400CFDB0  xor     eax, eax
0001400CFDB2  add     rdi, rax
0001400CFDB5  inc     rsi
0001400CFDB8  cmp     rsi, 0x8d
0001400CFDBF  je      0x1400cfdf6
0001400CFDC1  cmp     byte ptr [rbx + rsi + 0x772], 1
0001400CFDC9  jne     0x1400cfdb0
0001400CFDCB  mov     eax, dword ptr [rip + 0x572233]   ; [rip -> 0x140642004]
0001400CFDD1  test    eax, eax
0001400CFDD3  jne     0x1400cfdec
0001400CFDD5  movzx   eax, byte ptr [rsi + r14 + 4]
0001400CFDDB  add     rdi, rax
0001400CFDDE  inc     rsi
0001400CFDE1  cmp     rsi, 0x8d
0001400CFDE8  jne     0x1400cfdc1
0001400CFDEA  jmp     0x1400cfdf6
0001400CFDEC  mov     rcx, r14
0001400CFDEF  call    0x1402d1363
0001400CFDF4  jmp     0x1400cfdd5
0001400CFDF6  mov     qword ptr [rbp - 8], rdi
0001400CFDFA  mov     qword ptr [rbp - 0x10], 0x5c
0001400CFE02  xor     edi, edi
0001400CFE04  xor     esi, esi
0001400CFE06  jmp     0x1400cfe21
0001400CFE08  nop     dword ptr [rax + rax]
0001400CFE10  xor     eax, eax
0001400CFE12  add     rsi, rax
0001400CFE15  inc     rdi
0001400CFE18  cmp     rdi, 0x8d
0001400CFE1F  je      0x1400cfe5a
0001400CFE21  cmp     byte ptr [rbx + rdi + 0x772], 1
0001400CFE29  jne     0x1400cfe10
0001400CFE2B  mov     eax, dword ptr [rip + 0x5721d3]   ; [rip -> 0x140642004]
0001400CFE31  test    eax, eax
0001400CFE33  jne     0x1400cfe50
0001400CFE35  movzx   eax, byte ptr [rdi + r14 + 4]
0001400CFE3B  xor     rax, 1
0001400CFE3F  add     rsi, rax
0001400CFE42  inc     rdi
0001400CFE45  cmp     rdi, 0x8d
0001400CFE4C  jne     0x1400cfe21
0001400CFE4E  jmp     0x1400cfe5a
0001400CFE50  mov     rcx, r14
0001400CFE53  call    0x1402d1363
0001400CFE58  jmp     0x1400cfe35
0001400CFE5A  add     rsi, qword ptr [rbx + 0x6e0]
0001400CFE61  mov     qword ptr [rbp - 0x18], rsi
0001400CFE65  mov     rax, qword ptr [rbx + 0x728]
0001400CFE6C  mov     qword ptr [rbp + 0x30], rax
0001400CFE70  movdqu  xmm0, xmmword ptr [rbx + 0x730]
0001400CFE78  pxor    xmm1, xmm1
0001400CFE7C  pcmpeqb xmm1, xmm0
0001400CFE80  pmovmskb r10d, xmm1
0001400CFE85  xor     r10d, 0xffff
0001400CFE8C  mov     r13d, r10d
0001400CFE8F  mov     eax, r10d
0001400CFE92  mov     ecx, r10d
0001400CFE95  mov     r8d, r10d
0001400CFE98  mov     r9d, r10d
0001400CFE9B  mov     edx, r10d
0001400CFE9E  mov     r11d, r10d
0001400CFEA1  and     r11d, 8
0001400CFEA5  shr     r11d, 3
0001400CFEA9  mov     esi, r10d
0001400CFEAC  and     esi, 2
0001400CFEAF  shr     esi, 1
0001400CFEB1  mov     edi, r10d
0001400CFEB4  and     edi, 1
0001400CFEB7  add     rsi, rdi
0001400CFEBA  mov     edi, r10d
0001400CFEBD  and     edi, 4
0001400CFEC0  shr     edi, 2
0001400CFEC3  add     r11, rdi
0001400CFEC6  mov     edi, r10d
0001400CFEC9  and     edi, 0x20
0001400CFECC  shr     edi, 5
0001400CFECF  add     r11, rsi
0001400CFED2  mov     esi, r10d
0001400CFED5  and     esi, 0x10
0001400CFED8  shr     esi, 4
0001400CFEDB  add     rdi, rsi
0001400CFEDE  mov     esi, r10d
0001400CFEE1  and     esi, 0x40
0001400CFEE4  shr     esi, 6
0001400CFEE7  add     rsi, rdi
0001400CFEEA  mov     edi, r10d
0001400CFEED  add     rsi, r11
0001400CFEF0  mov     r11d, r10d
0001400CFEF3  shr     r11d, 8
0001400CFEF7  and     r11d, 1
0001400CFEFB  shr     r10b, 7
0001400CFEFF  movzx   r10d, r10b
0001400CFF03  add     r11, r10
0001400CFF06  shr     edi, 9
0001400CFF09  and     edi, 1
0001400CFF0C  add     rdi, r11
0001400CFF0F  shr     edx, 0xa
0001400CFF12  and     edx, 1
0001400CFF15  add     rdx, rdi
0001400CFF18  add     rdx, rsi
0001400CFF1B  shr     r8d, 0xc
0001400CFF1F  and     r8d, 1
0001400CFF23  shr     r9d, 0xb
0001400CFF27  and     r9d, 1
0001400CFF2B  add     r8, r9
0001400CFF2E  shr     ecx, 0xd
0001400CFF31  and     ecx, 1
0001400CFF34  add     rcx, r8
0001400CFF37  shr     eax, 0xe
0001400CFF3A  and     eax, 1
0001400CFF3D  add     rax, rcx
0001400CFF40  shr     r13d, 0xf
0001400CFF44  add     r13, rax
0001400CFF47  add     r13, rdx
0001400CFF4A  mov     qword ptr [rbp - 0x20], r13
0001400CFF4E  lea     rax, [rbp - 8]
0001400CFF52  mov     qword ptr [rbp + 0xd0], rax
0001400CFF59  lea     rsi, [rip + 0xe4350]   ; [rip -> 0x1401B42B0]
0001400CFF60  mov     qword ptr [rbp + 0xd8], rsi
0001400CFF67  lea     rdx, [rip + 0x227d4a]   ; [rip -> 0x1402F7CB8]
0001400CFF6E  lea     rcx, [rbp + 0x120]
0001400CFF75  lea     r8, [rbp + 0xd0]
0001400CFF7C  call    0x1401b1160
0001400CFF81  lea     rax, [rbp - 0x10]
0001400CFF85  mov     qword ptr [rbp + 0x18], rax
0001400CFF89  mov     qword ptr [rbp + 0x20], rsi
0001400CFF8D  lea     rdx, [rip + 0x227d24]   ; [rip -> 0x1402F7CB8]
0001400CFF94  lea     rcx, [rbp + 0xd0]
0001400CFF9B  lea     r8, [rbp + 0x18]
0001400CFF9F  call    0x1401b1160
0001400CFFA4  mov     rax, qword ptr [rbp + 0xd0]
0001400CFFAB  mov     qword ptr [rbp + 0x140], rax
0001400CFFB2  mov     rax, qword ptr [rbp + 0xd8]
0001400CFFB9  mov     qword ptr [rbp + 0x78], rax
0001400CFFBD  mov     rdi, qword ptr [rbp + 0xe0]
0001400CFFC4  lea     rax, [rbp - 0x18]
0001400CFFC8  mov     qword ptr [rbp + 0xd0], rax
0001400CFFCF  mov     qword ptr [rbp + 0xd8], rsi
0001400CFFD6  lea     rdx, [rip + 0x227cdb]   ; [rip -> 0x1402F7CB8]
0001400CFFDD  lea     rcx, [rbp - 0x38]
0001400CFFE1  lea     r8, [rbp + 0xd0]
0001400CFFE8  call    0x1401b1160
0001400CFFED  movups  xmm0, xmmword ptr [rbp + 0x120]
0001400CFFF4  movaps  xmmword ptr [rbp + 0xd0], xmm0
0001400CFFFB  mov     rax, qword ptr [rbp + 0x130]
0001400D0002  mov     qword ptr [rbp + 0xe0], rax
0001400D0009  mov     rbx, qword ptr [rbp + 0x140]
0001400D0010  mov     qword ptr [rbp + 0xe8], rbx
0001400D0017  mov     r14, qword ptr [rbp + 0x78]
0001400D001B  mov     qword ptr [rbp + 0xf0], r14
0001400D0022  mov     qword ptr [rbp + 0xf8], rdi
0001400D0029  movdqu  xmm0, xmmword ptr [rbp - 0x38]
0001400D002E  movdqa  xmmword ptr [rbp + 0x100], xmm0
0001400D0036  mov     rax, qword ptr [rbp - 0x28]
0001400D003A  mov     qword ptr [rbp + 0x110], rax
0001400D0041  mov     qword ptr [rsp + 0x20], 3
0001400D004A  lea     rdx, [rip + 0x228e03]   ; [rip -> 0x1402F8E54]
0001400D0051  lea     rcx, [rbp + 0xa0]
0001400D0058  lea     r9, [rbp + 0xd0]
0001400D005F  mov     r8d, 0x1e
0001400D0065  call    0x1401548f0
0001400D006A  mov     rdi, rbx
0001400D006D  mov     rbx, r14
0001400D0070  mov     rdx, qword ptr [rbp + 0xd0]
0001400D0077  test    rdx, rdx
0001400D007A  je      0x1400d008e
0001400D007C  mov     rcx, qword ptr [rbp + 0xd8]
0001400D0083  mov     r8d, 1
0001400D0089  call    0x1400549f0
0001400D008E  test    rdi, rdi
0001400D0091  je      0x1400d00a4
0001400D0093  mov     r8d, 1
0001400D0099  mov     rcx, rbx
0001400D009C  mov     rdx, rdi
0001400D009F  call    0x1400549f0
0001400D00A4  mov     rdx, qword ptr [rbp + 0x100]
0001400D00AB  test    rdx, rdx
0001400D00AE  je      0x1400d00c2
0001400D00B0  mov     rcx, qword ptr [rbp + 0x108]
0001400D00B7  mov     r8d, 1
0001400D00BD  call    0x1400549f0
0001400D00C2  cmp     qword ptr [rbp + 0x30], 0
0001400D00C7  je      0x1400d01b6
0001400D00CD  lea     rax, [rbp + 0x30]
0001400D00D1  mov     qword ptr [rbp + 0xd0], rax
0001400D00D8  mov     qword ptr [rbp + 0xd8], rsi
0001400D00DF  lea     rdx, [rip + 0x227bd2]   ; [rip -> 0x1402F7CB8]
0001400D00E6  lea     rcx, [rbp - 0x50]
0001400D00EA  lea     r8, [rbp + 0xd0]
0001400D00F1  call    0x1401b1160
0001400D00F6  movdqu  xmm0, xmmword ptr [rbp - 0x50]
0001400D00FB  movdqa  xmmword ptr [rbp + 0xd0], xmm0
0001400D0103  mov     rax, qword ptr [rbp - 0x40]
0001400D0107  mov     qword ptr [rbp + 0xe0], rax
0001400D010E  mov     qword ptr [rsp + 0x20], 1
0001400D0117  lea     rdx, [rip + 0x228d54]   ; [rip -> 0x1402F8E72]
0001400D011E  lea     rcx, [rbp + 0x120]
0001400D0125  lea     r9, [rbp + 0xd0]
0001400D012C  mov     r8d, 0x10
0001400D0132  call    0x1401548f0
0001400D0137  mov     rdi, qword ptr [rbp + 0x128]
0001400D013E  mov     r14, qword ptr [rbp + 0x130]
0001400D0145  mov     rax, qword ptr [rbp + 0xa0]
0001400D014C  mov     r15, qword ptr [rbp + 0xb0]
0001400D0153  sub     rax, r15
0001400D0156  cmp     r14, rax
0001400D0159  ja      0x1400d0fc9
0001400D015F  mov     rcx, qword ptr [rbp + 0xa8]
0001400D0166  add     rcx, r15
0001400D0169  mov     rdx, rdi
0001400D016C  mov     r8, r14
0001400D016F  call    0x1402cb3f0
0001400D0174  add     r15, r14
0001400D0177  mov     qword ptr [rbp + 0xb0], r15
0001400D017E  mov     rdx, qword ptr [rbp + 0x120]
0001400D0185  test    rdx, rdx
0001400D0188  je      0x1400d0198
0001400D018A  mov     r8d, 1
0001400D0190  mov     rcx, rdi
0001400D0193  call    0x1400549f0
0001400D0198  mov     rdx, qword ptr [rbp + 0xd0]
0001400D019F  test    rdx, rdx
0001400D01A2  je      0x1400d01b6
0001400D01A4  mov     rcx, qword ptr [rbp + 0xd8]
0001400D01AB  mov     r8d, 1
0001400D01B1  call    0x1400549f0
0001400D01B6  test    r13, r13
0001400D01B9  je      0x1400d02a8
0001400D01BF  lea     rax, [rbp - 0x20]
0001400D01C3  mov     qword ptr [rbp + 0x120], rax
0001400D01CA  mov     qword ptr [rbp + 0x128], rsi
0001400D01D1  lea     rdx, [rip + 0x227ae0]   ; [rip -> 0x1402F7CB8]
0001400D01D8  lea     rcx, [rbp + 0xd0]
0001400D01DF  lea     r8, [rbp + 0x120]
0001400D01E6  call    0x1401b1160
0001400D01EB  movdqu  xmm0, xmmword ptr [rbp + 0xd0]
0001400D01F3  movdqa  xmmword ptr [rbp + 0x120], xmm0
0001400D01FB  mov     rax, qword ptr [rbp + 0xe0]
0001400D0202  mov     qword ptr [rbp + 0x130], rax
0001400D0209  mov     qword ptr [rsp + 0x20], 1
0001400D0212  lea     rdx, [rip + 0x228c69]   ; [rip -> 0x1402F8E82]
0001400D0219  lea     rcx, [rbp + 0x18]
0001400D021D  lea     r9, [rbp + 0x120]
0001400D0224  mov     r8d, 0x10
0001400D022A  call    0x1401548f0
0001400D022F  mov     rsi, qword ptr [rbp + 0x20]
0001400D0233  mov     r15, qword ptr [rbp + 0x28]
0001400D0237  mov     rax, qword ptr [rbp + 0xa0]
0001400D023E  mov     r14, qword ptr [rbp + 0xb0]
0001400D0245  sub     rax, r14
0001400D0248  cmp     r15, rax
0001400D024B  ja      0x1400d1004
0001400D0251  mov     rax, qword ptr [rbp + 0xa8]
0001400D0258  mov     qword ptr [rbp + 0xc8], rax
0001400D025F  lea     rcx, [rax + r14]
0001400D0263  mov     rdx, rsi
0001400D0266  mov     r8, r15
0001400D0269  call    0x1402cb3f0
0001400D026E  mov     rdx, qword ptr [rbp + 0x18]
0001400D0272  test    rdx, rdx
0001400D0275  je      0x1400d0285
0001400D0277  mov     r8d, 1
0001400D027D  mov     rcx, rsi
0001400D0280  call    0x1400549f0
0001400D0285  mov     rdx, qword ptr [rbp + 0x120]
0001400D028C  test    rdx, rdx
0001400D028F  je      0x1400d02a3
0001400D0291  mov     rcx, qword ptr [rbp + 0x128]
0001400D0298  mov     r8d, 1
0001400D029E  call    0x1400549f0
0001400D02A3  add     r14, r15
0001400D02A6  jmp     0x1400d02bd
0001400D02A8  mov     rax, qword ptr [rbp + 0xa8]
0001400D02AF  mov     qword ptr [rbp + 0xc8], rax
0001400D02B6  mov     r14, qword ptr [rbp + 0xb0]
0001400D02BD  mov     rsi, qword ptr [rbp + 0xa0]
0001400D02C4  mov     qword ptr [rbp + 0x70], rsi
0001400D02C8  mov     rax, qword ptr [rbp + 0x158]
0001400D02CF  mov     r13, qword ptr [rbp + 0x168]
0001400D02D6  sub     rax, r13
0001400D02D9  cmp     rax, 1
0001400D02DD  jbe     0x1400d0cb0
0001400D02E3  mov     rax, qword ptr [rbp + 0x160]
0001400D02EA  mov     word ptr [rax + r13], r14w
0001400D02EF  add     r13, 2
0001400D02F3  mov     qword ptr [rbp + 0x168], r13
0001400D02FA  mov     rax, qword ptr [rbp + 0x158]
0001400D0301  sub     rax, r13
0001400D0304  cmp     r14, rax
0001400D0307  ja      0x1400d0ce0
0001400D030D  mov     rcx, qword ptr [rbp + 0x160]
0001400D0314  add     rcx, r13
0001400D0317  mov     rdx, qword ptr [rbp + 0xc8]
0001400D031E  mov     r8, r14
0001400D0321  call    0x1402cb3f0
0001400D0326  add     r13, r14
0001400D0329  mov     qword ptr [rbp + 0x168], r13
0001400D0330  mov     rax, qword ptr [rbp + 0x158]
0001400D0337  sub     rax, r13
0001400D033A  cmp     rax, 7
0001400D033E  jbe     0x1400d0d0d
0001400D0344  mov     rax, qword ptr [rbp + 0x1e8]
0001400D034B  mov     rcx, qword ptr [rbp + 0x160]
0001400D0352  mov     qword ptr [rcx + r13], rax
0001400D0356  add     r13, 8
0001400D035A  mov     qword ptr [rbp + 0x168], r13
0001400D0361  call    0x1401a61a0
0001400D0366  mov     dword ptr [rbp + 0x120], eax
0001400D036C  mov     dword ptr [rbp + 0x124], edx
0001400D0372  lea     rcx, [rbp + 0xd0]
0001400D0379  lea     rdx, [rbp + 0x120]
0001400D0380  mov     r8d, 0xd53e8000
0001400D0386  mov     r9d, 0x19db1de
0001400D038C  call    0x1401a6150
0001400D0391  cmp     byte ptr [rbp + 0xd0], 0
0001400D0398  jne     0x1400d03a3
0001400D039A  mov     rsi, qword ptr [rbp + 0xd8]
0001400D03A1  jmp     0x1400d03a5
0001400D03A3  xor     esi, esi
0001400D03A5  mov     rcx, qword ptr [rbp + 0x148]
0001400D03AC  mov     rax, qword ptr [rbp + 0x158]
0001400D03B3  mov     r14, qword ptr [rbp + 0x168]
0001400D03BA  sub     rax, r14
0001400D03BD  cmp     rax, 7
0001400D03C1  jbe     0x1400d0d3d
0001400D03C7  mov     rax, qword ptr [rbp + 0x160]
0001400D03CE  mov     qword ptr [rax + r14], rsi
0001400D03D2  add     r14, 8
0001400D03D6  mov     qword ptr [rbp + 0x168], r14
0001400D03DD  movzx   esi, word ptr [rcx + 0x1cd2]
0001400D03E4  mov     rax, qword ptr [rbp + 0x158]
0001400D03EB  sub     rax, r14
0001400D03EE  cmp     rax, 1
0001400D03F2  jbe     0x1400d0d74
0001400D03F8  mov     rax, qword ptr [rbp + 0x160]
0001400D03FF  mov     word ptr [rax + r14], si
0001400D0404  add     r14, 2
0001400D0408  mov     qword ptr [rbp + 0x168], r14
0001400D040F  mov     esi, dword ptr [rcx + 0x19ec]
0001400D0415  mov     rax, qword ptr [rbp + 0x158]
0001400D041C  sub     rax, r14
0001400D041F  cmp     rax, 3
0001400D0423  jbe     0x1400d0dab
0001400D0429  mov     rax, qword ptr [rbp + 0x160]
0001400D0430  mov     dword ptr [rax + r14], esi
0001400D0434  add     r14, 4
0001400D0438  mov     qword ptr [rbp + 0x168], r14
0001400D043F  mov     esi, dword ptr [rcx + 0x19f0]
0001400D0445  mov     rax, qword ptr [rbp + 0x158]
0001400D044C  sub     rax, r14
0001400D044F  cmp     rax, 3
0001400D0453  jbe     0x1400d0de2
0001400D0459  mov     rax, qword ptr [rbp + 0x160]
0001400D0460  mov     dword ptr [rax + r14], esi
0001400D0464  lea     rax, [r14 + 4]
0001400D0468  mov     qword ptr [rbp + 0x168], rax
0001400D046F  movzx   ebx, byte ptr [rcx + 0x1cf3]
0001400D0476  cmp     rax, qword ptr [rbp + 0x158]
0001400D047D  jne     0x1400d048b
0001400D047F  lea     rcx, [rbp + 0x158]
0001400D0486  call    0x1402d4880
0001400D048B  mov     rax, qword ptr [rbp + 0x160]
0001400D0492  mov     byte ptr [rax + r14 + 4], bl
0001400D0497  lea     rax, [r14 + 5]
0001400D049B  mov     qword ptr [rbp + 0x168], rax
0001400D04A2  mov     rcx, qword ptr [rbp + 0x148]
0001400D04A9  movzx   ebx, byte ptr [rcx + 0x1cde]
0001400D04B0  add     bl, bl
0001400D04B2  or      bl, byte ptr [rcx + 0x1cdd]
0001400D04B8  movzx   edi, byte ptr [rcx + 0x1cdf]
0001400D04BF  movzx   esi, byte ptr [rcx + 0x1ce0]
0001400D04C6  cmp     rax, qword ptr [rbp + 0x158]
0001400D04CD  jne     0x1400d04db
0001400D04CF  lea     rcx, [rbp + 0x158]
0001400D04D6  call    0x1402d4880
0001400D04DB  shl     dil, 2
0001400D04DF  or      bl, dil
0001400D04E2  shl     sil, 3
0001400D04E6  or      sil, bl
0001400D04E9  mov     rax, qword ptr [rbp + 0x160]
0001400D04F0  mov     byte ptr [rax + r14 + 5], sil
0001400D04F5  add     r14, 6
0001400D04F9  mov     qword ptr [rbp + 0x168], r14
0001400D0500  lea     rcx, [rbp + 0xd0]
0001400D0507  mov     rdx, qword ptr [rbp + 0x148]
0001400D050E  call    0x1400d1ce0
0001400D0513  mov     rax, qword ptr [rbp + 0x158]
0001400D051A  mov     r14, qword ptr [rbp + 0x168]
0001400D0521  sub     rax, r14
0001400D0524  cmp     rax, 1
0001400D0528  jbe     0x1400d0e19
0001400D052E  mov     rsi, qword ptr [rbp + 0x148]
0001400D0535  mov     rax, qword ptr [rbp + 0x160]
0001400D053C  mov     word ptr [rax + r14], 0x97
0001400D0543  add     r14, 2
0001400D0547  mov     qword ptr [rbp + 0x168], r14
0001400D054E  mov     rax, qword ptr [rbp + 0x158]
0001400D0555  sub     rax, r14
0001400D0558  cmp     rax, 1
0001400D055C  jbe     0x1400d0e50
0001400D0562  mov     rax, qword ptr [rbp + 0x160]
0001400D0569  mov     word ptr [rax + r14], 0x69
0001400D0570  add     r14, 2
0001400D0574  mov     qword ptr [rbp + 0x168], r14
0001400D057B  mov     r15, qword ptr [rbp + 0xe0]
0001400D0582  mov     rax, qword ptr [rbp + 0x158]
0001400D0589  sub     rax, r14
0001400D058C  cmp     rax, 3
0001400D0590  jbe     0x1400d0e80
0001400D0596  mov     rax, qword ptr [rbp + 0x160]
0001400D059D  mov     dword ptr [rax + r14], r15d
0001400D05A1  add     r14, 4
0001400D05A5  mov     qword ptr [rbp + 0x168], r14
0001400D05AC  mov     rax, qword ptr [rbp + 0xd8]
0001400D05B3  mov     qword ptr [rbp + 0x38], rax
0001400D05B7  mov     rax, qword ptr [rbp + 0x158]
0001400D05BE  sub     rax, r14
0001400D05C1  cmp     r15, rax
0001400D05C4  ja      0x1400d0eb0
0001400D05CA  mov     rcx, qword ptr [rbp + 0x160]
0001400D05D1  add     rcx, r14
0001400D05D4  mov     rdx, qword ptr [rbp + 0x38]
0001400D05D8  mov     r8, r15
0001400D05DB  call    0x1402cb3f0
0001400D05E0  add     r14, r15
0001400D05E3  mov     qword ptr [rbp + 0x168], r14
0001400D05EA  mov     esi, dword ptr [rsi + 0x48]
0001400D05ED  mov     rax, qword ptr [rbp + 0x158]
0001400D05F4  sub     rax, r14
0001400D05F7  cmp     rax, 3
0001400D05FB  jbe     0x1400d0edd
0001400D0601  mov     rax, qword ptr [rbp + 0x160]
0001400D0608  mov     dword ptr [rax + r14], esi
0001400D060C  add     r14, 4
0001400D0610  mov     qword ptr [rbp + 0x168], r14
0001400D0617  mov     r15, qword ptr [rbp + 0xb8]
0001400D061E  mov     rax, r12
0001400D0621  add     rax, r15
0001400D0624  lea     rcx, [rbp + 0x158]
0001400D062B  mov     qword ptr [rbp], rax
0001400D062F  xor     r12d, r12d
0001400D0632  cmp     r15, rax
0001400D0635  setne   byte ptr [rbp + 0x148]
0001400D063C  je      0x1400d09cb
0001400D0642  nop     word ptr cs:[rax + rax]
0001400D0650  movzx   edi, word ptr [r15]
0001400D0654  movzx   eax, word ptr [r15 + 2]
0001400D0659  mov     word ptr [rbp + 0x11e], ax
0001400D0660  movzx   eax, word ptr [r15 + 4]
0001400D0665  mov     word ptr [rbp + 0x11c], ax
0001400D066C  movzx   ebx, byte ptr [r15 + 6]
0001400D0671  movzx   eax, byte ptr [r15 + 7]
0001400D0676  mov     dword ptr [rbp + 0x5c], eax
0001400D0679  movzx   esi, byte ptr [r15 + 8]
0001400D067E  movzx   eax, byte ptr [r15 + 9]
0001400D0683  mov     byte ptr [rbp + 0x156], al
0001400D0689  movzx   eax, byte ptr [r15 + 0xa]
0001400D068E  mov     byte ptr [rbp + 0x155], al
0001400D0694  movzx   eax, byte ptr [r15 + 0xb]
0001400D0699  mov     byte ptr [rbp + 0x140], al
0001400D069F  movzx   eax, byte ptr [r15 + 0xc]
0001400D06A4  mov     byte ptr [rbp + 0x78], al
0001400D06A7  movzx   r13d, byte ptr [r15 + 0xd]
0001400D06AC  movzx   eax, byte ptr [r15 + 0xe]
0001400D06B1  mov     byte ptr [rbp + 0x157], al
0001400D06B7  movzx   eax, byte ptr [r15 + 0xf]
0001400D06BC  mov     byte ptr [rbp + 0x154], al
0001400D06C2  mov     rax, qword ptr [rbp + 0x158]
0001400D06C9  sub     rax, r14
0001400D06CC  cmp     rax, 1
0001400D06D0  jbe     0x1400d0881
0001400D06D6  mov     rax, qword ptr [rbp + 0x160]
0001400D06DD  movzx   r8d, bx
0001400D06E1  shl     r8d, 8
0001400D06E5  movzx   edx, r13w
0001400D06E9  or      edx, r8d
0001400D06EC  mov     word ptr [rax + r14], dx
0001400D06F1  add     r14, 2
0001400D06F5  mov     qword ptr [rbp + 0x168], r14
0001400D06FC  mov     rax, qword ptr [rbp + 0x158]
0001400D0703  sub     rax, r14
0001400D0706  cmp     rax, 1
0001400D070A  jbe     0x1400d08b1
0001400D0710  mov     rax, qword ptr [rbp + 0x160]
0001400D0717  mov     word ptr [rax + r14], di
0001400D071C  add     r14, 2
0001400D0720  mov     qword ptr [rbp + 0x168], r14
0001400D0727  mov     rax, qword ptr [rbp + 0x158]
0001400D072E  sub     rax, r14
0001400D0731  cmp     rax, 1
0001400D0735  jbe     0x1400d08e0
0001400D073B  mov     rax, qword ptr [rbp + 0x160]
0001400D0742  movzx   r8d, si
0001400D0746  shl     r8d, 8
0001400D074A  movzx   edx, word ptr [rbp + 0x5c]
0001400D074E  or      edx, r8d
0001400D0751  mov     word ptr [rax + r14], dx
0001400D0756  add     r14, 2
0001400D075A  mov     qword ptr [rbp + 0x168], r14
0001400D0761  mov     rax, qword ptr [rbp + 0x158]
0001400D0768  sub     rax, r14
0001400D076B  cmp     rax, 1
0001400D076F  jbe     0x1400d090f
0001400D0775  mov     rax, qword ptr [rbp + 0x160]
0001400D077C  movzx   edx, word ptr [rbp + 0x11e]
0001400D0783  mov     word ptr [rax + r14], dx
0001400D0788  add     r14, 2
0001400D078C  mov     qword ptr [rbp + 0x168], r14
0001400D0793  mov     rax, qword ptr [rbp + 0x158]
0001400D079A  sub     rax, r14
0001400D079D  cmp     rax, 2
0001400D07A1  jbe     0x1400d093e
0001400D07A7  mov     rax, qword ptr [rbp + 0x160]
0001400D07AE  movzx   edx, byte ptr [rbp + 0x156]
0001400D07B5  mov     byte ptr [rax + r14], dl
0001400D07B9  movzx   edx, byte ptr [rbp + 0x157]
0001400D07C0  mov     byte ptr [rax + r14 + 1], dl
0001400D07C5  movzx   edx, byte ptr [rbp + 0x155]
0001400D07CC  mov     byte ptr [rax + r14 + 2], dl
0001400D07D1  add     r14, 3
0001400D07D5  mov     qword ptr [rbp + 0x168], r14
0001400D07DC  mov     rax, qword ptr [rbp + 0x158]
0001400D07E3  sub     rax, r14
0001400D07E6  cmp     rax, 1
0001400D07EA  jbe     0x1400d096d
0001400D07F0  mov     rax, qword ptr [rbp + 0x160]
0001400D07F7  movzx   edx, word ptr [rbp + 0x11c]
0001400D07FE  mov     word ptr [rax + r14], dx
0001400D0803  add     r14, 2
0001400D0807  mov     qword ptr [rbp + 0x168], r14
0001400D080E  mov     rax, qword ptr [rbp + 0x158]
0001400D0815  sub     rax, r14
0001400D0818  cmp     rax, 2
0001400D081C  jbe     0x1400d099c
0001400D0822  movzx   eax, byte ptr [rbp + 0x148]
0001400D0829  mov     r12b, al
0001400D082C  shl     r12d, 4
0001400D0830  add     r15, r12
0001400D0833  mov     rax, qword ptr [rbp + 0x160]
0001400D083A  movzx   edx, byte ptr [rbp + 0x154]
0001400D0841  mov     byte ptr [rax + r14], dl
0001400D0845  movzx   edx, byte ptr [rbp + 0x140]
0001400D084C  mov     byte ptr [rax + r14 + 1], dl
0001400D0851  movzx   edx, byte ptr [rbp + 0x78]
0001400D0855  mov     byte ptr [rax + r14 + 2], dl
0001400D085A  add     r14, 3
0001400D085E  mov     qword ptr [rbp + 0x168], r14
0001400D0865  mov     rax, qword ptr [rbp]
0001400D0869  xor     r12d, r12d
0001400D086C  cmp     r15, rax
0001400D086F  setne   byte ptr [rbp + 0x148]
0001400D0876  jne     0x1400d0650
0001400D087C  jmp     0x1400d09cb
0001400D0881  mov     qword ptr [rsp + 0x20], 1
0001400D088A  mov     r8d, 2
0001400D0890  mov     r9d, 1
0001400D0896  mov     rdx, r14
0001400D0899  call    0x1402cc040
0001400D089E  mov     r14, qword ptr [rbp + 0x168]
0001400D08A5  lea     rcx, [rbp + 0x158]
0001400D08AC  jmp     0x1400d06d6
0001400D08B1  mov     qword ptr [rsp + 0x20], 1
0001400D08BA  mov     r8d, 2
0001400D08C0  mov     r9d, 1
0001400D08C6  mov     rbx, rcx
0001400D08C9  mov     rdx, r14
0001400D08CC  call    0x1402cc040
0001400D08D1  mov     r14, qword ptr [rbp + 0x168]
0001400D08D8  mov     rcx, rbx
0001400D08DB  jmp     0x1400d0710
0001400D08E0  mov     qword ptr [rsp + 0x20], 1
0001400D08E9  mov     r8d, 2
0001400D08EF  mov     r9d, 1
0001400D08F5  mov     rdi, rcx
0001400D08F8  mov     rdx, r14
0001400D08FB  call    0x1402cc040
0001400D0900  mov     r14, qword ptr [rbp + 0x168]
0001400D0907  mov     rcx, rdi
0001400D090A  jmp     0x1400d073b
0001400D090F  mov     qword ptr [rsp + 0x20], 1
0001400D0918  mov     r8d, 2
0001400D091E  mov     r9d, 1
0001400D0924  mov     rsi, rcx
0001400D0927  mov     rdx, r14
0001400D092A  call    0x1402cc040
0001400D092F  mov     r14, qword ptr [rbp + 0x168]
0001400D0936  mov     rcx, rsi
0001400D0939  jmp     0x1400d0775
0001400D093E  mov     qword ptr [rsp + 0x20], 1
0001400D0947  mov     r8d, 3
0001400D094D  mov     r9d, 1
0001400D0953  mov     rsi, rcx
0001400D0956  mov     rdx, r14
0001400D0959  call    0x1402cc040
0001400D095E  mov     r14, qword ptr [rbp + 0x168]
0001400D0965  mov     rcx, rsi
0001400D0968  jmp     0x1400d07a7
0001400D096D  mov     qword ptr [rsp + 0x20], 1
0001400D0976  mov     r8d, 2
0001400D097C  mov     r9d, 1
0001400D0982  mov     rsi, rcx
0001400D0985  mov     rdx, r14
0001400D0988  call    0x1402cc040
0001400D098D  mov     r14, qword ptr [rbp + 0x168]
0001400D0994  mov     rcx, rsi
0001400D0997  jmp     0x1400d07f0
0001400D099C  mov     qword ptr [rsp + 0x20], 1
0001400D09A5  mov     r8d, 3
0001400D09AB  mov     r9d, 1
0001400D09B1  mov     rsi, rcx
0001400D09B4  mov     rdx, r14
0001400D09B7  call    0x1402cc040
0001400D09BC  mov     r14, qword ptr [rbp + 0x168]
0001400D09C3  mov     rcx, rsi
0001400D09C6  jmp     0x1400d0822
0001400D09CB  mov     rax, qword ptr [rbp + 0x158]
0001400D09D2  sub     rax, r14
0001400D09D5  cmp     rax, 3
0001400D09D9  jbe     0x1400d0f0d
0001400D09DF  mov     rax, qword ptr [rbp + 0x160]
0001400D09E6  mov     rcx, qword ptr [rbp + 0x60]
0001400D09EA  mov     dword ptr [rax + r14], ecx
0001400D09EE  add     r14, 4
0001400D09F2  mov     qword ptr [rbp + 0x168], r14
0001400D09F9  mov     rax, qword ptr [rbp + 0x158]
0001400D0A00  sub     rax, r14
0001400D0A03  cmp     rcx, rax
0001400D0A06  ja      0x1400d0f3d
0001400D0A0C  mov     rcx, qword ptr [rbp + 0x160]
0001400D0A13  add     rcx, r14
0001400D0A16  mov     rdx, qword ptr [rbp + 0x88]
0001400D0A1D  mov     rsi, qword ptr [rbp + 0x60]
0001400D0A21  mov     r8, rsi
0001400D0A24  call    0x1402cb3f0
0001400D0A29  add     r14, rsi
0001400D0A2C  mov     qword ptr [rbp + 0x168], r14
0001400D0A33  mov     rax, qword ptr [rbp + 0x158]
0001400D0A3A  sub     rax, r14
0001400D0A3D  cmp     rax, 3
0001400D0A41  jbe     0x1400d0f6b
0001400D0A47  mov     rax, qword ptr [rbp + 0x160]
0001400D0A4E  mov     rcx, qword ptr [rbp + 0x68]
0001400D0A52  mov     dword ptr [rax + r14], ecx
0001400D0A56  add     r14, 4
0001400D0A5A  mov     qword ptr [rbp + 0x168], r14
0001400D0A61  mov     rax, qword ptr [rbp + 0x158]
0001400D0A68  sub     rax, r14
0001400D0A6B  cmp     rcx, rax
0001400D0A6E  ja      0x1400d0f9b
0001400D0A74  mov     rcx, qword ptr [rbp + 0x160]
0001400D0A7B  add     rcx, r14
0001400D0A7E  mov     rdx, qword ptr [rbp + 0x90]
0001400D0A85  mov     rsi, qword ptr [rbp + 0x68]
0001400D0A89  mov     r8, rsi
0001400D0A8C  call    0x1402cb3f0
0001400D0A91  add     r14, rsi
0001400D0A94  mov     qword ptr [rbp + 0x168], r14
0001400D0A9B  mov     r8, qword ptr [rbp + 0x160]
0001400D0AA2  mov     rcx, qword ptr [rbp + 0x10]
0001400D0AA6  mov     rdx, qword ptr [rbp + 8]
0001400D0AAA  mov     r9, r14
0001400D0AAD  call    0x1400a60c0
0001400D0AB2  mov     rsi, rax
0001400D0AB5  mov     rdx, qword ptr [rbp + 0xd0]
0001400D0ABC  test    rdx, rdx
0001400D0ABF  je      0x1400d0ad0
0001400D0AC1  mov     r8d, 1
0001400D0AC7  mov     rcx, qword ptr [rbp + 0x38]
0001400D0ACB  call    0x1400549f0
0001400D0AD0  mov     rdx, qword ptr [rbp + 0x70]
0001400D0AD4  test    rdx, rdx
0001400D0AD7  je      0x1400d0aeb
0001400D0AD9  mov     r8d, 1
0001400D0ADF  mov     rcx, qword ptr [rbp + 0xc8]
0001400D0AE6  call    0x1400549f0
0001400D0AEB  mov     rdx, qword ptr [rbp + 0x158]
0001400D0AF2  test    rdx, rdx
0001400D0AF5  je      0x1400d0b09
0001400D0AF7  mov     rcx, qword ptr [rbp + 0x160]
0001400D0AFE  mov     r8d, 1
0001400D0B04  call    0x1400549f0
0001400D0B09  mov     rdx, qword ptr [rbp + 0x98]
0001400D0B10  test    rdx, rdx
0001400D0B13  je      0x1400d0b27
0001400D0B15  mov     r8d, 1
0001400D0B1B  mov     rcx, qword ptr [rbp + 0x90]
0001400D0B22  call    0x1400549f0
0001400D0B27  mov     rdx, qword ptr [rbp + 0x80]
0001400D0B2E  test    rdx, rdx
0001400D0B31  je      0x1400d0b45
0001400D0B33  mov     r8d, 1
0001400D0B39  mov     rcx, qword ptr [rbp + 0x88]
0001400D0B40  call    0x1400549f0
0001400D0B45  mov     rdx, qword ptr [rbp + 0xc0]
0001400D0B4C  test    rdx, rdx
0001400D0B4F  je      0x1400d0b67
0001400D0B51  shl     rdx, 4
0001400D0B55  mov     r8d, 2
0001400D0B5B  mov     rcx, qword ptr [rbp + 0xb8]
0001400D0B62  call    0x1400549f0
0001400D0B67  mov     rdi, qword ptr [rbp + 0x48]
0001400D0B6B  mov     rbx, qword ptr [rbp + 0x50]
0001400D0B6F  test    rbx, rbx
0001400D0B72  je      0x1400d0bbd
0001400D0B74  lea     r14, [rdi + 0x28]
0001400D0B78  jmp     0x1400d0b89
0001400D0B7A  nop     word ptr [rax + rax]
0001400D0B80  add     r14, 0x58
0001400D0B84  dec     rbx
0001400D0B87  je      0x1400d0bbd
0001400D0B89  mov     rdx, qword ptr [r14 - 0x20]
0001400D0B8D  test    rdx, rdx
0001400D0B90  je      0x1400d0ba1
0001400D0B92  mov     rcx, qword ptr [r14 - 0x18]
0001400D0B96  mov     r8d, 1
0001400D0B9C  call    0x1400549f0
0001400D0BA1  mov     rdx, qword ptr [r14 - 8]
0001400D0BA5  test    rdx, rdx
0001400D0BA8  je      0x1400d0b80
0001400D0BAA  mov     rcx, qword ptr [r14]
0001400D0BAD  add     rdx, rdx
0001400D0BB0  mov     r8d, 1
0001400D0BB6  call    0x1400549f0
0001400D0BBB  jmp     0x1400d0b80
0001400D0BBD  mov     rax, qword ptr [rbp + 0x40]
0001400D0BC1  test    rax, rax
0001400D0BC4  je      0x1400d0bd8
0001400D0BC6  imul    rdx, rax, 0x58
0001400D0BCA  mov     r8d, 8
0001400D0BD0  mov     rcx, rdi
0001400D0BD3  call    0x1400549f0
0001400D0BD8  mov     rax, rsi
0001400D0BDB  add     rsp, 0x1f8
0001400D0BE2  pop     rbx
0001400D0BE3  pop     rdi
0001400D0BE4  pop     rsi
0001400D0BE5  pop     r12
0001400D0BE7  pop     r13
0001400D0BE9  pop     r14
0001400D0BEB  pop     r15
0001400D0BED  pop     rbp
0001400D0BEE  ret     
0001400D0BEF  mov     byte ptr [rbp + 0x120], 1
0001400D0BF6  lea     rax, [rbp + 0x120]
0001400D0BFD  mov     qword ptr [rbp + 0xd0], rax
0001400D0C04  lea     rax, [rip + 0x27bdd5]   ; [rip -> 0x14034C9E0]
0001400D0C0B  mov     qword ptr [rsp + 0x20], rax
0001400D0C10  lea     rcx, [rip + 0x5713e9]   ; [rip -> 0x140642000]
0001400D0C17  lea     r9, [rip + 0x22646a]   ; [rip -> 0x1402F7088]
0001400D0C1E  lea     r8, [rbp + 0xd0]
0001400D0C25  xor     edx, edx
0001400D0C27  call    0x1402d37a0
0001400D0C2C  jmp     0x1400cf832
0001400D0C31  lea     rcx, [rip + 0x5714b8]   ; [rip -> 0x1406420F0]
0001400D0C38  call    0x1402d1c80
0001400D0C3D  jmp     0x1400cf8ec
0001400D0C42  lea     rcx, [rip + 0x5714a7]   ; [rip -> 0x1406420F0]
0001400D0C49  call    0x1402d1c80
0001400D0C4E  jmp     0x1400cf95f
0001400D0C53  mov     qword ptr [rsp + 0x20], 1
0001400D0C5C  lea     rcx, [rbp + 0x158]
0001400D0C63  mov     r8d, 2
0001400D0C69  mov     r9d, 1
0001400D0C6F  mov     rdx, r15
0001400D0C72  call    0x1402cc040
0001400D0C77  mov     r15, qword ptr [rbp + 0x168]
0001400D0C7E  jmp     0x1400cfcf7
0001400D0C83  mov     qword ptr [rsp + 0x20], 1
0001400D0C8C  lea     rcx, [rbp + 0x158]
0001400D0C93  mov     r9d, 1
0001400D0C99  mov     rdx, r15
0001400D0C9C  mov     r8, r13
0001400D0C9F  call    0x1402cc040
0001400D0CA4  mov     r15, qword ptr [rbp + 0x168]
0001400D0CAB  jmp     0x1400cfd21
0001400D0CB0  mov     qword ptr [rsp + 0x20], 1
0001400D0CB9  lea     rcx, [rbp + 0x158]
0001400D0CC0  mov     r8d, 2
0001400D0CC6  mov     r9d, 1
0001400D0CCC  mov     rdx, r13
0001400D0CCF  call    0x1402cc040
0001400D0CD4  mov     r13, qword ptr [rbp + 0x168]
0001400D0CDB  jmp     0x1400d02e3
0001400D0CE0  mov     qword ptr [rsp + 0x20], 1
0001400D0CE9  lea     rcx, [rbp + 0x158]
0001400D0CF0  mov     r9d, 1
0001400D0CF6  mov     rdx, r13
0001400D0CF9  mov     r8, r14
0001400D0CFC  call    0x1402cc040
0001400D0D01  mov     r13, qword ptr [rbp + 0x168]
0001400D0D08  jmp     0x1400d030d
0001400D0D0D  mov     qword ptr [rsp + 0x20], 1
0001400D0D16  lea     rcx, [rbp + 0x158]
0001400D0D1D  mov     r8d, 8
0001400D0D23  mov     r9d, 1
0001400D0D29  mov     rdx, r13
0001400D0D2C  call    0x1402cc040
0001400D0D31  mov     r13, qword ptr [rbp + 0x168]
0001400D0D38  jmp     0x1400d0344
0001400D0D3D  mov     qword ptr [rsp + 0x20], 1
0001400D0D46  lea     rcx, [rbp + 0x158]
0001400D0D4D  mov     r8d, 8
0001400D0D53  mov     r9d, 1
0001400D0D59  mov     rdx, r14
0001400D0D5C  call    0x1402cc040
0001400D0D61  mov     r14, qword ptr [rbp + 0x168]
0001400D0D68  mov     rcx, qword ptr [rbp + 0x148]
0001400D0D6F  jmp     0x1400d03c7
0001400D0D74  mov     qword ptr [rsp + 0x20], 1
0001400D0D7D  lea     rcx, [rbp + 0x158]
0001400D0D84  mov     r8d, 2
0001400D0D8A  mov     r9d, 1
0001400D0D90  mov     rdx, r14
0001400D0D93  call    0x1402cc040
0001400D0D98  mov     r14, qword ptr [rbp + 0x168]
0001400D0D9F  mov     rcx, qword ptr [rbp + 0x148]
0001400D0DA6  jmp     0x1400d03f8
0001400D0DAB  mov     qword ptr [rsp + 0x20], 1
0001400D0DB4  lea     rcx, [rbp + 0x158]
0001400D0DBB  mov     r8d, 4
0001400D0DC1  mov     r9d, 1
0001400D0DC7  mov     rdx, r14
0001400D0DCA  call    0x1402cc040
0001400D0DCF  mov     r14, qword ptr [rbp + 0x168]
0001400D0DD6  mov     rcx, qword ptr [rbp + 0x148]
0001400D0DDD  jmp     0x1400d0429
0001400D0DE2  mov     qword ptr [rsp + 0x20], 1
0001400D0DEB  lea     rcx, [rbp + 0x158]
0001400D0DF2  mov     r8d, 4
0001400D0DF8  mov     r9d, 1
0001400D0DFE  mov     rdx, r14
0001400D0E01  call    0x1402cc040
0001400D0E06  mov     r14, qword ptr [rbp + 0x168]
0001400D0E0D  mov     rcx, qword ptr [rbp + 0x148]
0001400D0E14  jmp     0x1400d0459
0001400D0E19  mov     qword ptr [rsp + 0x20], 1
0001400D0E22  lea     rcx, [rbp + 0x158]
0001400D0E29  mov     r8d, 2
0001400D0E2F  mov     r9d, 1
0001400D0E35  mov     rdx, r14
0001400D0E38  call    0x1402cc040
0001400D0E3D  mov     rsi, qword ptr [rbp + 0x148]
0001400D0E44  mov     r14, qword ptr [rbp + 0x168]
0001400D0E4B  jmp     0x1400d0535
0001400D0E50  mov     qword ptr [rsp + 0x20], 1
0001400D0E59  lea     rcx, [rbp + 0x158]
0001400D0E60  mov     r8d, 2
0001400D0E66  mov     r9d, 1
0001400D0E6C  mov     rdx, r14
0001400D0E6F  call    0x1402cc040
0001400D0E74  mov     r14, qword ptr [rbp + 0x168]
0001400D0E7B  jmp     0x1400d0562
0001400D0E80  mov     qword ptr [rsp + 0x20], 1
0001400D0E89  lea     rcx, [rbp + 0x158]
0001400D0E90  mov     r8d, 4
0001400D0E96  mov     r9d, 1
0001400D0E9C  mov     rdx, r14
0001400D0E9F  call    0x1402cc040
0001400D0EA4  mov     r14, qword ptr [rbp + 0x168]
0001400D0EAB  jmp     0x1400d0596
0001400D0EB0  mov     qword ptr [rsp + 0x20], 1
0001400D0EB9  lea     rcx, [rbp + 0x158]
0001400D0EC0  mov     r9d, 1
0001400D0EC6  mov     rdx, r14
0001400D0EC9  mov     r8, r15
0001400D0ECC  call    0x1402cc040
0001400D0ED1  mov     r14, qword ptr [rbp + 0x168]
0001400D0ED8  jmp     0x1400d05ca
0001400D0EDD  mov     qword ptr [rsp + 0x20], 1
0001400D0EE6  lea     rcx, [rbp + 0x158]
0001400D0EED  mov     r8d, 4
0001400D0EF3  mov     r9d, 1
0001400D0EF9  mov     rdx, r14
0001400D0EFC  call    0x1402cc040
0001400D0F01  mov     r14, qword ptr [rbp + 0x168]
0001400D0F08  jmp     0x1400d0601
0001400D0F0D  mov     qword ptr [rsp + 0x20], 1
0001400D0F16  lea     rcx, [rbp + 0x158]
0001400D0F1D  mov     r8d, 4
0001400D0F23  mov     r9d, 1
0001400D0F29  mov     rdx, r14
0001400D0F2C  call    0x1402cc040
0001400D0F31  mov     r14, qword ptr [rbp + 0x168]
0001400D0F38  jmp     0x1400d09df
0001400D0F3D  mov     qword ptr [rsp + 0x20], 1
0001400D0F46  lea     rcx, [rbp + 0x158]
0001400D0F4D  mov     r9d, 1
0001400D0F53  mov     rdx, r14
0001400D0F56  mov     r8, qword ptr [rbp + 0x60]
0001400D0F5A  call    0x1402cc040
0001400D0F5F  mov     r14, qword ptr [rbp + 0x168]
0001400D0F66  jmp     0x1400d0a0c
0001400D0F6B  mov     qword ptr [rsp + 0x20], 1
0001400D0F74  lea     rcx, [rbp + 0x158]
0001400D0F7B  mov     r8d, 4
0001400D0F81  mov     r9d, 1
0001400D0F87  mov     rdx, r14
0001400D0F8A  call    0x1402cc040
0001400D0F8F  mov     r14, qword ptr [rbp + 0x168]
0001400D0F96  jmp     0x1400d0a47
0001400D0F9B  mov     qword ptr [rsp + 0x20], 1
0001400D0FA4  lea     rcx, [rbp + 0x158]
0001400D0FAB  mov     r9d, 1
0001400D0FB1  mov     rdx, r14
0001400D0FB4  mov     r8, qword ptr [rbp + 0x68]
0001400D0FB8  call    0x1402cc040
0001400D0FBD  mov     r14, qword ptr [rbp + 0x168]
0001400D0FC4  jmp     0x1400d0a74
0001400D0FC9  mov     qword ptr [rbp + 0x140], rdi
0001400D0FD0  mov     qword ptr [rsp + 0x20], 1
0001400D0FD9  lea     rcx, [rbp + 0xa0]
0001400D0FE0  mov     r9d, 1
0001400D0FE6  mov     rdx, r15
0001400D0FE9  mov     r8, r14
0001400D0FEC  call    0x1402cc040
0001400D0FF1  mov     r15, qword ptr [rbp + 0xb0]
0001400D0FF8  mov     rdi, qword ptr [rbp + 0x140]
0001400D0FFF  jmp     0x1400d015f
0001400D1004  mov     qword ptr [rbp + 0x140], rsi
0001400D100B  mov     qword ptr [rsp + 0x20], 1
0001400D1014  lea     rcx, [rbp + 0xa0]
0001400D101B  mov     r9d, 1
0001400D1021  mov     rdx, r14
0001400D1024  mov     r8, r15
0001400D1027  call    0x1402cc040
0001400D102C  mov     r14, qword ptr [rbp + 0xb0]
0001400D1033  mov     rsi, qword ptr [rbp + 0x140]
0001400D103A  jmp     0x1400d0251
0001400D103F  mov     ecx, 1
0001400D1044  mov     edx, 0x15
0001400D1049  call    0x1402d4831
0001400D104E  jmp     0x1400d105f
0001400D1050  mov     ecx, 1
0001400D1055  mov     edx, 0x18
0001400D105A  call    0x1402d4831
0001400D105F  ud2     
0001400D1061  nop     word ptr cs:[rax + rax]
