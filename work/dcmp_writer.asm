0001402CF200  push    rbp
0001402CF201  push    r15
0001402CF203  push    r14
0001402CF205  push    r13
0001402CF207  push    r12
0001402CF209  push    rsi
0001402CF20A  push    rdi
0001402CF20B  push    rbx
0001402CF20C  sub     rsp, 0x88
0001402CF213  lea     rbp, [rsp + 0x80]
0001402CF21B  mov     qword ptr [rbp], 0xfffffffffffffffe
0001402CF223  mov     rdi, r8
0001402CF226  mov     rsi, rdx
0001402CF229  mov     qword ptr [rbp - 0x38], rcx
0001402CF22D  mov     byte ptr [rbp - 0x21], r9b
0001402CF231  test    r9b, r9b
0001402CF234  je      0x1402cf2a6
0001402CF236  call    0x140007ed0
0001402CF23B  mov     ecx, 5
0001402CF240  mov     edx, 1
0001402CF245  call    0x1400549e0
0001402CF24A  test    rax, rax
0001402CF24D  je      0x1402cfafc
0001402CF253  mov     qword ptr [rbp - 0x18], 5
0001402CF25B  mov     qword ptr [rbp - 0x10], rax
0001402CF25F  mov     byte ptr [rax + 4], 2
0001402CF263  mov     dword ptr [rax], 0x504d4344
0001402CF269  mov     qword ptr [rbp - 8], 5
0001402CF271  mov     qword ptr [rsp + 0x20], 1
0001402CF27A  lea     rcx, [rbp - 0x18]
0001402CF27E  mov     edx, 5
0001402CF283  mov     r8d, 4
0001402CF289  mov     r9d, 1
0001402CF28F  call    0x1402cc040
0001402CF294  mov     rax, qword ptr [rbp - 0x10]
0001402CF298  mov     r14, qword ptr [rbp - 8]
0001402CF29C  mov     dword ptr [rax + r14], edi
0001402CF2A0  add     r14, 4
0001402CF2A4  jmp     0x1402cf315
0001402CF2A6  call    0x140007ed0
0001402CF2AB  mov     ecx, 5
0001402CF2B0  mov     edx, 1
0001402CF2B5  call    0x1400549e0
0001402CF2BA  test    rax, rax
0001402CF2BD  je      0x1402cfafc
0001402CF2C3  mov     qword ptr [rbp - 0x18], 5
0001402CF2CB  mov     qword ptr [rbp - 0x10], rax
0001402CF2CF  mov     byte ptr [rax + 4], 1
0001402CF2D3  mov     dword ptr [rax], 0x504d4344
0001402CF2D9  mov     qword ptr [rbp - 8], 5
0001402CF2E1  mov     qword ptr [rsp + 0x20], 1
0001402CF2EA  lea     rcx, [rbp - 0x18]
0001402CF2EE  mov     edx, 5
0001402CF2F3  mov     r8d, 2
0001402CF2F9  mov     r9d, 1
0001402CF2FF  call    0x1402cc040
0001402CF304  mov     rax, qword ptr [rbp - 0x10]
0001402CF308  mov     r14, qword ptr [rbp - 8]
0001402CF30C  mov     word ptr [rax + r14], di
0001402CF311  add     r14, 2
0001402CF315  mov     qword ptr [rbp - 8], r14
0001402CF319  imul    rax, rdi, 0x58
0001402CF31D  add     rax, rsi
0001402CF320  mov     qword ptr [rbp - 0x58], rax
0001402CF324  lea     rax, [rsi + 0x58]
0001402CF328  cmp     rsi, qword ptr [rbp - 0x58]
0001402CF32C  cmove   rax, rsi
0001402CF330  je      0x1402cfa78
0001402CF336  nop     word ptr cs:[rax + rax]
0001402CF340  mov     qword ptr [rbp - 0x30], rax
0001402CF344  mov     rax, qword ptr [rsi + 0x18]
0001402CF348  mov     rcx, 0xfffffffffffffdff
0001402CF34F  add     rax, rcx
0001402CF352  cmp     rax, -0x200
0001402CF358  jb      0x1402cf9ed
0001402CF35E  cmp     qword ptr [rsi + 0x30], 0x20
0001402CF363  ja      0x1402cf9ed
0001402CF369  mov     qword ptr [rbp - 0x20], rsi
0001402CF36D  movzx   r12d, word ptr [rsi]
0001402CF371  cmp     byte ptr [rbp - 0x21], 0
0001402CF375  je      0x1402cf3a0
0001402CF377  mov     rax, qword ptr [rbp - 0x18]
0001402CF37B  sub     rax, r14
0001402CF37E  cmp     rax, 1
0001402CF382  jbe     0x1402cf945
0001402CF388  mov     rax, qword ptr [rbp - 0x10]
0001402CF38C  mov     word ptr [rax + r14], r12w
0001402CF391  add     r14, 2
0001402CF395  jmp     0x1402cf3c9
0001402CF397  nop     word ptr [rax + rax]
0001402CF3A0  movzx   eax, r12w
0001402CF3A4  cmp     eax, 0xff
0001402CF3A9  ja      0x1402cfa9f
0001402CF3AF  cmp     r14, qword ptr [rbp - 0x18]
0001402CF3B3  jne     0x1402cf3be
0001402CF3B5  lea     rcx, [rbp - 0x18]
0001402CF3B9  call    0x1402d4880
0001402CF3BE  mov     rax, qword ptr [rbp - 0x10]
0001402CF3C2  mov     byte ptr [rax + r14], r12b
0001402CF3C6  inc     r14
0001402CF3C9  mov     qword ptr [rbp - 8], r14
0001402CF3CD  mov     rax, qword ptr [rbp - 0x20]
0001402CF3D1  movzx   esi, word ptr [rax + 0x18]
0001402CF3D5  mov     rax, qword ptr [rbp - 0x18]
0001402CF3D9  sub     rax, r14
0001402CF3DC  cmp     rax, 1
0001402CF3E0  jbe     0x1402cf7f8
0001402CF3E6  mov     rax, qword ptr [rbp - 0x10]
0001402CF3EA  mov     word ptr [rax + r14], si
0001402CF3EF  add     r14, 2
0001402CF3F3  mov     qword ptr [rbp - 8], r14
0001402CF3F7  mov     rax, qword ptr [rbp - 0x20]
0001402CF3FB  mov     r13, qword ptr [rax + 0x10]
0001402CF3FF  mov     r12, qword ptr [rax + 0x18]
0001402CF403  mov     rax, qword ptr [rbp - 0x18]
0001402CF407  sub     rax, r14
0001402CF40A  cmp     r12, rax
0001402CF40D  ja      0x1402cf822
0001402CF413  mov     rcx, qword ptr [rbp - 0x10]
0001402CF417  add     rcx, r14
0001402CF41A  mov     rdx, r13
0001402CF41D  mov     r8, r12
0001402CF420  call    0x1402cb3f0
0001402CF425  add     r14, r12
0001402CF428  mov     qword ptr [rbp - 8], r14
0001402CF42C  mov     rax, qword ptr [rbp - 0x20]
0001402CF430  movzx   ebx, byte ptr [rax + 0x30]
0001402CF434  cmp     r14, qword ptr [rbp - 0x18]
0001402CF438  jne     0x1402cf443
0001402CF43A  lea     rcx, [rbp - 0x18]
0001402CF43E  call    0x1402d4880
0001402CF443  mov     rax, qword ptr [rbp - 0x10]
0001402CF447  mov     byte ptr [rax + r14], bl
0001402CF44B  inc     r14
0001402CF44E  mov     qword ptr [rbp - 8], r14
0001402CF452  mov     rax, qword ptr [rbp - 0x20]
0001402CF456  mov     r12, qword ptr [rax + 0x28]
0001402CF45A  mov     rax, qword ptr [rax + 0x30]
0001402CF45E  lea     r13, [r12 + rax*2]
0001402CF462  xor     esi, esi
0001402CF464  cmp     r12, r13
0001402CF467  setne   r15b
0001402CF46B  je      0x1402cf4e0
0001402CF46D  nop     dword ptr [rax]
0001402CF470  movzx   edi, byte ptr [r12]
0001402CF475  movzx   ebx, byte ptr [r12 + 1]
0001402CF47B  mov     rax, qword ptr [rbp - 0x18]
0001402CF47F  sub     rax, r14
0001402CF482  cmp     rax, 1
0001402CF486  jbe     0x1402cf4b8
0001402CF488  mov     sil, r15b
0001402CF48B  lea     r12, [r12 + rsi*2]
0001402CF48F  mov     rax, qword ptr [rbp - 0x10]
0001402CF493  movzx   ecx, bx
0001402CF496  shl     ecx, 8
0001402CF499  movzx   edx, di
0001402CF49C  or      edx, ecx
0001402CF49E  mov     word ptr [rax + r14], dx
0001402CF4A3  add     r14, 2
0001402CF4A7  mov     qword ptr [rbp - 8], r14
0001402CF4AB  xor     esi, esi
0001402CF4AD  cmp     r12, r13
0001402CF4B0  setne   r15b
0001402CF4B4  jne     0x1402cf470
0001402CF4B6  jmp     0x1402cf4e0
0001402CF4B8  mov     qword ptr [rsp + 0x20], 1
0001402CF4C1  mov     r8d, 2
0001402CF4C7  mov     r9d, 1
0001402CF4CD  lea     rcx, [rbp - 0x18]
0001402CF4D1  mov     rdx, r14
0001402CF4D4  call    0x1402cc040
0001402CF4D9  mov     r14, qword ptr [rbp - 8]
0001402CF4DD  jmp     0x1402cf488
0001402CF4DF  nop     
0001402CF4E0  mov     rax, qword ptr [rbp - 0x20]
0001402CF4E4  movzx   ebx, byte ptr [rax + 0x48]
0001402CF4E8  cmp     r14, qword ptr [rbp - 0x18]
0001402CF4EC  jne     0x1402cf4f7
0001402CF4EE  lea     rcx, [rbp - 0x18]
0001402CF4F2  call    0x1402d4880
0001402CF4F7  mov     rax, qword ptr [rbp - 0x10]
0001402CF4FB  mov     byte ptr [rax + r14], bl
0001402CF4FF  inc     r14
0001402CF502  mov     qword ptr [rbp - 8], r14
0001402CF506  mov     rax, qword ptr [rbp - 0x20]
0001402CF50A  movzx   esi, word ptr [rax + 0x44]
0001402CF50E  mov     rax, qword ptr [rbp - 0x18]
0001402CF512  sub     rax, r14
0001402CF515  cmp     rax, 1
0001402CF519  jbe     0x1402cf849
0001402CF51F  mov     rax, qword ptr [rbp - 0x10]
0001402CF523  mov     word ptr [rax + r14], si
0001402CF528  add     r14, 2
0001402CF52C  mov     qword ptr [rbp - 8], r14
0001402CF530  mov     rax, qword ptr [rbp - 0x20]
0001402CF534  movzx   esi, word ptr [rax + 0x46]
0001402CF538  mov     rax, qword ptr [rbp - 0x18]
0001402CF53C  sub     rax, r14
0001402CF53F  cmp     rax, 1
0001402CF543  jbe     0x1402cf873
0001402CF549  mov     rax, qword ptr [rbp - 0x10]
0001402CF54D  mov     word ptr [rax + r14], si
0001402CF552  add     r14, 2
0001402CF556  mov     qword ptr [rbp - 8], r14
0001402CF55A  mov     rax, qword ptr [rbp - 0x20]
0001402CF55E  mov     esi, dword ptr [rax + 0x40]
0001402CF561  mov     rax, qword ptr [rbp - 0x18]
0001402CF565  sub     rax, r14
0001402CF568  cmp     rax, 3
0001402CF56C  jbe     0x1402cf89d
0001402CF572  mov     rax, qword ptr [rbp - 0x10]
0001402CF576  mov     dword ptr [rax + r14], esi
0001402CF57A  add     r14, 4
0001402CF57E  mov     qword ptr [rbp - 8], r14
0001402CF582  mov     rax, qword ptr [rbp - 0x20]
0001402CF586  movzx   ebx, byte ptr [rax + 0x51]
0001402CF58A  movzx   esi, byte ptr [rax + 0x52]
0001402CF58E  movzx   edi, byte ptr [rax + 0x53]
0001402CF592  mov     rax, qword ptr [rbp - 0x18]
0001402CF596  sub     rax, r14
0001402CF599  cmp     rax, 2
0001402CF59D  jbe     0x1402cf8c7
0001402CF5A3  mov     rax, qword ptr [rbp - 0x10]
0001402CF5A7  mov     byte ptr [rax + r14], bl
0001402CF5AB  mov     byte ptr [rax + r14 + 1], sil
0001402CF5B0  mov     byte ptr [rax + r14 + 2], dil
0001402CF5B5  add     r14, 3
0001402CF5B9  mov     qword ptr [rbp - 8], r14
0001402CF5BD  mov     rax, qword ptr [rbp - 0x20]
0001402CF5C1  movzx   esi, word ptr [rax + 0x4c]
0001402CF5C5  mov     rax, qword ptr [rbp - 0x18]
0001402CF5C9  sub     rax, r14
0001402CF5CC  cmp     rax, 1
0001402CF5D0  jbe     0x1402cf8f1
0001402CF5D6  mov     rax, qword ptr [rbp - 0x10]
0001402CF5DA  mov     word ptr [rax + r14], si
0001402CF5DF  add     r14, 2
0001402CF5E3  mov     qword ptr [rbp - 8], r14
0001402CF5E7  mov     rax, qword ptr [rbp - 0x20]
0001402CF5EB  movzx   esi, word ptr [rax + 0x4e]
0001402CF5EF  mov     rax, qword ptr [rbp - 0x18]
0001402CF5F3  sub     rax, r14
0001402CF5F6  cmp     rax, 1
0001402CF5FA  jbe     0x1402cf91b
0001402CF600  mov     rax, qword ptr [rbp - 0x10]
0001402CF604  mov     word ptr [rax + r14], si
0001402CF609  lea     rax, [r14 + 2]
0001402CF60D  mov     qword ptr [rbp - 8], rax
0001402CF611  mov     rcx, qword ptr [rbp - 0x20]
0001402CF615  movzx   ebx, byte ptr [rcx + 0x38]
0001402CF619  cmp     rax, qword ptr [rbp - 0x18]
0001402CF61D  jne     0x1402cf628
0001402CF61F  lea     rcx, [rbp - 0x18]
0001402CF623  call    0x1402d4880
0001402CF628  mov     rax, qword ptr [rbp - 0x10]
0001402CF62C  mov     byte ptr [rax + r14 + 2], bl
0001402CF631  add     r14, 3
0001402CF635  mov     qword ptr [rbp - 8], r14
0001402CF639  mov     rax, qword ptr [rbp - 0x20]
0001402CF63D  cmp     byte ptr [rax + 0x38], 1
0001402CF641  jne     0x1402cf66d
0001402CF643  movzx   esi, word ptr [rax + 0x3a]
0001402CF647  mov     rax, qword ptr [rbp - 0x18]
0001402CF64B  sub     rax, r14
0001402CF64E  cmp     rax, 1
0001402CF652  jbe     0x1402cf96f
0001402CF658  mov     rax, qword ptr [rbp - 0x10]
0001402CF65C  mov     word ptr [rax + r14], si
0001402CF661  add     r14, 2
0001402CF665  mov     qword ptr [rbp - 8], r14
0001402CF669  mov     rax, qword ptr [rbp - 0x20]
0001402CF66D  movzx   ebx, byte ptr [rax + 0x3c]
0001402CF671  cmp     r14, qword ptr [rbp - 0x18]
0001402CF675  jne     0x1402cf680
0001402CF677  lea     rcx, [rbp - 0x18]
0001402CF67B  call    0x1402d4880
0001402CF680  mov     rax, qword ptr [rbp - 0x10]
0001402CF684  mov     byte ptr [rax + r14], bl
0001402CF688  inc     r14
0001402CF68B  mov     qword ptr [rbp - 8], r14
0001402CF68F  mov     rax, qword ptr [rbp - 0x20]
0001402CF693  cmp     byte ptr [rax + 0x3c], 1
0001402CF697  jne     0x1402cf6d4
0001402CF699  movzx   ebx, byte ptr [rax + 0x3d]
0001402CF69D  movzx   esi, byte ptr [rax + 0x3e]
0001402CF6A1  movzx   edi, byte ptr [rax + 0x3f]
0001402CF6A5  mov     rax, qword ptr [rbp - 0x18]
0001402CF6A9  sub     rax, r14
0001402CF6AC  cmp     rax, 2
0001402CF6B0  jbe     0x1402cf999
0001402CF6B6  mov     rax, qword ptr [rbp - 0x10]
0001402CF6BA  mov     byte ptr [rax + r14], bl
0001402CF6BE  mov     byte ptr [rax + r14 + 1], sil
0001402CF6C3  mov     byte ptr [rax + r14 + 2], dil
0001402CF6C8  add     r14, 3
0001402CF6CC  mov     qword ptr [rbp - 8], r14
0001402CF6D0  mov     rax, qword ptr [rbp - 0x20]
0001402CF6D4  movzx   eax, byte ptr [rax + 0x50]
0001402CF6D8  movzx   r15d, ax
0001402CF6DC  cmp     r15d, 0x92
0001402CF6E3  jne     0x1402cf720
0001402CF6E5  cmp     r14, qword ptr [rbp - 0x18]
0001402CF6E9  jne     0x1402cf6f4
0001402CF6EB  lea     rcx, [rbp - 0x18]
0001402CF6EF  call    0x1402d4880
0001402CF6F4  mov     rax, qword ptr [rbp - 0x10]
0001402CF6F8  mov     byte ptr [rax + r14], 0
0001402CF6FD  inc     r14
0001402CF700  mov     qword ptr [rbp - 8], r14
0001402CF704  mov     rsi, qword ptr [rbp - 0x30]
0001402CF708  lea     rax, [rsi + 0x58]
0001402CF70C  cmp     rsi, qword ptr [rbp - 0x58]
0001402CF710  cmove   rax, rsi
0001402CF714  jne     0x1402cf340
0001402CF71A  jmp     0x1402cfa78
0001402CF71F  nop     
0001402CF720  sub     al, 0x8c
0001402CF722  movzx   eax, al
0001402CF725  mov     ecx, 0
0001402CF72A  cmovb   eax, ecx
0001402CF72D  movzx   eax, al
0001402CF730  lea     rcx, [rip + 0x916f5]   ; [rip -> 0x140360E2C]
0001402CF737  movsxd  rax, dword ptr [rcx + rax*4]
0001402CF73B  add     rax, rcx
0001402CF73E  jmp     rax
0001402CF740  mov     rax, qword ptr [rbp - 0x18]
0001402CF744  sub     rax, r14
0001402CF747  cmp     rax, 1
0001402CF74B  jbe     0x1402cf9c3
0001402CF751  mov     rax, qword ptr [rbp - 0x10]
0001402CF755  shl     r15d, 8
0001402CF759  inc     r15d
0001402CF75C  mov     word ptr [rax + r14], r15w
0001402CF761  add     r14, 2
0001402CF765  jmp     0x1402cf700
0001402CF767  cmp     r14, qword ptr [rbp - 0x18]
0001402CF76B  jne     0x1402cf776
0001402CF76D  lea     rcx, [rbp - 0x18]
0001402CF771  call    0x1402d4880
0001402CF776  mov     rax, qword ptr [rbp - 0x10]
0001402CF77A  mov     byte ptr [rax + r14], 5
0001402CF77F  jmp     0x1402cf6fd
0001402CF784  cmp     r14, qword ptr [rbp - 0x18]
0001402CF788  jne     0x1402cf793
0001402CF78A  lea     rcx, [rbp - 0x18]
0001402CF78E  call    0x1402d4880
0001402CF793  mov     rax, qword ptr [rbp - 0x10]
0001402CF797  mov     byte ptr [rax + r14], 3
0001402CF79C  jmp     0x1402cf6fd
0001402CF7A1  cmp     r14, qword ptr [rbp - 0x18]
0001402CF7A5  jne     0x1402cf7b0
0001402CF7A7  lea     rcx, [rbp - 0x18]
0001402CF7AB  call    0x1402d4880
0001402CF7B0  mov     rax, qword ptr [rbp - 0x10]
0001402CF7B4  mov     byte ptr [rax + r14], 4
0001402CF7B9  jmp     0x1402cf6fd
0001402CF7BE  cmp     r14, qword ptr [rbp - 0x18]
0001402CF7C2  jne     0x1402cf7cd
0001402CF7C4  lea     rcx, [rbp - 0x18]
0001402CF7C8  call    0x1402d4880
0001402CF7CD  mov     rax, qword ptr [rbp - 0x10]
0001402CF7D1  mov     byte ptr [rax + r14], 2
0001402CF7D6  jmp     0x1402cf6fd
0001402CF7DB  cmp     r14, qword ptr [rbp - 0x18]
0001402CF7DF  jne     0x1402cf7ea
0001402CF7E1  lea     rcx, [rbp - 0x18]
0001402CF7E5  call    0x1402d4880
0001402CF7EA  mov     rax, qword ptr [rbp - 0x10]
0001402CF7EE  mov     byte ptr [rax + r14], 6
0001402CF7F3  jmp     0x1402cf6fd
0001402CF7F8  mov     qword ptr [rsp + 0x20], 1
0001402CF801  mov     r8d, 2
0001402CF807  mov     r9d, 1
0001402CF80D  lea     rcx, [rbp - 0x18]
0001402CF811  mov     rdx, r14
0001402CF814  call    0x1402cc040
0001402CF819  mov     r14, qword ptr [rbp - 8]
0001402CF81D  jmp     0x1402cf3e6
0001402CF822  mov     qword ptr [rsp + 0x20], 1
0001402CF82B  mov     r9d, 1
0001402CF831  lea     rcx, [rbp - 0x18]
0001402CF835  mov     rdx, r14
0001402CF838  mov     r8, r12
0001402CF83B  call    0x1402cc040
0001402CF840  mov     r14, qword ptr [rbp - 8]
0001402CF844  jmp     0x1402cf413
0001402CF849  mov     qword ptr [rsp + 0x20], 1
0001402CF852  mov     r8d, 2
0001402CF858  mov     r9d, 1
0001402CF85E  lea     rcx, [rbp - 0x18]
0001402CF862  mov     rdx, r14
0001402CF865  call    0x1402cc040
0001402CF86A  mov     r14, qword ptr [rbp - 8]
0001402CF86E  jmp     0x1402cf51f
0001402CF873  mov     qword ptr [rsp + 0x20], 1
0001402CF87C  mov     r8d, 2
0001402CF882  mov     r9d, 1
0001402CF888  lea     rcx, [rbp - 0x18]
0001402CF88C  mov     rdx, r14
0001402CF88F  call    0x1402cc040
0001402CF894  mov     r14, qword ptr [rbp - 8]
0001402CF898  jmp     0x1402cf549
0001402CF89D  mov     qword ptr [rsp + 0x20], 1
0001402CF8A6  mov     r8d, 4
0001402CF8AC  mov     r9d, 1
0001402CF8B2  lea     rcx, [rbp - 0x18]
0001402CF8B6  mov     rdx, r14
0001402CF8B9  call    0x1402cc040
0001402CF8BE  mov     r14, qword ptr [rbp - 8]
0001402CF8C2  jmp     0x1402cf572
0001402CF8C7  mov     qword ptr [rsp + 0x20], 1
0001402CF8D0  mov     r8d, 3
0001402CF8D6  mov     r9d, 1
0001402CF8DC  lea     rcx, [rbp - 0x18]
0001402CF8E0  mov     rdx, r14
0001402CF8E3  call    0x1402cc040
0001402CF8E8  mov     r14, qword ptr [rbp - 8]
0001402CF8EC  jmp     0x1402cf5a3
0001402CF8F1  mov     qword ptr [rsp + 0x20], 1
0001402CF8FA  mov     r8d, 2
0001402CF900  mov     r9d, 1
0001402CF906  lea     rcx, [rbp - 0x18]
0001402CF90A  mov     rdx, r14
0001402CF90D  call    0x1402cc040
0001402CF912  mov     r14, qword ptr [rbp - 8]
0001402CF916  jmp     0x1402cf5d6
0001402CF91B  mov     qword ptr [rsp + 0x20], 1
0001402CF924  mov     r8d, 2
0001402CF92A  mov     r9d, 1
0001402CF930  lea     rcx, [rbp - 0x18]
0001402CF934  mov     rdx, r14
0001402CF937  call    0x1402cc040
0001402CF93C  mov     r14, qword ptr [rbp - 8]
0001402CF940  jmp     0x1402cf600
0001402CF945  mov     qword ptr [rsp + 0x20], 1
0001402CF94E  mov     r8d, 2
0001402CF954  mov     r9d, 1
0001402CF95A  lea     rcx, [rbp - 0x18]
0001402CF95E  mov     rdx, r14
0001402CF961  call    0x1402cc040
0001402CF966  mov     r14, qword ptr [rbp - 8]
0001402CF96A  jmp     0x1402cf388
0001402CF96F  mov     qword ptr [rsp + 0x20], 1
0001402CF978  mov     r8d, 2
0001402CF97E  mov     r9d, 1
0001402CF984  lea     rcx, [rbp - 0x18]
0001402CF988  mov     rdx, r14
0001402CF98B  call    0x1402cc040
0001402CF990  mov     r14, qword ptr [rbp - 8]
0001402CF994  jmp     0x1402cf658
0001402CF999  mov     qword ptr [rsp + 0x20], 1
0001402CF9A2  mov     r8d, 3
0001402CF9A8  mov     r9d, 1
0001402CF9AE  lea     rcx, [rbp - 0x18]
0001402CF9B2  mov     rdx, r14
0001402CF9B5  call    0x1402cc040
0001402CF9BA  mov     r14, qword ptr [rbp - 8]
0001402CF9BE  jmp     0x1402cf6b6
0001402CF9C3  mov     qword ptr [rsp + 0x20], 1
0001402CF9CC  mov     r8d, 2
0001402CF9D2  mov     r9d, 1
0001402CF9D8  lea     rcx, [rbp - 0x18]
0001402CF9DC  mov     rdx, r14
0001402CF9DF  call    0x1402cc040
0001402CF9E4  mov     r14, qword ptr [rbp - 8]
0001402CF9E8  jmp     0x1402cf751
0001402CF9ED  call    0x140007ed0
0001402CF9F2  mov     ecx, 0x2b
0001402CF9F7  mov     edx, 1
0001402CF9FC  call    0x1400549e0
0001402CFA01  test    rax, rax
0001402CFA04  je      0x1402cfb0b
0001402CFA0A  movups  xmm0, xmmword ptr [rip + 0x75a47]   ; [rip -> 0x140345458] str=' manifest limitsinvalid anion atominvalid compound anioninva'
0001402CFA11  movups  xmmword ptr [rax + 0x1b], xmm0
0001402CFA15  movups  xmm0, xmmword ptr [rip + 0x75a31]   ; [rip -> 0x14034544D] str='ion exceeds manifest limitsinvalid anion atominvalid compoun'
0001402CFA1C  movups  xmmword ptr [rax + 0x10], xmm0
0001402CFA20  movups  xmm0, xmmword ptr [rip + 0x75a16]   ; [rip -> 0x14034543D] str='compound definition exceeds manifest limitsinvalid anion ato'
0001402CFA27  movups  xmmword ptr [rax], xmm0
0001402CFA2A  mov     qword ptr [rbp - 0x50], 0x2b
0001402CFA32  mov     qword ptr [rbp - 0x48], rax
0001402CFA36  mov     qword ptr [rbp - 0x40], 0x2b
0001402CFA3E  lea     rdx, [rbp - 0x50]
0001402CFA42  mov     cl, 0x15
0001402CFA44  call    0x1401f7520
0001402CFA49  mov     rcx, qword ptr [rbp - 0x38]
0001402CFA4D  mov     qword ptr [rcx + 8], rax
0001402CFA51  movabs  rax, 0x8000000000000000
0001402CFA5B  mov     qword ptr [rcx], rax
0001402CFA5E  mov     rdx, qword ptr [rbp - 0x18]
0001402CFA62  test    rdx, rdx
0001402CFA65  je      0x1402cfa8b
0001402CFA67  mov     rcx, qword ptr [rbp - 0x10]
0001402CFA6B  mov     r8d, 1
0001402CFA71  call    0x1400549f0
0001402CFA76  jmp     0x1402cfa8b
0001402CFA78  mov     rax, qword ptr [rbp - 8]
0001402CFA7C  mov     rcx, qword ptr [rbp - 0x38]
0001402CFA80  mov     qword ptr [rcx + 0x10], rax
0001402CFA84  movups  xmm0, xmmword ptr [rbp - 0x18]
0001402CFA88  movups  xmmword ptr [rcx], xmm0
0001402CFA8B  add     rsp, 0x88
0001402CFA92  pop     rbx
0001402CFA93  pop     rdi
0001402CFA94  pop     rsi
0001402CFA95  pop     r12
0001402CFA97  pop     r13
0001402CFA99  pop     r14
0001402CFA9B  pop     r15
0001402CFA9D  pop     rbp
0001402CFA9E  ret     
0001402CFA9F  call    0x140007ed0
0001402CFAA4  mov     ecx, 0x2b
0001402CFAA9  mov     edx, 1
0001402CFAAE  call    0x1400549e0
0001402CFAB3  test    rax, rax
0001402CFAB6  je      0x1402cfb1c
0001402CFAB8  movups  xmm0, xmmword ptr [rip + 0x75999]   ; [rip -> 0x140345458] str=' manifest limitsinvalid anion atominvalid compound anioninva'
0001402CFABF  movups  xmmword ptr [rax + 0x1b], xmm0
0001402CFAC3  movups  xmm0, xmmword ptr [rip + 0x75983]   ; [rip -> 0x14034544D] str='ion exceeds manifest limitsinvalid anion atominvalid compoun'
0001402CFACA  movups  xmmword ptr [rax + 0x10], xmm0
0001402CFACE  movups  xmm0, xmmword ptr [rip + 0x75968]   ; [rip -> 0x14034543D] str='compound definition exceeds manifest limitsinvalid anion ato'
0001402CFAD5  movups  xmmword ptr [rax], xmm0
0001402CFAD8  mov     qword ptr [rbp - 0x50], 0x2b
0001402CFAE0  mov     qword ptr [rbp - 0x48], rax
0001402CFAE4  mov     qword ptr [rbp - 0x40], 0x2b
0001402CFAEC  lea     rdx, [rbp - 0x50]
0001402CFAF0  mov     cl, 0x15
0001402CFAF2  call    0x1401f7520
0001402CFAF7  jmp     0x1402cfa49
0001402CFAFC  mov     ecx, 1
0001402CFB01  mov     edx, 5
0001402CFB06  call    0x1402d4831
0001402CFB0B  mov     ecx, 1
0001402CFB10  mov     edx, 0x2b
0001402CFB15  call    0x1402d4831
0001402CFB1A  jmp     0x1402cfb2b
0001402CFB1C  mov     ecx, 1
