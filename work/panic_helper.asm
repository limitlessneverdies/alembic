0001401F7520  push    rbp
0001401F7521  push    r14
0001401F7523  push    rsi
0001401F7524  push    rdi
0001401F7525  push    rbx
0001401F7526  sub     rsp, 0x40
0001401F752A  lea     rbp, [rsp + 0x40]
0001401F752F  mov     qword ptr [rbp - 8], 0xfffffffffffffffe
0001401F7537  mov     rsi, rdx
0001401F753A  mov     ebx, ecx
0001401F753C  mov     rdi, qword ptr [rdx]
0001401F753F  mov     r14, qword ptr [rdx + 8]
0001401F7543  call    0x140007ed0
0001401F7548  mov     ecx, 0x18
0001401F754D  mov     edx, 8
0001401F7552  call    0x1400549e0
0001401F7557  test    rax, rax
0001401F755A  je      0x1401f7585
0001401F755C  mov     rcx, qword ptr [rsi + 0x10]
0001401F7560  mov     qword ptr [rax + 0x10], rcx
0001401F7564  movups  xmm0, xmmword ptr [rsi]
0001401F7567  movups  xmmword ptr [rax], xmm0
0001401F756A  lea     r8, [rip + 0x3bec6f]   ; [rip -> 0x1405B61E0]
0001401F7571  mov     ecx, ebx
0001401F7573  mov     rdx, rax
0001401F7576  add     rsp, 0x40
0001401F757A  pop     rbx
0001401F757B  pop     rdi
0001401F757C  pop     rsi
0001401F757D  pop     r14
0001401F757F  pop     rbp
0001401F7580  jmp     0x140194bb0
0001401F7585  mov     qword ptr [rbp - 0x10], r14
0001401F7589  mov     qword ptr [rbp - 0x18], rdi
0001401F758D  mov     ecx, 8
0001401F7592  mov     edx, 0x18
0001401F7597  call    0x1402d4818
0001401F759C  ud2     
0001401F759E  nop     
