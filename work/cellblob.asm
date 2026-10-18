0001401D4050  push    rbp
0001401D4051  push    rsi
0001401D4052  sub     rsp, 0x88
0001401D4059  lea     rbp, [rsp + 0x80]
0001401D4061  mov     qword ptr [rbp], 0xfffffffffffffffe
0001401D4069  mov     rsi, rcx
0001401D406C  mov     qword ptr [rbp - 8], 0
0001401D4074  movups  xmm0, xmmword ptr [rdx]
0001401D4077  movups  xmm1, xmmword ptr [rdx + 0x10]
0001401D407B  movups  xmm2, xmmword ptr [rdx + 0x20]
0001401D407F  movaps  xmmword ptr [rbp - 0x40], xmm2
0001401D4083  movaps  xmmword ptr [rbp - 0x50], xmm1
0001401D4087  movaps  xmmword ptr [rbp - 0x60], xmm0
0001401D408B  lea     rax, [rbp - 8]
0001401D408F  mov     qword ptr [rbp - 0x30], rax
0001401D4093  lea     rcx, [rbp - 0x20]
0001401D4097  lea     rdx, [rbp - 0x60]
0001401D409B  call    0x1401cd160
0001401D40A0  mov     rax, qword ptr [rbp - 8]
0001401D40A4  test    rax, rax
0001401D40A7  je      0x1401d40d8
0001401D40A9  mov     qword ptr [rsi + 8], rax
0001401D40AD  movabs  rax, 0x8000000000000000
0001401D40B7  mov     qword ptr [rsi], rax
0001401D40BA  mov     rdx, qword ptr [rbp - 0x20]
0001401D40BE  test    rdx, rdx
0001401D40C1  je      0x1401d40e7
0001401D40C3  mov     rcx, qword ptr [rbp - 0x18]
0001401D40C7  shl     rdx, 4
0001401D40CB  mov     r8d, 2
0001401D40D1  call    0x1400549f0
0001401D40D6  jmp     0x1401d40e7
0001401D40D8  mov     rax, qword ptr [rbp - 0x10]
0001401D40DC  mov     qword ptr [rsi + 0x10], rax
0001401D40E0  movups  xmm0, xmmword ptr [rbp - 0x20]
0001401D40E4  movups  xmmword ptr [rsi], xmm0
0001401D40E7  mov     rax, rsi
0001401D40EA  add     rsp, 0x88
0001401D40F1  pop     rsi
0001401D40F2  pop     rbp
0001401D40F3  ret     
0001401D40F4  nop     word ptr cs:[rax + rax]
