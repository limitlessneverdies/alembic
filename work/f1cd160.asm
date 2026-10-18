0001401CD160  push    rbp
0001401CD161  push    r15
0001401CD163  push    r14
0001401CD165  push    r13
0001401CD167  push    r12
0001401CD169  push    rsi
0001401CD16A  push    rdi
0001401CD16B  push    rbx
0001401CD16C  sub     rsp, 0xd8
0001401CD173  lea     rbp, [rsp + 0x80]
0001401CD17B  mov     qword ptr [rbp + 0x50], 0xfffffffffffffffe
0001401CD183  mov     rdi, rdx
0001401CD186  mov     rsi, rcx
0001401CD189  mov     r9, qword ptr [rdx + 0x30]
0001401CD18D  lea     rcx, [rbp - 0x50]
0001401CD191  lea     r8, [rbp + 0x4f]
0001401CD195  call    0x1401e8230
0001401CD19A  movzx   ebx, byte ptr [rbp - 0x41]
0001401CD19E  cmp     bl, 0x8e
0001401CD1A1  je      0x1401cd1b8
0001401CD1A3  mov     rax, qword ptr [rbp - 0x50]
0001401CD1A7  mov     rcx, qword ptr [rbp - 0x49]
0001401CD1AB  mov     qword ptr [rbp + 0x37], rcx
0001401CD1AF  mov     qword ptr [rbp + 0x30], rax
0001401CD1B3  cmp     bl, 0x8d
0001401CD1B6  jne     0x1401cd1d4
0001401CD1B8  mov     qword ptr [rsi], 0
0001401CD1BF  mov     qword ptr [rsi + 8], 2
0001401CD1C7  mov     qword ptr [rsi + 0x10], 0
0001401CD1CF  jmp     0x1401cd337
0001401CD1D4  mov     rax, qword ptr [rbp + 0x30]
0001401CD1D8  mov     rcx, qword ptr [rbp + 0x37]
0001401CD1DC  mov     qword ptr [rbp + 0x27], rcx
0001401CD1E0  mov     qword ptr [rbp + 0x20], rax
0001401CD1E4  mov     rax, qword ptr [rdi + 0x30]
0001401CD1E8  cmp     qword ptr [rax], 0
0001401CD1EC  jne     0x1401cd1f9
0001401CD1EE  cmp     qword ptr [rdi + 0x20], 0
0001401CD1F3  je      0x1401cd35c
0001401CD1F9  call    0x140007ed0
0001401CD1FE  mov     ecx, 0x40
0001401CD203  mov     edx, 2
0001401CD208  call    0x1400549e0
0001401CD20D  test    rax, rax
0001401CD210  je      0x1401cd368
0001401CD216  mov     r12, rax
0001401CD219  mov     rax, qword ptr [rbp + 0x20]
0001401CD21D  mov     rcx, qword ptr [rbp + 0x27]
0001401CD221  mov     qword ptr [r12 + 7], rcx
0001401CD226  mov     qword ptr [r12], rax
0001401CD22A  mov     byte ptr [r12 + 0xf], bl
0001401CD22F  mov     qword ptr [rbp + 0x30], 4
0001401CD237  mov     qword ptr [rbp + 0x38], r12
0001401CD23B  mov     qword ptr [rbp + 0x40], 1
0001401CD243  mov     rax, qword ptr [rdi + 0x30]
0001401CD247  mov     qword ptr [rbp - 0x20], rax
0001401CD24B  movups  xmm0, xmmword ptr [rdi]
0001401CD24E  movups  xmm1, xmmword ptr [rdi + 0x10]
0001401CD252  movups  xmm2, xmmword ptr [rdi + 0x20]
0001401CD256  movaps  xmmword ptr [rbp - 0x30], xmm2
0001401CD25A  movaps  xmmword ptr [rbp - 0x40], xmm1
0001401CD25E  movaps  xmmword ptr [rbp - 0x50], xmm0
0001401CD262  mov     edi, 1
0001401CD267  lea     rbx, [rbp - 0x10]
0001401CD26B  lea     r14, [rbp - 0x50]
0001401CD26F  lea     r15, [rbp + 0x4f]
0001401CD273  jmp     0x1401cd2a4
0001401CD275  nop     word ptr cs:[rax + rax]
0001401CD280  mov     rax, rdi
0001401CD283  shl     rax, 4
0001401CD287  mov     rcx, qword ptr [rbp + 0x10]
0001401CD28B  mov     rdx, qword ptr [rbp + 0x17]
0001401CD28F  mov     qword ptr [r12 + rax + 7], rdx
0001401CD294  mov     qword ptr [r12 + rax], rcx
0001401CD298  mov     byte ptr [r12 + rax + 0xf], r13b
0001401CD29D  inc     rdi
0001401CD2A0  mov     qword ptr [rbp + 0x40], rdi
0001401CD2A4  mov     r9, qword ptr [rbp - 0x20]
0001401CD2A8  mov     rcx, rbx
0001401CD2AB  mov     rdx, r14
0001401CD2AE  mov     r8, r15
0001401CD2B1  call    0x1401e8230
0001401CD2B6  movzx   r13d, byte ptr [rbp - 1]
0001401CD2BB  cmp     r13b, 0x8e
0001401CD2BF  je      0x1401cd328
0001401CD2C1  mov     rax, qword ptr [rbp - 0x10]
0001401CD2C5  mov     rcx, qword ptr [rbp - 9]
0001401CD2C9  mov     qword ptr [rbp + 7], rcx
0001401CD2CD  mov     qword ptr [rbp], rax
0001401CD2D1  cmp     r13b, 0x8d
0001401CD2D5  je      0x1401cd328
0001401CD2D7  mov     rax, qword ptr [rbp]
0001401CD2DB  mov     rcx, qword ptr [rbp + 7]
0001401CD2DF  mov     qword ptr [rbp + 0x17], rcx
0001401CD2E3  mov     qword ptr [rbp + 0x10], rax
0001401CD2E7  cmp     rdi, qword ptr [rbp + 0x30]
0001401CD2EB  jne     0x1401cd280
0001401CD2ED  mov     rax, qword ptr [rbp - 0x20]
0001401CD2F1  cmp     qword ptr [rax], 0
0001401CD2F5  jne     0x1401cd2fe
0001401CD2F7  cmp     qword ptr [rbp - 0x30], 0
0001401CD2FC  je      0x1401cd34e
0001401CD2FE  mov     qword ptr [rsp + 0x20], 0x10
0001401CD307  mov     r8d, 1
0001401CD30D  mov     r9d, 2
0001401CD313  lea     rcx, [rbp + 0x30]
0001401CD317  mov     rdx, rdi
0001401CD31A  call    0x1402cc040
0001401CD31F  mov     r12, qword ptr [rbp + 0x38]
0001401CD323  jmp     0x1401cd280
0001401CD328  mov     rax, qword ptr [rbp + 0x40]
0001401CD32C  mov     qword ptr [rsi + 0x10], rax
0001401CD330  movups  xmm0, xmmword ptr [rbp + 0x30]
0001401CD334  movups  xmmword ptr [rsi], xmm0
0001401CD337  mov     rax, rsi
0001401CD33A  add     rsp, 0xd8
0001401CD341  pop     rbx
0001401CD342  pop     rdi
0001401CD343  pop     rsi
0001401CD344  pop     r12
0001401CD346  pop     r13
0001401CD348  pop     r14
0001401CD34A  pop     r15
0001401CD34C  pop     rbp
0001401CD34D  ret     
0001401CD34E  lea     rcx, [rip + 0x29bb63]   ; [rip -> 0x140468EB8]
0001401CD355  call    0x1402d4da0
0001401CD35A  ud2     
0001401CD35C  lea     rcx, [rip + 0x29bb55]   ; [rip -> 0x140468EB8]
0001401CD363  call    0x1402d4da0
0001401CD368  mov     ecx, 2
0001401CD36D  mov     edx, 0x40
0001401CD372  call    0x1402d4831
0001401CD377  int3    
0001401CD378  nop     dword ptr [rax + rax]
