000140081290  push    rbp
000140081291  push    r15
000140081293  push    r14
000140081295  push    rsi
000140081296  push    rdi
000140081297  push    rbx
000140081298  sub     rsp, 0x3b8
00014008129F  lea     rbp, [rsp + 0x80]
0001400812A7  mov     qword ptr [rbp + 0x330], 0xfffffffffffffffe
0001400812B2  mov     r15, rcx
0001400812B5  lea     rcx, [rbp + 0x128]
0001400812BC  call    0x14008de00
0001400812C1  mov     rdx, qword ptr [rbp + 0x130]
0001400812C8  mov     r8, qword ptr [rbp + 0x138]
0001400812CF  lea     rcx, [rbp + 0x2f0]
0001400812D6  mov     qword ptr [rbp + 0x318], rdx
0001400812DD  call    0x1401934b0
0001400812E2  mov     rdx, qword ptr [rbp + 0x128]
0001400812E9  test    rdx, rdx
0001400812EC  je      0x140081300
0001400812EE  mov     r8d, 1
0001400812F4  mov     rcx, qword ptr [rbp + 0x318]
0001400812FB  call    0x1400549f0
000140081300  mov     rcx, qword ptr [rbp + 0x2f0]
000140081307  mov     rdx, qword ptr [rbp + 0x2f8]
00014008130E  mov     rax, rcx
000140081311  neg     rax
000140081314  jno     0x140081334
000140081316  movabs  rcx, 0x8000000000000000
000140081320  add     rsp, 0x3b8
000140081327  pop     rbx
000140081328  pop     rdi
000140081329  pop     rsi
00014008132A  pop     r14
00014008132C  pop     r15
00014008132E  pop     rbp
00014008132F  jmp     0x14006e110
000140081334  mov     qword ptr [rbp + 0x318], rcx
00014008133B  mov     r8, qword ptr [rbp + 0x300]
000140081342  movzx   r9d, byte ptr [r15 + 0x192]
00014008134A  lea     rcx, [rbp + 0x128]
000140081351  mov     qword ptr [rbp + 0x308], rdx
000140081358  call    0x140083b40
00014008135D  mov     rdx, qword ptr [rbp + 0x128]
000140081364  mov     rcx, qword ptr [rbp + 0x130]
00014008136B  mov     rax, rdx
00014008136E  neg     rax
000140081371  jno     0x1400814c4
000140081377  test    rcx, rcx
00014008137A  je      0x1400815a2
000140081380  mov     qword ptr [rbp - 0x60], rcx
000140081384  lea     rsi, [rbp - 0x60]
000140081388  mov     qword ptr [rbp + 0x128], rsi
00014008138F  lea     rdi, [rip + 0x12ceda]   ; [rip -> 0x1401AE270]
000140081396  mov     qword ptr [rbp + 0x130], rdi
00014008139D  lea     rcx, [rip + 0x276ce2]   ; [rip -> 0x1402F8086]
0001400813A4  lea     rdx, [rbp + 0x128]
0001400813AB  call    0x140195710
0001400813B0  mov     qword ptr [rbp + 0x128], rsi
0001400813B7  mov     qword ptr [rbp + 0x130], rdi
0001400813BE  lea     rdx, [rip + 0x276ce8]   ; [rip -> 0x1402F80AD]
0001400813C5  lea     rcx, [rbp + 0x2d8]
0001400813CC  lea     r8, [rbp + 0x128]
0001400813D3  call    0x1401b1160
0001400813D8  mov     rax, qword ptr [rbp + 0x2d8]
0001400813DF  mov     qword ptr [rbp + 0x328], rax
0001400813E6  mov     rax, qword ptr [rbp + 0x2e0]
0001400813ED  mov     qword ptr [rbp + 0x320], rax
0001400813F4  mov     rdi, qword ptr [rbp + 0x2e8]
0001400813FB  mov     rsi, qword ptr [r15 + 0x10]
0001400813FF  cmp     rsi, qword ptr [r15]
000140081402  jne     0x14008140c
000140081404  mov     rcx, r15
000140081407  call    0x1402cc420
00014008140C  mov     rax, qword ptr [r15 + 8]
000140081410  mov     rcx, rsi
000140081413  shl     rcx, 5
000140081417  mov     rdx, qword ptr [rbp + 0x328]
00014008141E  mov     qword ptr [rax + rcx], rdx
000140081422  mov     rdx, qword ptr [rbp + 0x320]
000140081429  mov     qword ptr [rax + rcx + 8], rdx
00014008142E  mov     qword ptr [rax + rcx + 0x10], rdi
000140081433  mov     byte ptr [rax + rcx + 0x18], 6
000140081438  mov     byte ptr [rax + rcx + 0x1e], 0
00014008143D  inc     rsi
000140081440  mov     qword ptr [r15 + 0x10], rsi
000140081444  mov     rax, qword ptr [rbp - 0x60]
000140081448  mov     ecx, eax
00014008144A  and     ecx, 3
00014008144D  cmp     ecx, 1
000140081450  jne     0x1400815a2
000140081456  lea     rcx, [rax - 1]
00014008145A  mov     qword ptr [rbp + 0x310], rcx
000140081461  mov     rcx, qword ptr [rax - 1]
000140081465  mov     qword ptr [rbp + 0x328], rcx
00014008146C  mov     rax, qword ptr [rax + 7]
000140081470  mov     qword ptr [rbp + 0x320], rax
000140081477  mov     rax, qword ptr [rax]
00014008147A  test    rax, rax
00014008147D  je      0x140081488
00014008147F  mov     rcx, qword ptr [rbp + 0x328]
000140081486  call    rax
000140081488  mov     rcx, qword ptr [rbp + 0x328]
00014008148F  mov     rax, qword ptr [rbp + 0x320]
000140081496  mov     rdx, qword ptr [rax + 8]
00014008149A  test    rdx, rdx
00014008149D  je      0x1400814a8
00014008149F  mov     r8, qword ptr [rax + 0x10]
0001400814A3  call    0x1400549f0
0001400814A8  mov     edx, 0x18
0001400814AD  mov     r8d, 8
0001400814B3  mov     rcx, qword ptr [rbp + 0x310]
0001400814BA  call    0x1400549f0
0001400814BF  jmp     0x1400815a2
0001400814C4  mov     qword ptr [rbp + 0x320], rdx
0001400814CB  mov     qword ptr [rbp + 0x328], rcx
0001400814D2  lea     rdx, [rbp + 0x138]
0001400814D9  lea     rcx, [rbp - 0x60]
0001400814DD  mov     r8d, 0x188
0001400814E3  call    0x1402cb3f0
0001400814E8  mov     rdi, qword ptr [rbp + 0x2c0]
0001400814EF  mov     rax, rdi
0001400814F2  neg     rax
0001400814F5  jo      0x140081564
0001400814F7  mov     rsi, qword ptr [rbp + 0x2c8]
0001400814FE  mov     rbx, qword ptr [rbp + 0x2d0]
000140081505  test    rbx, rbx
000140081508  je      0x14008154d
00014008150A  lea     r14, [rsi + 0x28]
00014008150E  jmp     0x140081519
000140081510  add     r14, 0x58
000140081514  dec     rbx
000140081517  je      0x14008154d
000140081519  mov     rdx, qword ptr [r14 - 0x20]
00014008151D  test    rdx, rdx
000140081520  je      0x140081531
000140081522  mov     rcx, qword ptr [r14 - 0x18]
000140081526  mov     r8d, 1
00014008152C  call    0x1400549f0
000140081531  mov     rdx, qword ptr [r14 - 8]
000140081535  test    rdx, rdx
000140081538  je      0x140081510
00014008153A  mov     rcx, qword ptr [r14]
00014008153D  add     rdx, rdx
000140081540  mov     r8d, 1
000140081546  call    0x1400549f0
00014008154B  jmp     0x140081510
00014008154D  test    rdi, rdi
000140081550  je      0x140081564
000140081552  imul    rdx, rdi, 0x58
000140081556  mov     r8d, 8
00014008155C  mov     rcx, rsi
00014008155F  call    0x1400549f0
000140081564  mov     rcx, r15
000140081567  mov     qword ptr [rbp + 0x310], r15
00014008156E  call    0x14006cbc0
000140081573  mov     rax, qword ptr [rbp + 0x320]
00014008157A  mov     rcx, qword ptr [rbp + 0x310]
000140081581  mov     qword ptr [rcx], rax
000140081584  mov     rax, qword ptr [rbp + 0x328]
00014008158B  mov     qword ptr [rcx + 8], rax
00014008158F  add     rcx, 0x10
000140081593  lea     rdx, [rbp - 0x60]
000140081597  mov     r8d, 0x188
00014008159D  call    0x1402cb3f0
0001400815A2  mov     rdx, qword ptr [rbp + 0x318]
0001400815A9  test    rdx, rdx
0001400815AC  mov     rcx, qword ptr [rbp + 0x308]
0001400815B3  je      0x1400815c0
0001400815B5  mov     r8d, 1
0001400815BB  call    0x1400549f0
0001400815C0  nop     
0001400815C1  add     rsp, 0x3b8
0001400815C8  pop     rbx
0001400815C9  pop     rdi
0001400815CA  pop     rsi
0001400815CB  pop     r14
0001400815CD  pop     r15
0001400815CF  pop     rbp
0001400815D0  ret     
0001400815D1  nop     word ptr cs:[rax + rax]
