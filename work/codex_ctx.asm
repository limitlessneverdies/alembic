000140070B80  mulss   xmm6, xmm15
000140070B85  movaps  xmm3, xmm10
000140070B89  addss   xmm3, xmm6
000140070B8D  movss   xmm0, dword ptr [rip + 0x26f10b]   ; [rip -> 0x1402DFCA0]
000140070B95  mulss   xmm0, xmm14
000140070B9A  maxss   xmm0, dword ptr [rip + 0x26e93e]   ; [rip -> 0x1402DF4E0]
000140070BA2  lea     rax, [rip + 0x2870ff]   ; [rip -> 0x1402F7CA8]
000140070BA9  mov     qword ptr [rsp + 0x28], rax
000140070BAE  movss   dword ptr [rsp + 0x20], xmm0
000140070BB4  lea     rcx, [rip + 0x2870e5]   ; [rip -> 0x1402F7CA0] str='CODEX'
000140070BBB  mov     edx, 5
000140070BC0  movaps  xmm2, xmm13
000140070BC4  call    0x14008d580
000140070BC9  mov     r14d, 0x102
000140070BCF  xor     edi, edi
000140070BD1  lea     rsi, [rip + 0x5d142c]   ; [rip -> 0x140642004]
000140070BD8  jmp     0x140070bf1
000140070BDA  nop     word ptr [rax + rax]
