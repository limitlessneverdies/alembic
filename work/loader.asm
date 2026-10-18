0001400C8A80  push    rbp
0001400C8A81  push    r15
0001400C8A83  push    r14
0001400C8A85  push    r13
0001400C8A87  push    r12
0001400C8A89  push    rsi
0001400C8A8A  push    rdi
0001400C8A8B  push    rbx
0001400C8A8C  sub     rsp, 0x648
0001400C8A93  lea     rbp, [rsp + 0x80]
0001400C8A9B  movaps  xmmword ptr [rbp + 0x5b0], xmm15
0001400C8AA3  movaps  xmmword ptr [rbp + 0x5a0], xmm14
0001400C8AAB  movaps  xmmword ptr [rbp + 0x590], xmm13
0001400C8AB3  movaps  xmmword ptr [rbp + 0x580], xmm12
0001400C8ABB  movaps  xmmword ptr [rbp + 0x570], xmm11
0001400C8AC3  movaps  xmmword ptr [rbp + 0x560], xmm10
0001400C8ACB  movaps  xmmword ptr [rbp + 0x550], xmm9
0001400C8AD3  movdqa  xmmword ptr [rbp + 0x540], xmm8
0001400C8ADC  movdqa  xmmword ptr [rbp + 0x530], xmm7
0001400C8AE4  movaps  xmmword ptr [rbp + 0x520], xmm6
0001400C8AEB  mov     qword ptr [rbp + 0x518], 0xfffffffffffffffe
0001400C8AF6  mov     rdi, rcx
0001400C8AF9  lea     rcx, [rbp + 0x260]
0001400C8B00  call    0x1401934b0
0001400C8B05  mov     rdx, qword ptr [rbp + 0x260]
0001400C8B0C  mov     rbx, qword ptr [rbp + 0x268]
0001400C8B13  mov     rax, rdx
0001400C8B16  neg     rax
0001400C8B19  mov     esi, 1
0001400C8B1E  jo      0x1400c8cae
0001400C8B24  mov     r13, qword ptr [rbp + 0x270]
0001400C8B2B  mov     qword ptr [rbp + 0x4d0], rbx
0001400C8B32  mov     qword ptr [rbp + 0x4d8], r13
0001400C8B39  cmp     r13, 3
0001400C8B3D  mov     qword ptr [rbp + 0x4c0], rbx
0001400C8B44  ja      0x1400c8bab
0001400C8B46  mov     qword ptr [rbp + 0x508], rdx
0001400C8B4D  call    0x140007ed0
0001400C8B52  mov     ecx, 0x13
0001400C8B57  mov     edx, 1
0001400C8B5C  call    0x1400549e0
0001400C8B61  test    rax, rax
0001400C8B64  je      0x1400c993b
0001400C8B6A  movups  xmm0, xmmword ptr [rip + 0x22f0a7]   ; [rip -> 0x1402F7C18] str='truncated save datatruncated save recordsunexpected data aft'
0001400C8B71  movups  xmmword ptr [rax], xmm0
0001400C8B74  mov     dword ptr [rax + 0xf], 0x61746164
0001400C8B7B  mov     qword ptr [rbp + 0x260], 0x13
0001400C8B86  mov     qword ptr [rbp + 0x268], rax
0001400C8B8D  mov     qword ptr [rbp + 0x270], 0x13
0001400C8B98  lea     rdx, [rbp + 0x260]
0001400C8B9F  mov     cl, 0x15
0001400C8BA1  call    0x1401f7520
0001400C8BA6  jmp     0x1400c8c8a
0001400C8BAB  test    rbx, rbx
0001400C8BAE  je      0x1400c8c24
0001400C8BB0  cmp     dword ptr [rbx], 0x4e494c41
0001400C8BB6  mov     qword ptr [rbp + 0x508], rdx
0001400C8BBD  jne     0x1400c8c31
0001400C8BBF  cmp     r13, 4
0001400C8BC3  jne     0x1400c8d16
0001400C8BC9  call    0x140007ed0
0001400C8BCE  mov     ecx, 0x13
0001400C8BD3  mov     edx, 1
0001400C8BD8  call    0x1400549e0
0001400C8BDD  test    rax, rax
0001400C8BE0  je      0x1400c9dc9
0001400C8BE6  movups  xmm0, xmmword ptr [rip + 0x22f02b]   ; [rip -> 0x1402F7C18] str='truncated save datatruncated save recordsunexpected data aft'
0001400C8BED  movups  xmmword ptr [rax], xmm0
0001400C8BF0  mov     dword ptr [rax + 0xf], 0x61746164
0001400C8BF7  mov     qword ptr [rbp + 0x260], 0x13
0001400C8C02  mov     qword ptr [rbp + 0x268], rax
0001400C8C09  mov     qword ptr [rbp + 0x270], 0x13
0001400C8C14  lea     rdx, [rbp + 0x260]
0001400C8C1B  mov     cl, 0x15
0001400C8C1D  call    0x1401f7520
0001400C8C22  jmp     0x1400c8c8a
0001400C8C24  mov     r14d, 4
0001400C8C2A  test    rdx, rdx
0001400C8C2D  jne     0x1400c8c99
0001400C8C2F  jmp     0x1400c8cab
0001400C8C31  call    0x140007ed0
0001400C8C36  mov     ecx, 9
0001400C8C3B  mov     edx, 1
0001400C8C40  call    0x1400549e0
0001400C8C45  test    rax, rax
0001400C8C48  je      0x1400c99c8
0001400C8C4E  movabs  rcx, 0x6967616d20646162
0001400C8C58  mov     qword ptr [rax], rcx
0001400C8C5B  mov     byte ptr [rax + 8], 0x63
0001400C8C5F  mov     qword ptr [rbp + 0x260], 9
0001400C8C6A  mov     qword ptr [rbp + 0x268], rax
0001400C8C71  mov     qword ptr [rbp + 0x270], 9
0001400C8C7C  lea     rdx, [rbp + 0x260]
0001400C8C83  mov     cl, 0x15
0001400C8C85  call    0x1401f7520
0001400C8C8A  mov     r14, rax
0001400C8C8D  mov     rdx, qword ptr [rbp + 0x508]
0001400C8C94  test    rdx, rdx
0001400C8C97  je      0x1400c8cab
0001400C8C99  mov     r8d, 1
0001400C8C9F  mov     rcx, qword ptr [rbp + 0x4c0]
0001400C8CA6  call    0x1400549f0
0001400C8CAB  mov     rbx, r14
0001400C8CAE  mov     rax, rsi
0001400C8CB1  mov     rdx, rbx
0001400C8CB4  movaps  xmm6, xmmword ptr [rbp + 0x520]
0001400C8CBB  movaps  xmm7, xmmword ptr [rbp + 0x530]
0001400C8CC2  movaps  xmm8, xmmword ptr [rbp + 0x540]
0001400C8CCA  movaps  xmm9, xmmword ptr [rbp + 0x550]
0001400C8CD2  movaps  xmm10, xmmword ptr [rbp + 0x560]
0001400C8CDA  movaps  xmm11, xmmword ptr [rbp + 0x570]
0001400C8CE2  movaps  xmm12, xmmword ptr [rbp + 0x580]
0001400C8CEA  movaps  xmm13, xmmword ptr [rbp + 0x590]
0001400C8CF2  movaps  xmm14, xmmword ptr [rbp + 0x5a0]
0001400C8CFA  movaps  xmm15, xmmword ptr [rbp + 0x5b0]
0001400C8D02  add     rsp, 0x648
0001400C8D09  pop     rbx
0001400C8D0A  pop     rdi
0001400C8D0B  pop     rsi
0001400C8D0C  pop     r12
0001400C8D0E  pop     r13
0001400C8D10  pop     r14
0001400C8D12  pop     r15
0001400C8D14  pop     rbp
0001400C8D15  ret     
0001400C8D16  mov     qword ptr [rbp + 0x4e0], 5
0001400C8D21  mov     rax, qword ptr [rbp + 0x4c0]
0001400C8D28  movzx   r15d, byte ptr [rax + 4]
0001400C8D2D  mov     byte ptr [rbp + 0x502], r15b
0001400C8D34  lea     eax, [r15 - 8]
0001400C8D38  cmp     al, 0xf8
0001400C8D3A  ja      0x1400c8d7b
0001400C8D3C  lea     rdx, [rip + 0x288f84]   ; [rip -> 0x140351CC7] str='unknown save version'
0001400C8D43  lea     rcx, [rbp + 0x260]
0001400C8D4A  mov     r8d, 0x14
0001400C8D50  call    0x14014b500
0001400C8D55  mov     rax, qword ptr [rbp + 0x270]
0001400C8D5C  mov     qword ptr [rbp + 0x60], rax
0001400C8D60  movups  xmm0, xmmword ptr [rbp + 0x260]
0001400C8D67  movaps  xmmword ptr [rbp + 0x50], xmm0
0001400C8D6B  lea     rdx, [rbp + 0x50]
0001400C8D6F  mov     cl, 0x15
0001400C8D71  call    0x1401f7520
0001400C8D76  jmp     0x1400c8c8a
0001400C8D7B  lea     rcx, [rbp + 0x260]
0001400C8D82  lea     rdx, [rbp + 0x4d0]
0001400C8D89  call    0x14006f350
0001400C8D8E  cmp     byte ptr [rbp + 0x260], 0
0001400C8D95  jne     0x1400c8e5a
0001400C8D9B  movzx   r8d, word ptr [rbp + 0x262]
0001400C8DA3  lea     rcx, [rbp + 0x260]
0001400C8DAA  lea     rdx, [rbp + 0x4d0]
0001400C8DB1  call    0x14006f4c0
0001400C8DB6  cmp     qword ptr [rbp + 0x260], 0
0001400C8DBE  je      0x1400c8e5a
0001400C8DC4  cmp     r15b, 2
0001400C8DC8  jbe     0x1400c8e0b
0001400C8DCA  lea     rcx, [rbp + 0x260]
0001400C8DD1  lea     rdx, [rbp + 0x4d0]
0001400C8DD8  call    0x14006f350
0001400C8DDD  cmp     byte ptr [rbp + 0x260], 0
0001400C8DE4  jne     0x1400c8e5a
0001400C8DE6  movzx   r8d, word ptr [rbp + 0x262]
0001400C8DEE  lea     rcx, [rbp + 0x260]
0001400C8DF5  lea     rdx, [rbp + 0x4d0]
0001400C8DFC  call    0x14006f4c0
0001400C8E01  cmp     qword ptr [rbp + 0x260], 0
0001400C8E09  je      0x1400c8e5a
0001400C8E0B  lea     rcx, [rbp + 0x4d0]
0001400C8E12  call    0x14006f450
0001400C8E17  mov     rbx, rdx
0001400C8E1A  test    al, 1
0001400C8E1C  je      0x1400c8e26
0001400C8E1E  mov     r14, rbx
0001400C8E21  jmp     0x1400c8c8d
0001400C8E26  lea     rcx, [rbp + 0x4d0]
0001400C8E2D  call    0x14006f450
0001400C8E32  test    al, 1
0001400C8E34  je      0x1400c8e3e
0001400C8E36  mov     r14, rdx
0001400C8E39  jmp     0x1400c8c8d
0001400C8E3E  lea     rcx, [rbp + 0x260]
0001400C8E45  lea     rdx, [rbp + 0x4d0]
0001400C8E4C  call    0x14006f2d0
0001400C8E51  cmp     byte ptr [rbp + 0x260], 0
0001400C8E58  je      0x1400c8e66
0001400C8E5A  mov     r14, qword ptr [rbp + 0x268]
0001400C8E61  jmp     0x1400c8c8d
0001400C8E66  movzx   eax, word ptr [rbp + 0x262]
0001400C8E6D  mov     word ptr [rbp + 0x504], ax
0001400C8E74  cmp     r15b, 2
0001400C8E78  jb      0x1400c8ef5
0001400C8E7A  lea     rcx, [rbp + 0x260]
0001400C8E81  lea     rdx, [rbp + 0x4d0]
0001400C8E88  call    0x14006f250
0001400C8E8D  cmp     byte ptr [rbp + 0x260], 0
0001400C8E94  jne     0x1400c8e5a
0001400C8E96  movd    xmm7, dword ptr [rbp + 0x264]
0001400C8E9E  lea     rcx, [rbp + 0x260]
0001400C8EA5  lea     rdx, [rbp + 0x4d0]
0001400C8EAC  call    0x14006f250
0001400C8EB1  cmp     byte ptr [rbp + 0x260], 0
0001400C8EB8  jne     0x1400c8e5a
0001400C8EBA  movd    xmm8, dword ptr [rbp + 0x264]
0001400C8EC3  lea     rcx, [rbp + 0x260]
0001400C8ECA  lea     rdx, [rbp + 0x4d0]
0001400C8ED1  call    0x14006f1f0
0001400C8ED6  cmp     byte ptr [rbp + 0x260], 0
0001400C8EDD  jne     0x1400c8e5a
0001400C8EE3  movzx   edx, byte ptr [rbp + 0x261]
0001400C8EEA  movdqa  xmm6, xmm7
0001400C8EEE  punpckldq xmm6, xmm8
0001400C8EF3  jmp     0x1400c8f10
0001400C8EF5  movq    xmm6, qword ptr [rip + 0x22da93]   ; [rip -> 0x1402F6990]
0001400C8EFD  movd    xmm7, dword ptr [rip + 0x216103]   ; [rip -> 0x1402DF008]
0001400C8F05  movd    xmm8, dword ptr [rip + 0x22da92]   ; [rip -> 0x1402F69A0] str='=\nW>'
0001400C8F0E  mov     dl, 1
0001400C8F10  movd    eax, xmm7
0001400C8F14  and     eax, 0x7fffffff
0001400C8F19  cmp     eax, 0x7f800000
0001400C8F1E  setge   al
0001400C8F21  movd    ecx, xmm8
0001400C8F26  and     ecx, 0x7fffffff
0001400C8F2C  cmp     ecx, 0x7f800000
0001400C8F32  setge   cl
0001400C8F35  or      cl, al
0001400C8F37  je      0x1400c8f78
0001400C8F39  lea     rdx, [rip + 0x288c90]   ; [rip -> 0x140351BD0] str='invalid environment valuessave is missing its compound manif'
0001400C8F40  lea     rcx, [rbp + 0x260]
0001400C8F47  mov     r8d, 0x1a
0001400C8F4D  call    0x14014b500
0001400C8F52  mov     rax, qword ptr [rbp + 0x270]
0001400C8F59  mov     qword ptr [rbp + 0x60], rax
0001400C8F5D  movups  xmm0, xmmword ptr [rbp + 0x260]
0001400C8F64  movaps  xmmword ptr [rbp + 0x50], xmm0
0001400C8F68  lea     rdx, [rbp + 0x50]
0001400C8F6C  mov     cl, 0x15
0001400C8F6E  call    0x1401f7520
0001400C8F73  jmp     0x1400c8c8a
0001400C8F78  cmp     r15b, 4
0001400C8F7C  mov     byte ptr [rbp + 0x503], dl
0001400C8F82  jbe     0x1400c8fb3
0001400C8F84  lea     rcx, [rbp + 0x260]
0001400C8F8B  lea     rdx, [rbp + 0x4d0]
0001400C8F92  call    0x14006f1f0
0001400C8F97  cmp     byte ptr [rbp + 0x260], 0
0001400C8F9E  jne     0x1400c8e5a
0001400C8FA4  movzx   eax, byte ptr [rbp + 0x261]
0001400C8FAB  mov     byte ptr [rbp + 0x507], al
0001400C8FB1  jmp     0x1400c8fc0
0001400C8FB3  mov     byte ptr [rbp + 0x507], 8
0001400C8FBA  jne     0x1400c9069
0001400C8FC0  lea     rcx, [rbp + 0x260]
0001400C8FC7  lea     rdx, [rbp + 0x4d0]
0001400C8FCE  call    0x14006f350
0001400C8FD3  cmp     byte ptr [rbp + 0x260], 0
0001400C8FDA  jne     0x1400c8e5a
0001400C8FE0  movzx   r14d, word ptr [rbp + 0x262]
0001400C8FE8  lea     rcx, [rbp + 0x260]
0001400C8FEF  lea     rdx, [rbp + 0x4d0]
0001400C8FF6  call    0x14006f350
0001400C8FFB  cmp     byte ptr [rbp + 0x260], 0
0001400C9002  jne     0x1400c8e5a
0001400C9008  movzx   r12d, word ptr [rbp + 0x262]
0001400C9010  lea     rcx, [rbp + 0x260]
0001400C9017  lea     rdx, [rbp + 0x4d0]
0001400C901E  call    0x14006f3d0
0001400C9023  cmp     byte ptr [rbp + 0x260], 0
0001400C902A  jne     0x1400c8e5a
0001400C9030  mov     r8d, dword ptr [rbp + 0x264]
0001400C9037  imul    r12, r14
0001400C903B  lea     rax, [r12 + r12*2]
0001400C903F  cmp     rax, r8
0001400C9042  jne     0x1400c91d9
0001400C9048  lea     rcx, [rbp + 0x260]
0001400C904F  lea     rdx, [rbp + 0x4d0]
0001400C9056  call    0x14006f4c0
0001400C905B  cmp     qword ptr [rbp + 0x260], 0
0001400C9063  je      0x1400c8e5a
0001400C9069  lea     rcx, [rbp + 0x260]
0001400C9070  lea     rdx, [rbp + 0x4d0]
0001400C9077  call    0x14006f3d0
0001400C907C  cmp     byte ptr [rbp + 0x260], 0
0001400C9083  jne     0x1400c8e5a
0001400C9089  mov     r8d, dword ptr [rbp + 0x264]
0001400C9090  cmp     qword ptr [rdi + 0x48], r8
0001400C9094  jne     0x1400c919a
0001400C909A  shl     r8, 4
0001400C909E  lea     rcx, [rbp + 0x260]
0001400C90A5  lea     rdx, [rbp + 0x4d0]
0001400C90AC  call    0x14006f4c0
0001400C90B1  mov     rax, qword ptr [rbp + 0x260]
0001400C90B8  mov     r14, qword ptr [rbp + 0x268]
0001400C90BF  test    rax, rax
0001400C90C2  je      0x1400c8c8d
0001400C90C8  movabs  rcx, 0x7ffffffffffffff0
0001400C90D2  and     rcx, r14
0001400C90D5  and     r14d, 0xf
0001400C90D9  mov     qword ptr [rbp + 0x1f0], rax
0001400C90E0  add     rax, rcx
0001400C90E3  mov     qword ptr [rbp + 0x1f8], rcx
0001400C90EA  mov     qword ptr [rbp + 0x200], rax
0001400C90F1  mov     qword ptr [rbp + 0x208], r14
0001400C90F8  mov     qword ptr [rbp + 0x210], 0x10
0001400C9103  lea     rax, [rbp + 0x502]
0001400C910A  mov     qword ptr [rbp + 0x218], rax
0001400C9111  lea     rcx, [rbp + 0x260]
0001400C9118  lea     rdx, [rbp + 0x1f0]
0001400C911F  call    0x1401d4050
0001400C9124  mov     r12, qword ptr [rbp + 0x260]
0001400C912B  mov     r14, qword ptr [rbp + 0x268]
0001400C9132  mov     rax, r12
0001400C9135  neg     rax
0001400C9138  jo      0x1400c8c8d
0001400C913E  mov     rax, qword ptr [rbp + 0x270]
0001400C9145  mov     qword ptr [rbp + 0x488], r12
0001400C914C  mov     qword ptr [rbp + 0x490], r14
0001400C9153  mov     qword ptr [rbp + 0x498], rax
0001400C915A  cmp     qword ptr [rbp + 0x4e0], r13
0001400C9161  jae     0x1400c9218
0001400C9167  mov     byte ptr [rbp + 0x514], 1
0001400C916E  lea     rcx, [rbp + 0x260]
0001400C9175  lea     rdx, [rbp + 0x4d0]
0001400C917C  call    0x14006f3d0
0001400C9181  cmp     byte ptr [rbp + 0x260], 0
0001400C9188  je      0x1400c9374
0001400C918E  mov     r14, qword ptr [rbp + 0x268]
0001400C9195  jmp     0x1400c9a57
0001400C919A  lea     rdx, [rip + 0x288afb]   ; [rip -> 0x140351C9C] str='cell count mismatchinvalid thumbnail lengthunknown save vers'
0001400C91A1  lea     rcx, [rbp + 0x260]
0001400C91A8  mov     r8d, 0x13
0001400C91AE  call    0x14014b500
0001400C91B3  mov     rax, qword ptr [rbp + 0x270]
0001400C91BA  mov     qword ptr [rbp + 0x60], rax
0001400C91BE  movups  xmm0, xmmword ptr [rbp + 0x260]
0001400C91C5  movaps  xmmword ptr [rbp + 0x50], xmm0
0001400C91C9  lea     rdx, [rbp + 0x50]
0001400C91CD  mov     cl, 0x15
0001400C91CF  call    0x1401f7520
0001400C91D4  jmp     0x1400c8c8a
0001400C91D9  lea     rdx, [rip + 0x288acf]   ; [rip -> 0x140351CAF] str='invalid thumbnail lengthunknown save version'
0001400C91E0  lea     rcx, [rbp + 0x260]
0001400C91E7  mov     r8d, 0x18
0001400C91ED  call    0x14014b500
0001400C91F2  mov     rax, qword ptr [rbp + 0x270]
0001400C91F9  mov     qword ptr [rbp + 0x60], rax
0001400C91FD  movups  xmm0, xmmword ptr [rbp + 0x260]
0001400C9204  movaps  xmmword ptr [rbp + 0x50], xmm0
0001400C9208  lea     rdx, [rbp + 0x50]
0001400C920C  mov     cl, 0x15
0001400C920E  call    0x1401f7520
0001400C9213  jmp     0x1400c8c8a
0001400C9218  cmp     r15b, 5
0001400C921C  jbe     0x1400c926e
0001400C921E  mov     byte ptr [rbp + 0x514], 1
0001400C9225  lea     rdx, [rip + 0x2889be]   ; [rip -> 0x140351BEA] str='save is missing its compound manifest and discoveriesLegacy '
0001400C922C  lea     rcx, [rbp + 0x260]
0001400C9233  mov     r8d, 0x35
0001400C9239  call    0x14014b500
0001400C923E  mov     rax, qword ptr [rbp + 0x270]
0001400C9245  mov     qword ptr [rbp + 0x60], rax
0001400C9249  movups  xmm0, xmmword ptr [rbp + 0x260]
0001400C9250  movaps  xmmword ptr [rbp + 0x50], xmm0
0001400C9254  mov     byte ptr [rbp + 0x514], 1
0001400C925B  lea     rdx, [rbp + 0x50]
0001400C925F  mov     cl, 0x15
0001400C9261  call    0x1401f7520
0001400C9266  mov     r14, rax
0001400C9269  jmp     0x1400c9a57
0001400C926E  pxor    xmm7, xmm7
0001400C9272  movdqu  xmmword ptr [rbp + 0x2a], xmm7
0001400C9277  movdqa  xmmword ptr [rbp + 0x20], xmm7
0001400C927C  movdqa  xmmword ptr [rbp + 0x10], xmm7
0001400C9281  movdqa  xmmword ptr [rbp], xmm7
0001400C9286  movdqa  xmmword ptr [rbp - 0x10], xmm7
0001400C928B  movdqa  xmmword ptr [rbp - 0x20], xmm7
0001400C9290  movdqa  xmmword ptr [rbp - 0x30], xmm7
0001400C9295  movdqa  xmmword ptr [rbp - 0x40], xmm7
0001400C929A  movdqa  xmmword ptr [rbp - 0x50], xmm7
0001400C929F  movdqa  xmmword ptr [rbp + 0x220], xmm7
0001400C92A7  mov     byte ptr [rbp + 0x4f8], 3
0001400C92AE  movabs  rax, 0x8000000000000000
0001400C92B8  mov     qword ptr [rbp + 0x4e8], rax
0001400C92BF  mov     byte ptr [rbp + 0x4c8], 1
0001400C92C6  mov     eax, 8
0001400C92CB  mov     qword ptr [rbp + 0x418], rax
0001400C92D2  mov     qword ptr [rbp + 0x420], 0
0001400C92DD  mov     qword ptr [rbp + 0x428], rax
0001400C92E4  mov     qword ptr [rbp + 0x430], rax
0001400C92EB  mov     qword ptr [rbp + 0x438], 0
0001400C92F6  mov     qword ptr [rbp + 0x440], 0
0001400C9301  xor     r12d, r12d
0001400C9304  mov     qword ptr [rbp + 0x448], 0
0001400C930F  mov     qword ptr [rbp + 0x450], 0
0001400C931A  mov     r14d, 8
0001400C9320  xorps   xmm0, xmm0
0001400C9323  movaps  xmmword ptr [rbp + 0x230], xmm0
0001400C932A  xorps   xmm9, xmm9
0001400C932E  xorps   xmm10, xmm10
0001400C9332  xorps   xmm11, xmm11
0001400C9336  xorps   xmm12, xmm12
0001400C933A  xorps   xmm13, xmm13
0001400C933E  xorps   xmm14, xmm14
0001400C9342  xorps   xmm15, xmm15
0001400C9346  pxor    xmm8, xmm8
0001400C934B  xor     r13d, r13d
0001400C934E  mov     qword ptr [rbp + 0x458], 0
0001400C9359  mov     qword ptr [rbp + 0x460], 0
0001400C9364  mov     qword ptr [rbp + 0x468], 0
0001400C936F  jmp     0x1400c9554
0001400C9374  mov     r8d, dword ptr [rbp + 0x264]
0001400C937B  mov     byte ptr [rbp + 0x514], 1
0001400C9382  lea     rcx, [rbp + 0x50]
0001400C9386  lea     rdx, [rbp + 0x4d0]
0001400C938D  call    0x14006f4c0
0001400C9392  mov     rdx, qword ptr [rbp + 0x50]
0001400C9396  mov     r14, qword ptr [rbp + 0x58]
0001400C939A  test    rdx, rdx
0001400C939D  je      0x1400c9a57
0001400C93A3  movzx   r9d, byte ptr [rdi + 0x802]
0001400C93AB  mov     byte ptr [rbp + 0x514], 1
0001400C93B2  lea     rcx, [rbp + 0x260]
0001400C93B9  mov     r8, r14
0001400C93BC  call    0x140083b40
0001400C93C1  mov     r13, qword ptr [rbp + 0x260]
0001400C93C8  mov     r14, qword ptr [rbp + 0x268]
0001400C93CF  mov     rax, r13
0001400C93D2  neg     rax
0001400C93D5  jo      0x1400c9a57
0001400C93DB  movups  xmm9, xmmword ptr [rbp + 0x270]
0001400C93E3  mov     rax, qword ptr [rbp + 0x280]
0001400C93EA  mov     qword ptr [rbp + 0x418], rax
0001400C93F1  movups  xmm10, xmmword ptr [rbp + 0x288]
0001400C93F9  mov     rax, qword ptr [rbp + 0x298]
0001400C9400  mov     qword ptr [rbp + 0x428], rax
0001400C9407  movups  xmm11, xmmword ptr [rbp + 0x2a0]
0001400C940F  mov     rax, qword ptr [rbp + 0x2b0]
0001400C9416  mov     qword ptr [rbp + 0x430], rax
0001400C941D  mov     rax, qword ptr [rbp + 0x2b8]
0001400C9424  mov     qword ptr [rbp + 0x438], rax
0001400C942B  mov     rax, qword ptr [rbp + 0x2c0]
0001400C9432  mov     qword ptr [rbp + 0x440], rax
0001400C9439  mov     rax, qword ptr [rbp + 0x2c8]
0001400C9440  mov     qword ptr [rbp + 0x240], rax
0001400C9447  mov     r12, qword ptr [rbp + 0x2d0]
0001400C944E  mov     rax, qword ptr [rbp + 0x2d8]
0001400C9455  mov     qword ptr [rbp + 0x458], rax
0001400C945C  movups  xmm12, xmmword ptr [rbp + 0x2e0]
0001400C9464  mov     rax, qword ptr [rbp + 0x2f0]
0001400C946B  mov     qword ptr [rbp + 0x420], rax
0001400C9472  movups  xmm13, xmmword ptr [rbp + 0x2f8]
0001400C947A  mov     rax, qword ptr [rbp + 0x308]
0001400C9481  mov     qword ptr [rbp + 0x448], rax
0001400C9488  movups  xmm14, xmmword ptr [rbp + 0x310]
0001400C9490  movups  xmm0, xmmword ptr [rbp + 0x320]
0001400C9497  movaps  xmmword ptr [rbp + 0x220], xmm0
0001400C949E  mov     rax, qword ptr [rbp + 0x330]
0001400C94A5  mov     qword ptr [rbp + 0x468], rax
0001400C94AC  movups  xmm15, xmmword ptr [rbp + 0x338]
0001400C94B4  mov     rax, qword ptr [rbp + 0x348]
0001400C94BB  mov     qword ptr [rbp + 0x460], rax
0001400C94C2  movdqu  xmm8, xmmword ptr [rbp + 0x350]
0001400C94CB  movsd   xmm0, qword ptr [rbp + 0x360]
0001400C94D3  movaps  xmmword ptr [rbp + 0x230], xmm0
0001400C94DA  movzx   eax, byte ptr [rbp + 0x364]
0001400C94E1  mov     byte ptr [rbp + 0x4c8], al
0001400C94E7  lea     rdx, [rbp + 0x365]
0001400C94EE  lea     rcx, [rbp - 0x50]
0001400C94F2  mov     r8d, 0x8a
0001400C94F8  call    0x1402cb3f0
0001400C94FD  movd    xmm7, dword ptr [rbp + 0x3ef]
0001400C9505  movzx   eax, byte ptr [rbp + 0x3f3]
0001400C950C  mov     qword ptr [rbp + 0x450], rax
0001400C9513  movzx   eax, byte ptr [rbp + 0x3f4]
0001400C951A  mov     byte ptr [rbp + 0x4f8], al
0001400C9520  movzx   eax, word ptr [rbp + 0x3f5]
0001400C9527  mov     word ptr [rbp + 0x4f4], ax
0001400C952E  movzx   eax, byte ptr [rbp + 0x3f7]
0001400C9535  mov     byte ptr [rbp + 0x4f6], al
0001400C953B  mov     rax, qword ptr [rbp + 0x3f8]
0001400C9542  mov     qword ptr [rbp + 0x4e8], rax
0001400C9549  movups  xmm0, xmmword ptr [rbp + 0x400]
0001400C9550  movaps  xmmword ptr [rbp + 0x40], xmm0
0001400C9554  mov     qword ptr [rbp + 0x50], r13
0001400C9558  mov     qword ptr [rbp + 0x58], r14
0001400C955C  movups  xmmword ptr [rbp + 0x60], xmm9
0001400C9561  mov     rax, qword ptr [rbp + 0x418]
0001400C9568  mov     qword ptr [rbp + 0x70], rax
0001400C956C  movups  xmmword ptr [rbp + 0x78], xmm10
0001400C9571  mov     rax, qword ptr [rbp + 0x428]
0001400C9578  mov     qword ptr [rbp + 0x88], rax
0001400C957F  movups  xmmword ptr [rbp + 0x90], xmm11
0001400C9587  mov     rax, qword ptr [rbp + 0x430]
0001400C958E  mov     qword ptr [rbp + 0xa0], rax
0001400C9595  mov     rax, qword ptr [rbp + 0x438]
0001400C959C  mov     qword ptr [rbp + 0xa8], rax
0001400C95A3  mov     rax, qword ptr [rbp + 0x440]
0001400C95AA  mov     qword ptr [rbp + 0xb0], rax
0001400C95B1  mov     rax, qword ptr [rbp + 0x240]
0001400C95B8  mov     qword ptr [rbp + 0xb8], rax
0001400C95BF  mov     qword ptr [rbp + 0xc0], r12
0001400C95C6  mov     rax, qword ptr [rbp + 0x458]
0001400C95CD  mov     qword ptr [rbp + 0xc8], rax
0001400C95D4  movups  xmmword ptr [rbp + 0xd0], xmm12
0001400C95DC  mov     rax, qword ptr [rbp + 0x420]
0001400C95E3  mov     qword ptr [rbp + 0xe0], rax
0001400C95EA  movups  xmmword ptr [rbp + 0xe8], xmm13
0001400C95F2  mov     rax, qword ptr [rbp + 0x448]
0001400C95F9  mov     qword ptr [rbp + 0xf8], rax
0001400C9600  movups  xmmword ptr [rbp + 0x100], xmm14
0001400C9608  movaps  xmm0, xmmword ptr [rbp + 0x220]
0001400C960F  movups  xmmword ptr [rbp + 0x110], xmm0
0001400C9616  mov     rax, qword ptr [rbp + 0x468]
0001400C961D  mov     qword ptr [rbp + 0x120], rax
0001400C9624  movups  xmmword ptr [rbp + 0x128], xmm15
0001400C962C  mov     rax, qword ptr [rbp + 0x460]
0001400C9633  mov     qword ptr [rbp + 0x138], rax
0001400C963A  movdqu  xmmword ptr [rbp + 0x140], xmm8
0001400C9643  movaps  xmm0, xmmword ptr [rbp + 0x230]
0001400C964A  movss   dword ptr [rbp + 0x150], xmm0
0001400C9652  movzx   eax, byte ptr [rbp + 0x4c8]
0001400C9659  mov     byte ptr [rbp + 0x154], al
0001400C965F  lea     rcx, [rbp + 0x155]
0001400C9666  lea     rdx, [rbp - 0x50]
0001400C966A  mov     r8d, 0x8a
0001400C9670  call    0x1402cb3f0
0001400C9675  movd    dword ptr [rbp + 0x1df], xmm7
0001400C967D  mov     rax, qword ptr [rbp + 0x450]
0001400C9684  mov     byte ptr [rbp + 0x1e3], al
0001400C968A  movzx   eax, byte ptr [rbp + 0x4f8]
0001400C9691  mov     byte ptr [rbp + 0x1e4], al
0001400C9697  movzx   eax, word ptr [rbp + 0x4f4]
0001400C969E  mov     word ptr [rbp + 0x1e5], ax
0001400C96A5  movzx   eax, byte ptr [rbp + 0x4f6]
0001400C96AC  mov     byte ptr [rbp + 0x1e7], al
0001400C96B2  mov     rax, qword ptr [rbp + 0x4e8]
0001400C96B9  mov     qword ptr [rbp + 0x248], rax
0001400C96C0  movaps  xmm0, xmmword ptr [rbp + 0x40]
0001400C96C4  movups  xmmword ptr [rbp + 0x250], xmm0
0001400C96CB  cmp     r15b, 6
0001400C96CF  jbe     0x1400c970b
0001400C96D1  mov     byte ptr [rbp + 0x513], 1
0001400C96D8  mov     byte ptr [rbp + 0x512], 1
0001400C96DF  lea     rcx, [rbp + 0x260]
0001400C96E6  lea     rdx, [rbp + 0x4d0]
0001400C96ED  call    0x14006f3d0
0001400C96F2  cmp     byte ptr [rbp + 0x260], 0
0001400C96F9  je      0x1400c9855
0001400C96FF  mov     r14, qword ptr [rbp + 0x268]
0001400C9706  jmp     0x1400c9a34
0001400C970B  jne     0x1400c97bc
0001400C9711  movups  xmm0, xmmword ptr [rbp + 0x248]
0001400C9718  movaps  xmmword ptr [rbp + 0x4a0], xmm0
0001400C971F  mov     rax, qword ptr [rbp + 0x258]
0001400C9726  mov     qword ptr [rbp + 0x4b0], rax
0001400C972D  xor     eax, eax
0001400C972F  mov     qword ptr [rbp + 0x4f8], 0
0001400C973A  cmp     rax, qword ptr [rbp + 0x4a0]
0001400C9741  jno     0x1400c98f0
0001400C9747  mov     byte ptr [rbp + 0x517], 0
0001400C974E  mov     byte ptr [rbp + 0x516], 1
0001400C9755  mov     byte ptr [rbp + 0x515], 1
0001400C975C  lea     rdx, [rip + 0x288515]   ; [rip -> 0x140351C78] str='v6 save requires a compound manifestcell count mismatchinval'
0001400C9763  lea     rcx, [rbp + 0x260]
0001400C976A  mov     r8d, 0x24
0001400C9770  call    0x14014b500
0001400C9775  mov     rax, qword ptr [rbp + 0x270]
0001400C977C  mov     qword ptr [rbp + 0x480], rax
0001400C9783  movups  xmm0, xmmword ptr [rbp + 0x260]
0001400C978A  movaps  xmmword ptr [rbp + 0x470], xmm0
0001400C9791  mov     byte ptr [rbp + 0x517], 0
0001400C9798  mov     byte ptr [rbp + 0x516], 1
0001400C979F  mov     byte ptr [rbp + 0x515], 1
0001400C97A6  lea     rdx, [rbp + 0x470]
0001400C97AD  mov     cl, 0x15
0001400C97AF  call    0x1401f7520
0001400C97B4  mov     r14, rax
0001400C97B7  jmp     0x1400c9a40
0001400C97BC  movabs  rax, 0x8000000000000000
0001400C97C6  mov     qword ptr [rbp + 0x4a0], rax
0001400C97CD  test    r12, r12
0001400C97D0  jne     0x1400c9809
0001400C97D2  mov     rax, qword ptr [rbp + 0x490]
0001400C97D9  mov     rcx, qword ptr [rbp + 0x498]
0001400C97E0  shl     rcx, 4
0001400C97E4  add     rcx, rax
0001400C97E7  mov     qword ptr [rbp + 0x260], rax
0001400C97EE  mov     qword ptr [rbp + 0x268], rcx
0001400C97F5  lea     rcx, [rbp + 0x260]
0001400C97FC  call    0x14014b600
0001400C9801  test    al, al
0001400C9803  je      0x1400c99e1
0001400C9809  mov     rax, qword ptr [rip + 0x5788e0]   ; [rip -> 0x1406420F0]
0001400C9810  mov     ecx, eax
0001400C9812  and     ecx, 8
0001400C9815  shr     ecx, 3
0001400C9818  cmp     rax, -0x10
0001400C981C  setae   dl
0001400C981F  or      dl, cl
0001400C9821  je      0x1400c994f
0001400C9827  mov     byte ptr [rbp + 0x517], 1
0001400C982E  mov     byte ptr [rbp + 0x516], 1
0001400C9835  mov     byte ptr [rbp + 0x515], 1
0001400C983C  lea     rcx, [rip + 0x5788ad]   ; [rip -> 0x1406420F0]
0001400C9843  xor     edx, edx
0001400C9845  mov     r9d, 0x3b9aca00
0001400C984B  call    0x1402d1400
0001400C9850  jmp     0x1400c9962
0001400C9855  mov     r8d, dword ptr [rbp + 0x264]
0001400C985C  mov     byte ptr [rbp + 0x513], 1
0001400C9863  mov     byte ptr [rbp + 0x512], 1
0001400C986A  lea     rcx, [rbp + 0x470]
0001400C9871  lea     rdx, [rbp + 0x4d0]
0001400C9878  call    0x14006f4c0
0001400C987D  mov     rdx, qword ptr [rbp + 0x470]
0001400C9884  mov     r14, qword ptr [rbp + 0x478]
0001400C988B  test    rdx, rdx
0001400C988E  je      0x1400c9a34
0001400C9894  mov     byte ptr [rbp + 0x513], 1
0001400C989B  mov     byte ptr [rbp + 0x512], 1
0001400C98A2  lea     rcx, [rbp + 0x260]
0001400C98A9  mov     r8, r14
0001400C98AC  call    0x140096470
0001400C98B1  mov     rax, qword ptr [rbp + 0x260]
0001400C98B8  mov     r14, qword ptr [rbp + 0x268]
0001400C98BF  mov     rcx, rax
0001400C98C2  neg     rcx
0001400C98C5  jo      0x1400c9a34
0001400C98CB  mov     rcx, qword ptr [rbp + 0x270]
0001400C98D2  mov     qword ptr [rbp + 0x4a0], rax
0001400C98D9  mov     qword ptr [rbp + 0x4a8], r14
0001400C98E0  mov     qword ptr [rbp + 0x4b0], rcx
0001400C98E7  mov     al, 1
0001400C98E9  mov     qword ptr [rbp + 0x4f8], rax
0001400C98F0  mov     rcx, qword ptr [rbp + 0x4d8]
0001400C98F7  mov     rdx, qword ptr [rbp + 0x4e0]
0001400C98FE  mov     rax, qword ptr [rbp + 0x4f8]
0001400C9905  mov     byte ptr [rbp + 0x517], al
0001400C990B  mov     byte ptr [rbp + 0x516], 1
0001400C9912  mov     byte ptr [rbp + 0x515], 1
0001400C9919  call    0x14006f6a0
0001400C991E  mov     r14, rax
0001400C9921  test    rax, rax
0001400C9924  je      0x1400c99dc
0001400C992A  lea     rcx, [rbp + 0x4a0]
0001400C9931  call    0x14006d780
0001400C9936  jmp     0x1400c9a2b
0001400C993B  mov     ecx, 1
0001400C9940  mov     edx, 0x13
0001400C9945  call    0x1402d4831
0001400C994A  jmp     0x1400c9dd8
0001400C994F  lea     rcx, [rax + 0x10]
0001400C9953  lock cmpxchg qword ptr [rip + 0x578794], rcx   ; [rip -> 0x1406420F0]
0001400C995C  jne     0x1400c9827
0001400C9962  mov     rax, qword ptr [rip + 0x57879f]   ; [rip -> 0x140642108]
0001400C9969  cmp     rax, 0xff
0001400C996F  mov     r14d, 0xff
0001400C9975  cmovb   r14, rax
0001400C9979  mov     rax, 0xfffffffffffffff0
0001400C9980  lock xadd qword ptr [rip + 0x578767], rax   ; [rip -> 0x1406420F0]
0001400C9989  and     rax, 0xfffffffffffffff2
0001400C998D  cmp     rax, 0x12
0001400C9991  je      0x1400c9dda
0001400C9997  mov     r13, qword ptr [rbp + 0x498]
0001400C999E  mov     r15b, 1
0001400C99A1  test    r13, r13
0001400C99A4  je      0x1400c99e4
0001400C99A6  mov     rcx, qword ptr [rbp + 0x490]
0001400C99AD  shl     r13, 4
0001400C99B1  lea     r12, [rcx + 0x10]
0001400C99B5  mov     edx, r14d
0001400C99B8  call    0x1400beb30
0001400C99BD  mov     rcx, r12
0001400C99C0  add     r13, -0x10
0001400C99C4  jne     0x1400c99b1
0001400C99C6  jmp     0x1400c99e4
0001400C99C8  mov     ecx, 1
0001400C99CD  mov     edx, 9
0001400C99D2  call    0x1402d4831
0001400C99D7  jmp     0x1400c9dd8
0001400C99DC  xor     r15d, r15d
0001400C99DF  jmp     0x1400c9a04
0001400C99E1  xor     r15d, r15d
0001400C99E4  mov     al, 1
0001400C99E6  mov     qword ptr [rbp + 0x4f8], rax
0001400C99ED  xor     eax, eax
0001400C99EF  cmp     rax, qword ptr [rbp + 0x4a0]
0001400C99F6  mov     al, 1
0001400C99F8  mov     dword ptr [rbp + 0x4e8], eax
0001400C99FE  jo      0x1400c9a88
0001400C9A04  lea     rcx, [rbp + 0x4a0]
0001400C9A0B  lea     rdx, [rbp + 0x488]
0001400C9A12  call    0x1400972b0
0001400C9A17  mov     r14, rax
0001400C9A1A  lea     rcx, [rbp + 0x4a0]
0001400C9A21  call    0x14006d780
0001400C9A26  test    r14, r14
0001400C9A29  je      0x1400c9a7e
0001400C9A2B  cmp     byte ptr [rbp + 0x4f8], 0
0001400C9A32  je      0x1400c9a40
0001400C9A34  lea     rcx, [rbp + 0x248]
0001400C9A3B  call    0x14006dc60
0001400C9A40  mov     byte ptr [rbp + 0x514], 1
0001400C9A47  lea     rcx, [rbp + 0x50]
0001400C9A4B  call    0x14006cbc0
0001400C9A50  mov     r12, qword ptr [rbp + 0x488]
0001400C9A57  test    r12, r12
0001400C9A5A  je      0x1400c8c8d
0001400C9A60  mov     rcx, qword ptr [rbp + 0x490]
0001400C9A67  shl     r12, 4
0001400C9A6B  mov     r8d, 2
0001400C9A71  mov     rdx, r12
0001400C9A74  call    0x1400549f0
0001400C9A79  jmp     0x1400c8c8d
0001400C9A7E  mov     dword ptr [rbp + 0x4e8], 0
0001400C9A88  movzx   eax, byte ptr [rdi + 0x802]
0001400C9A8F  mov     byte ptr [rbp + 0x1e2], al
0001400C9A95  mov     rax, qword ptr [rbp + 0x4f8]
0001400C9A9C  mov     byte ptr [rbp + 0x517], al
0001400C9AA2  mov     byte ptr [rbp + 0x516], 1
0001400C9AA9  mov     eax, dword ptr [rbp + 0x4e8]
0001400C9AAF  mov     byte ptr [rbp + 0x515], al
0001400C9AB5  lea     rcx, [rbp + 0x50]
0001400C9AB9  xor     edx, edx
0001400C9ABB  call    0x140086510
0001400C9AC0  mov     byte ptr [rbp + 0x1e1], 0
0001400C9AC7  test    r15b, r15b
0001400C9ACA  je      0x1400c9b72
0001400C9AD0  mov     rax, qword ptr [rbp + 0x4f8]
0001400C9AD7  mov     byte ptr [rbp + 0x517], al
0001400C9ADD  mov     byte ptr [rbp + 0x516], 1
0001400C9AE4  mov     eax, dword ptr [rbp + 0x4e8]
0001400C9AEA  mov     byte ptr [rbp + 0x515], al
0001400C9AF0  mov     qword ptr [rsp + 0x20], 0
0001400C9AF9  lea     rdx, [rip + 0x28811f]   ; [rip -> 0x140351C1F] str='Legacy save: compound identities were not recorded; unrecogn'
0001400C9B00  lea     rcx, [rbp + 0x470]
0001400C9B07  mov     r8d, 0x59
0001400C9B0D  mov     r9d, 8
0001400C9B13  call    0x1401548f0
0001400C9B18  mov     rax, qword ptr [rbp + 0x480]
0001400C9B1F  mov     qword ptr [rbp + 0x270], rax
0001400C9B26  movups  xmm0, xmmword ptr [rbp + 0x470]
0001400C9B2D  movaps  xmmword ptr [rbp + 0x260], xmm0
0001400C9B34  mov     byte ptr [rbp + 0x27e], 0
0001400C9B3B  mov     byte ptr [rbp + 0x278], 6
0001400C9B42  mov     rax, qword ptr [rbp + 0x4f8]
0001400C9B49  mov     byte ptr [rbp + 0x517], al
0001400C9B4F  mov     byte ptr [rbp + 0x516], 1
0001400C9B56  mov     eax, dword ptr [rbp + 0x4e8]
0001400C9B5C  mov     byte ptr [rbp + 0x515], al
0001400C9B62  lea     rcx, [rbp + 0x50]
0001400C9B66  lea     rdx, [rbp + 0x260]
0001400C9B6D  call    0x1400079a0
0001400C9B72  lea     rsi, [rdi + 0x38]
0001400C9B76  lea     rax, [rdi + 0x670]
0001400C9B7D  mov     qword ptr [rbp + 0x4c8], rax
0001400C9B84  mov     rdx, qword ptr [rsi]
0001400C9B87  test    rdx, rdx
0001400C9B8A  je      0x1400c9b9f
0001400C9B8C  mov     rcx, qword ptr [rdi + 0x40]
0001400C9B90  shl     rdx, 4
0001400C9B94  mov     r8d, 2
0001400C9B9A  call    0x1400549f0
0001400C9B9F  mov     rax, qword ptr [rbp + 0x498]
0001400C9BA6  mov     qword ptr [rsi + 0x10], rax
0001400C9BAA  movups  xmm0, xmmword ptr [rbp + 0x488]
0001400C9BB1  movups  xmmword ptr [rsi], xmm0
0001400C9BB4  lea     rcx, [rbp + 0x260]
0001400C9BBB  lea     rdx, [rbp + 0x50]
0001400C9BBF  mov     r8d, 0x198
0001400C9BC5  call    0x1402cb3f0
0001400C9BCA  mov     rcx, qword ptr [rbp + 0x4c8]
0001400C9BD1  call    0x14006cbc0
0001400C9BD6  lea     rdx, [rbp + 0x260]
0001400C9BDD  mov     r8d, 0x198
0001400C9BE3  mov     rcx, qword ptr [rbp + 0x4c8]
0001400C9BEA  call    0x1402cb3f0
0001400C9BEF  movzx   eax, word ptr [rbp + 0x504]
0001400C9BF6  mov     word ptr [rdi + 0x1cd2], ax
0001400C9BFD  xorps   xmm0, xmm0
0001400C9C00  maxps   xmm0, xmm6
0001400C9C03  movaps  xmm1, xmmword ptr [rip + 0x22c6c6]   ; [rip -> 0x1402F62D0]
0001400C9C0A  minps   xmm1, xmm0
0001400C9C0D  movlps  qword ptr [rdi + 0x19ec], xmm1
0001400C9C14  movzx   ecx, byte ptr [rbp + 0x507]
0001400C9C1B  mov     eax, ecx
0001400C9C1D  and     al, 1
0001400C9C1F  mov     byte ptr [rdi + 0x1cdd], al
0001400C9C25  mov     eax, ecx
0001400C9C27  shr     al, 1
0001400C9C29  and     al, 1
0001400C9C2B  mov     byte ptr [rdi + 0x1cde], al
0001400C9C31  mov     eax, ecx
0001400C9C33  shr     al, 2
0001400C9C36  and     al, 1
0001400C9C38  mov     byte ptr [rdi + 0x1cdf], al
0001400C9C3E  shr     cl, 3
0001400C9C41  and     cl, 1
0001400C9C44  mov     byte ptr [rdi + 0x1ce0], cl
0001400C9C4A  mov     rcx, qword ptr [rdi + 0x40]
0001400C9C4E  mov     rdx, qword ptr [rdi + 0x48]
0001400C9C52  shl     rdx, 4
0001400C9C56  add     rdx, rcx
0001400C9C59  call    0x14006e310
0001400C9C5E  inc     dl
0001400C9C60  movzx   ecx, dl
0001400C9C63  test    al, 1
0001400C9C65  mov     eax, 1
0001400C9C6A  cmovne  eax, ecx
0001400C9C6D  movzx   ecx, byte ptr [rbp + 0x503]
0001400C9C74  cmp     al, cl
0001400C9C76  cmovbe  eax, ecx
0001400C9C79  cmp     al, 1
0001400C9C7B  adc     eax, 0
0001400C9C7E  mov     byte ptr [rdi + 0x1cf3], al
0001400C9C84  mov     qword ptr [rdi + 0x620], 0
0001400C9C8F  mov     r8, qword ptr [rdi + 0xd8]
0001400C9C96  test    r8, r8
0001400C9C99  je      0x1400c9cad
0001400C9C9B  mov     rcx, qword ptr [rdi + 0xd0]
0001400C9CA2  shl     r8, 2
0001400C9CA6  xor     edx, edx
0001400C9CA8  call    0x1402cba90
0001400C9CAD  mov     r8, qword ptr [rdi + 0xf0]
0001400C9CB4  test    r8, r8
0001400C9CB7  je      0x1400c9ccb
0001400C9CB9  mov     rcx, qword ptr [rdi + 0xe8]
0001400C9CC0  shl     r8, 2
0001400C9CC4  xor     edx, edx
0001400C9CC6  call    0x1402cba90
0001400C9CCB  mov     r8, qword ptr [rdi + 0x108]
0001400C9CD2  test    r8, r8
0001400C9CD5  je      0x1400c9ce9
0001400C9CD7  mov     rcx, qword ptr [rdi + 0x100]
0001400C9CDE  shl     r8, 2
0001400C9CE2  xor     edx, edx
0001400C9CE4  call    0x1402cba90
0001400C9CE9  mov     r8, qword ptr [rdi + 0x120]
0001400C9CF0  test    r8, r8
0001400C9CF3  je      0x1400c9d07
0001400C9CF5  mov     rcx, qword ptr [rdi + 0x118]
0001400C9CFC  shl     r8, 2
0001400C9D00  xor     edx, edx
0001400C9D02  call    0x1402cba90
0001400C9D07  mov     r8, qword ptr [rdi + 0x138]
0001400C9D0E  test    r8, r8
0001400C9D11  je      0x1400c9d25
0001400C9D13  mov     rcx, qword ptr [rdi + 0x130]
0001400C9D1A  shl     r8, 2
0001400C9D1E  xor     edx, edx
0001400C9D20  call    0x1402cba90
0001400C9D25  lea     rcx, [rdi + 0x5f0]
0001400C9D2C  xorps   xmm0, xmm0
0001400C9D2F  movups  xmmword ptr [rdi + 0x898], xmm0
0001400C9D36  mov     qword ptr [rdi + 0x8a8], 0
0001400C9D41  movups  xmmword ptr [rdi + 0x1a28], xmm0
0001400C9D48  mov     rax, qword ptr [rbp + 0x4f8]
0001400C9D4F  mov     byte ptr [rbp + 0x517], al
0001400C9D55  mov     byte ptr [rbp + 0x516], 0
0001400C9D5C  mov     eax, dword ptr [rbp + 0x4e8]
0001400C9D62  mov     byte ptr [rbp + 0x515], al
0001400C9D68  xor     edx, edx
0001400C9D6A  call    0x140158b10
0001400C9D6F  mov     qword ptr [rdi + 0x600], 0
0001400C9D7A  mov     rcx, rdi
0001400C9D7D  call    0x1400085f0
0001400C9D82  mov     rcx, rdi
0001400C9D85  call    0x1400f9160
0001400C9D8A  cmp     byte ptr [rbp + 0x4f8], 0
0001400C9D91  je      0x1400c9d9f
0001400C9D93  lea     rcx, [rbp + 0x248]
0001400C9D9A  call    0x14006dc60
0001400C9D9F  cmp     qword ptr [rbp + 0x508], 0
0001400C9DA7  je      0x1400c9dc2
0001400C9DA9  mov     r8d, 1
0001400C9DAF  mov     rcx, qword ptr [rbp + 0x4c0]
0001400C9DB6  mov     rdx, qword ptr [rbp + 0x508]
0001400C9DBD  call    0x1400549f0
0001400C9DC2  xor     esi, esi
0001400C9DC4  jmp     0x1400c8cae
0001400C9DC9  mov     ecx, 1
0001400C9DCE  mov     edx, 0x13
0001400C9DD3  call    0x1402d4831
0001400C9DD8  ud2     
0001400C9DDA  mov     byte ptr [rbp + 0x517], 1
0001400C9DE1  mov     byte ptr [rbp + 0x516], 1
0001400C9DE8  mov     byte ptr [rbp + 0x515], 1
0001400C9DEF  lea     rcx, [rip + 0x5782fa]   ; [rip -> 0x1406420F0]
0001400C9DF6  call    0x1402d1c80
0001400C9DFB  jmp     0x1400c9997
