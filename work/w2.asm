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
0001400CF824  mov     eax, dword ptr [rip + 0x5727d6]   ; [rip+0x5727D6 -> 0x140642000]
0001400CF82A  test    eax, eax
0001400CF82C  jne     0x1400d0bef
0001400CF832  mov     rax, qword ptr [rip + 0x5728b7]   ; [rip+0x5728B7 -> 0x1406420F0]
0001400CF839  mov     ecx, eax
0001400CF83B  and     ecx, 8
0001400CF83E  shr     ecx, 3
0001400CF841  cmp     rax, -0x10
0001400CF845  setae   dl
0001400CF848  or      dl, cl
0001400CF84A  je      0x1400cf862
0001400CF84C  lea     rcx, [rip + 0x57289d]   ; [rip+0x57289D -> 0x1406420F0]
0001400CF853  xor     edx, edx
0001400CF855  mov     r9d, 0x3b9aca00
0001400CF85B  call    0x1402d1400
0001400CF860  jmp     0x1400cf871
0001400CF862  lea     rcx, [rax + 0x10]
0001400CF866  lock cmpxchg qword ptr [rip + 0x572881], rcx   ; [rip+0x572881 -> 0x1406420F0]
0001400CF86F  jne     0x1400cf84c
0001400CF871  mov     rax, qword ptr [rip + 0x572888]   ; [rip+0x572888 -> 0x140642100]
0001400CF878  mov     rcx, qword ptr [rip + 0x572889]   ; [rip+0x572889 -> 0x140642108]
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
0001400CF8D5  lock xadd qword ptr [rip + 0x572812], rax   ; [rip+0x572812 -> 0x1406420F0]
0001400CF8DE  and     rax, 0xfffffffffffffff2
0001400CF8E2  cmp     rax, 0x12
0001400CF8E6  je      0x1400d0c31
0001400CF8EC  mov     rax, qword ptr [rip + 0x5727fd]   ; [rip+0x5727FD -> 0x1406420F0]
0001400CF8F3  mov     ecx, eax
0001400CF8F5  and     ecx, 8
0001400CF8F8  shr     ecx, 3
0001400CF8FB  cmp     rax, -0x10
0001400CF8FF  setae   dl
0001400CF902  or      dl, cl
0001400CF904  je      0x1400cf91c
0001400CF906  lea     rcx, [rip + 0x5727e3]   ; [rip+0x5727E3 -> 0x1406420F0]
0001400CF90D  xor     edx, edx
0001400CF90F  mov     r9d, 0x3b9aca00
0001400CF915  call    0x1402d1400
0001400CF91A  jmp     0x1400cf92b
0001400CF91C  lea     rcx, [rax + 0x10]
0001400CF920  lock cmpxchg qword ptr [rip + 0x5727c7], rcx   ; [rip+0x5727C7 -> 0x1406420F0]
0001400CF929  jne     0x1400cf906
0001400CF92B  mov     rax, qword ptr [rip + 0x5727d6]   ; [rip+0x5727D6 -> 0x140642108]
0001400CF932  cmp     rax, 0xff
0001400CF938  mov     esi, 0xff
0001400CF93D  cmovb   rsi, rax
0001400CF941  mov     rax, 0xfffffffffffffff0
0001400CF948  lock xadd qword ptr [rip + 0x57279f], rax   ; [rip+0x57279F -> 0x1406420F0]
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
0001400CFB3C  movdqu  xmm0, xmmword ptr [rip + 0x282274]   ; [rip+0x282274 -> 0x140351DB8] str='save name is too long'
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
0001400CFD6B  movdqu  xmm0, xmmword ptr [rip + 0x22911f]   ; [rip+0x22911F -> 0x1402F8E92]
0001400CFD73  movdqu  xmmword ptr [rax], xmm0
0001400CFD77  movabs  rcx, 0x64656b636f6c6e75
0001400CFD81  mov     qword ptr [rbp + 0xc8], rax
0001400CFD88  mov     qword ptr [rax + 0x10], rcx
0001400CFD8C  mov     r14d, 0x18
0001400CFD92  jmp     0x1400d02c4
0001400CFD97  xor     esi, esi
0001400CFD99  lea     r14, [rip + 0x572264]   ; [rip+0x572264 -> 0x140642004]
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
0001400CFDCB  mov     eax, dword ptr [rip + 0x572233]   ; [rip+0x572233 -> 0x140642004]
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
0001400CFE2B  mov     eax, dword ptr [rip + 0x5721d3]   ; [rip+0x5721D3 -> 0x140642004]
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
