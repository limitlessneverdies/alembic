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
