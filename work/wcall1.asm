00014000EB20  mov     byte ptr [rax + 0x2982], 4
00014000EB27  mov     word ptr [rax + 0x2985], 0x500
00014000EB30  jmp     0x14001eea3
00014000EB35  mov     rax, qword ptr [rbp + 0x2580]
00014000EB3C  mov     byte ptr [rax + 0x2982], 3
00014000EB43  mov     qword ptr [rax + 0x2580], 0
00014000EB4E  jmp     0x14001eea3
00014000EB53  mov     rax, qword ptr [rbp + 0x2580]
00014000EB5A  mov     byte ptr [rax + 0x2982], 4
00014000EB61  mov     word ptr [rax + 0x2985], 0
00014000EB6A  jmp     0x14001eea3
00014000EB6F  xor     eax, eax
00014000EB71  mov     rsi, qword ptr [rbp + 0x2580]
00014000EB78  cmp     rax, qword ptr [rsi + 0x25a0]
00014000EB7F  jo      0x14000ebba
00014000EB81  lea     rcx, [rsi + 0x360]
00014000EB88  mov     rdx, qword ptr [rsi + 0x25a8]
00014000EB8F  mov     r8, qword ptr [rsi + 0x25b0]
00014000EB96  mov     r9, qword ptr [rsi + 0x25c0]
00014000EB9D  movups  xmm0, xmmword ptr [rsi + 0x25c8]
00014000EBA4  movups  xmmword ptr [rsp + 0x20], xmm0
00014000EBA9  call    0x1400cf7f0
00014000EBAE  test    rax, rax
00014000EBB1  mov     rsi, qword ptr [rbp + 0x2580]
00014000EBB8  jne     0x14000ebe1
00014000EBBA  lea     rdx, [rsi + 0x9d0]
00014000EBC1  mov     rcx, rbx
00014000EBC4  call    0x14007f820
00014000EBC9  mov     rcx, rbx
00014000EBCC  call    0x140081b00
00014000EBD1  test    rax, rax
00014000EBD4  mov     rsi, qword ptr [rbp + 0x2580]
00014000EBDB  je      0x140015c94
00014000EBE1  mov     qword ptr [rbp + 0x23e0], rax
00014000EBE8  mov     byte ptr [rsi + 0x2989], 0
00014000EBEF  lea     rax, [rbp + 0x23e0]
00014000EBF6  mov     qword ptr [rbp + 0x2500], rax
00014000EBFD  lea     rax, [rip + 0x19f66c]   ; [rip -> 0x1401AE270]
00014000EC04  mov     qword ptr [rbp + 0x2508], rax
00014000EC0B  lea     rdx, [rip + 0x2d1c6e]   ; [rip -> 0x1402E0880]
00014000EC12  lea     rcx, [rbp + 0x380]
00014000EC19  lea     r8, [rbp + 0x2500]
00014000EC20  call    0x1401b1160
00014000EC25  movups  xmm0, xmmword ptr [rbp + 0x380]
00014000EC2C  movaps  xmmword ptr [rbp + 0x2470], xmm0
00014000EC33  mov     rax, qword ptr [rbp + 0x390]
00014000EC3A  mov     qword ptr [rbp + 0x2480], rax
00014000EC41  mov     qword ptr [rsp + 0x20], 1
00014000EC4A  lea     rdx, [rip + 0x2d9a13]   ; [rip -> 0x1402E8664] str='Save failed: {}Instance reloadedLoad failed: {}PntHeatPrsPip'
00014000EC51  lea     rcx, [rbp + 0x380]
00014000EC58  lea     r9, [rbp + 0x2470]
00014000EC5F  mov     r8d, 0xf
00014000EC65  call    0x1401548f0
00014000EC6A  mov     rax, qword ptr [rbp + 0x390]
00014000EC71  mov     qword ptr [rbp + 0x2420], rax
00014000EC78  movups  xmm0, xmmword ptr [rbp + 0x380]
00014000EC7F  movaps  xmmword ptr [rbp + 0x2410], xmm0
00014000EC86  mov     rax, qword ptr [rbp + 0x2580]
00014000EC8D  lea     rsi, [rax + 0x27c8]
00014000EC94  mov     rdx, qword ptr [rax + 0x27c8]
00014000EC9B  mov     rax, rdx
00014000EC9E  neg     rax
