0001400911F0  push    rbp
0001400911F1  push    r15
0001400911F3  push    r14
0001400911F5  push    r13
0001400911F7  push    r12
0001400911F9  push    rsi
0001400911FA  push    rdi
0001400911FB  push    rbx
0001400911FC  mov     eax, 0x1358
000140091201  call    0x1402b7010
000140091206  sub     rsp, rax
000140091209  lea     rbp, [rsp + 0x80]
000140091211  movaps  xmmword ptr [rbp + 0x12c0], xmm6
000140091218  mov     qword ptr [rbp + 0x12b8], 0xfffffffffffffffe
000140091223  mov     rsi, rcx
000140091226  call    0x14009c310
00014009122B  mov     qword ptr [rbp + 0x1240], 0
000140091236  mov     qword ptr [rbp + 0x1248], 8
000140091241  mov     qword ptr [rbp + 0x1250], 0
00014009124C  lea     rdi, [rbp + 0xba0]
000140091253  mov     rcx, rdi
000140091256  call    0x14014aff0
00014009125B  mov     rdx, qword ptr [rbp + 0xba8]
000140091262  mov     r8, qword ptr [rbp + 0xbb0]
000140091269  lea     rcx, [rbp - 0x58]
00014009126D  mov     qword ptr [rbp + 0x12a0], rdx
000140091274  call    0x1401988a0
000140091279  cmp     dword ptr [rbp - 0x58], 2
00014009127D  jne     0x1400912a3
00014009127F  mov     rax, qword ptr [rbp - 0x50]
000140091283  mov     qword ptr [rbp + 0x6e0], rax
00014009128A  mov     qword ptr [rbp + 0x6d8], 2
000140091295  mov     rdx, qword ptr [rbp + 0xba0]
00014009129C  test    rdx, rdx
00014009129F  jne     0x1400912c5
0001400912A1  jmp     0x1400912d7
0001400912A3  lea     rcx, [rbp + 0x6d8]
0001400912AA  lea     rdx, [rbp - 0x58]
0001400912AE  mov     r8d, 0x270
0001400912B4  call    0x1402cb3f0
0001400912B9  mov     rdx, qword ptr [rbp + 0xba0]
0001400912C0  test    rdx, rdx
0001400912C3  je      0x1400912d7
0001400912C5  mov     r8d, 1
0001400912CB  mov     rcx, qword ptr [rbp + 0x12a0]
0001400912D2  call    0x1400549f0
0001400912D7  cmp     dword ptr [rbp + 0x6d8], 2
0001400912DE  jne     0x1400912f1
0001400912E0  lea     rcx, [rbp + 0x6d8]
0001400912E7  call    0x14006ded0
0001400912EC  jmp     0x140091db7
0001400912F1  mov     qword ptr [rbp + 0x1228], rsi
0001400912F8  lea     rbx, [rbp + 0x468]
0001400912FF  lea     rdx, [rbp + 0x6d8]
000140091306  mov     r8d, 0x270
00014009130C  mov     rcx, rbx
00014009130F  call    0x1402cb3f0
000140091314  mov     qword ptr [rbp - 0x58], 0
00014009131C  mov     qword ptr [rbp + 0x208], 0
000140091327  lea     r13, [rbp + 0xbb8]
00014009132E  lea     r12, [rbp + 0xba0]
000140091335  lea     r15, [rbp + 0xfa8]
00014009133C  jmp     0x140091357
00014009133E  nop     
000140091340  mov     edx, 0x18
000140091345  mov     r8d, 8
00014009134B  mov     rcx, qword ptr [rbp + 0x1298]
000140091352  call    0x1400549f0
000140091357  cmp     dword ptr [rbp + 0x468], 2
00014009135E  je      0x140091d8b
000140091364  mov     rcx, r12
000140091367  mov     rdx, rbx
00014009136A  call    0x1401aef80
00014009136F  cmp     qword ptr [rbp + 0xba0], 0
000140091377  je      0x1400913a0
000140091379  mov     r14, qword ptr [rbp + 0xba8]
000140091380  mov     rdi, qword ptr [rbp + 0xbb0]
000140091387  mov     r8d, 0x248
00014009138D  mov     rcx, r15
000140091390  mov     rdx, r13
000140091393  call    0x1402cb3f0
000140091398  jmp     0x140091411
00014009139A  nop     word ptr [rax + rax]
0001400913A0  mov     rax, qword ptr [rbp + 0x468]
0001400913A7  test    rax, rax
0001400913AA  je      0x1400913bd
0001400913AC  cmp     eax, 2
0001400913AF  je      0x1400913d6
0001400913B1  lea     rcx, [rbp + 0x470]
0001400913B8  call    0x1401af9a0
0001400913BD  mov     rax, qword ptr [rbp + 0x478]
0001400913C4  lock dec qword ptr [rax]
0001400913C8  jne     0x1400913d6
0001400913CA  lea     rcx, [rbp + 0x478]
0001400913D1  call    0x14005c450
0001400913D6  mov     qword ptr [rbp + 0x468], 2
0001400913E1  mov     r14, qword ptr [rbp + 0xba8]
0001400913E8  mov     rdi, qword ptr [rbp + 0xbb0]
0001400913EF  movzx   esi, byte ptr [rbp + 0xba0]
0001400913F6  mov     r8d, 0x248
0001400913FC  mov     rcx, r15
0001400913FF  mov     rdx, r13
000140091402  call    0x1402cb3f0
000140091407  test    sil, 1
00014009140B  je      0x140091d8b
000140091411  test    r14, r14
000140091414  jne     0x14009147f
000140091416  mov     eax, edi
000140091418  and     eax, 3
00014009141B  cmp     eax, 1
00014009141E  jne     0x140091357
000140091424  lea     rax, [rdi - 1]
000140091428  mov     qword ptr [rbp + 0x1298], rax
00014009142F  mov     rax, qword ptr [rdi - 1]
000140091433  mov     qword ptr [rbp + 0x12a0], rax
00014009143A  mov     rax, qword ptr [rdi + 7]
00014009143E  mov     qword ptr [rbp + 0x12a8], rax
000140091445  mov     rax, qword ptr [rax]
000140091448  test    rax, rax
00014009144B  je      0x140091456
00014009144D  mov     rcx, qword ptr [rbp + 0x12a0]
000140091454  call    rax
000140091456  mov     rcx, qword ptr [rbp + 0x12a0]
00014009145D  mov     rax, qword ptr [rbp + 0x12a8]
000140091464  mov     rdx, qword ptr [rax + 8]
000140091468  test    rdx, rdx
00014009146B  je      0x140091340
000140091471  mov     r8, qword ptr [rax + 0x10]
000140091475  call    0x1400549f0
00014009147A  jmp     0x140091340
00014009147F  mov     r8d, 0x248
000140091485  lea     rcx, [rbp + 0x958]
00014009148C  mov     rdx, r15
00014009148F  call    0x1402cb3f0
000140091494  mov     qword ptr [rbp + 0x948], r14
00014009149B  mov     qword ptr [rbp + 0x950], rdi
0001400914A2  lea     rcx, [rbp + 0x1208]
0001400914A9  lea     rdx, [rbp + 0x948]
0001400914B0  call    0x140193990
0001400914B5  mov     r14, qword ptr [rbp + 0x1210]
0001400914BC  mov     rdi, qword ptr [rbp + 0x1218]
0001400914C3  mov     rcx, r14
0001400914C6  mov     rdx, rdi
0001400914C9  call    0x1401a4bd0
0001400914CE  test    rax, rax
0001400914D1  je      0x140091510
0001400914D3  mov     r8, rdx
0001400914D6  mov     rcx, r12
0001400914D9  mov     rdx, rax
0001400914DC  call    0x1401bdc60
0001400914E1  cmp     dword ptr [rbp + 0xba0], 1
0001400914E8  je      0x140091510
0001400914EA  cmp     qword ptr [rbp + 0xbb0], 3
0001400914F2  jne     0x140091510
0001400914F4  mov     rax, qword ptr [rbp + 0xba8]
0001400914FB  movzx   ecx, word ptr [rax]
0001400914FE  xor     ecx, 0x6c61
000140091504  movzx   eax, byte ptr [rax + 2]
000140091508  xor     eax, 0x69
00014009150B  or      ax, cx
00014009150E  je      0x14009154c
000140091510  mov     rdx, qword ptr [rbp + 0x1208]
000140091517  test    rdx, rdx
00014009151A  je      0x14009152a
00014009151C  mov     r8d, 1
000140091522  mov     rcx, r14
000140091525  call    0x1400549f0
00014009152A  mov     rax, qword ptr [rbp + 0x948]
000140091531  lock dec qword ptr [rax]
000140091535  jne     0x140091357
00014009153B  lea     rcx, [rbp + 0x948]
000140091542  call    0x14005c450
000140091547  jmp     0x140091357
00014009154C  mov     rcx, r12
00014009154F  mov     rdx, r14
000140091552  mov     r8, rdi
000140091555  call    0x1401bdc60
00014009155A  cmp     dword ptr [rbp + 0xba0], 1
000140091561  je      0x140091934
000140091567  mov     rsi, qword ptr [rbp + 0xba8]
00014009156E  mov     r8, qword ptr [rbp + 0xbb0]
000140091575  mov     dword ptr [rbp + 0xba0], 0
00014009157F  mov     qword ptr [rbp + 0xba8], 0
00014009158A  mov     dword ptr [rbp + 0xbb0], 7
000140091594  lea     rax, [rbp + 0xba8]
00014009159B  mov     dword ptr [rax + 0x13], 0
0001400915A2  mov     qword ptr [rax + 0xc], 0
0001400915AA  mov     byte ptr [rbp + 0xbb8], 1
0001400915B1  mov     rcx, r12
0001400915B4  mov     rdx, rsi
0001400915B7  mov     rdi, r8
0001400915BA  call    0x1401930f0
0001400915BF  test    al, 1
0001400915C1  je      0x14009163f
0001400915C3  mov     eax, edx
0001400915C5  and     eax, 3
0001400915C8  cmp     eax, 1
0001400915CB  jne     0x140091934
0001400915D1  lea     rax, [rdx - 1]
0001400915D5  mov     qword ptr [rbp + 0x1298], rax
0001400915DC  mov     rax, qword ptr [rdx - 1]
0001400915E0  mov     qword ptr [rbp + 0x12a0], rax
0001400915E7  mov     rax, qword ptr [rdx + 7]
0001400915EB  mov     qword ptr [rbp + 0x12a8], rax
0001400915F2  mov     rax, qword ptr [rax]
0001400915F5  test    rax, rax
0001400915F8  je      0x140091603
0001400915FA  mov     rcx, qword ptr [rbp + 0x12a0]
000140091601  call    rax
000140091603  mov     rcx, qword ptr [rbp + 0x12a0]
00014009160A  mov     rax, qword ptr [rbp + 0x12a8]
000140091611  mov     rdx, qword ptr [rax + 8]
000140091615  test    rdx, rdx
000140091618  je      0x140091623
00014009161A  mov     r8, qword ptr [rax + 0x10]
00014009161E  call    0x1400549f0
000140091623  mov     edx, 0x18
000140091628  mov     r8d, 8
00014009162E  mov     rcx, qword ptr [rbp + 0x1298]
000140091635  call    0x1400549f0
00014009163A  jmp     0x140091934
00014009163F  mov     qword ptr [rbp + 0x1280], rdx
000140091646  mov     r8d, 0x400
00014009164C  mov     rcx, r12
00014009164F  xor     edx, edx
000140091651  call    0x1402cba90
000140091656  mov     r8d, 0x400
00014009165C  lea     rcx, [rbp + 0x1280]
000140091663  mov     rdx, r12
000140091666  call    0x1401a83e0
00014009166B  mov     r14, rdx
00014009166E  test    al, 1
000140091670  je      0x1400916ef
000140091672  mov     eax, r14d
000140091675  and     eax, 3
000140091678  cmp     eax, 1
00014009167B  jne     0x140091927
000140091681  lea     rax, [r14 - 1]
000140091685  mov     qword ptr [rbp + 0x1298], rax
00014009168C  mov     rax, qword ptr [r14 - 1]
000140091690  mov     qword ptr [rbp + 0x12a0], rax
000140091697  mov     rax, qword ptr [r14 + 7]
00014009169B  mov     qword ptr [rbp + 0x12a8], rax
0001400916A2  mov     rax, qword ptr [rax]
0001400916A5  test    rax, rax
0001400916A8  je      0x1400916b3
0001400916AA  mov     rcx, qword ptr [rbp + 0x12a0]
0001400916B1  call    rax
0001400916B3  mov     rcx, qword ptr [rbp + 0x12a0]
0001400916BA  mov     rax, qword ptr [rbp + 0x12a8]
0001400916C1  mov     rdx, qword ptr [rax + 8]
0001400916C5  test    rdx, rdx
0001400916C8  je      0x1400916d3
0001400916CA  mov     r8, qword ptr [rax + 0x10]
0001400916CE  call    0x1400549f0
0001400916D3  mov     edx, 0x18
0001400916D8  mov     r8d, 8
0001400916DE  mov     rcx, qword ptr [rbp + 0x1298]
0001400916E5  call    0x1400549f0
0001400916EA  jmp     0x140091927
0001400916EF  mov     rdx, r14
0001400916F2  cmp     r14, 0x401
0001400916F9  jae     0x140091e19
0001400916FF  cmp     rdx, 5
000140091703  jb      0x140091927
000140091709  cmp     dword ptr [rbp + 0xba0], 0x4e494c41
000140091713  jne     0x140091927
000140091719  cmp     rdx, 7
00014009171D  jb      0x140091927
000140091723  movzx   r8d, word ptr [rbp + 0xba5]
00014009172B  lea     rcx, [r8 + 7]
00014009172F  mov     qword ptr [rbp + 0x12a0], rcx
000140091736  cmp     rcx, rdx
000140091739  ja      0x140091927
00014009173F  movzx   eax, byte ptr [rbp + 0xba4]
000140091746  mov     byte ptr [rbp + 0x1258], al
00014009174C  lea     rcx, [rbp + 0x1260]
000140091753  lea     rdx, [rbp + 0xba7]
00014009175A  mov     qword ptr [rbp + 0x1290], r8
000140091761  call    0x1401b2c50
000140091766  mov     rax, qword ptr [rbp + 0x1268]
00014009176D  mov     qword ptr [rbp + 0x12a8], rax
000140091774  mov     rdx, qword ptr [rbp + 0x1270]
00014009177B  mov     qword ptr [rsp + 0x20], 1
000140091784  mov     r9d, 1
00014009178A  mov     rcx, r15
00014009178D  mov     qword ptr [rbp + 0x1298], rdx
000140091794  xor     r8d, r8d
000140091797  call    0x140056aa0
00014009179C  mov     rax, qword ptr [rbp + 0xfb0]
0001400917A3  mov     qword ptr [rbp + 0x1278], rax
0001400917AA  cmp     dword ptr [rbp + 0xfa8], 1
0001400917B1  je      0x140091e3d
0001400917B7  mov     rcx, qword ptr [rbp + 0xfb8]
0001400917BE  mov     qword ptr [rbp + 0x1238], rcx
0001400917C5  mov     rdx, qword ptr [rbp + 0x12a8]
0001400917CC  mov     r8, qword ptr [rbp + 0x1298]
0001400917D3  call    0x1402cb3f0
0001400917D8  mov     rdx, qword ptr [rbp + 0x1260]
0001400917DF  lea     rax, [rdx*2]
0001400917E7  test    rax, rax
0001400917EA  je      0x1400917fe
0001400917EC  mov     r8d, 1
0001400917F2  mov     rcx, qword ptr [rbp + 0x12a8]
0001400917F9  call    0x1400549f0
0001400917FE  cmp     byte ptr [rbp + 0x1258], 3
000140091805  jb      0x1400918f9
00014009180B  mov     rdx, qword ptr [rbp + 0x1290]
000140091812  lea     rax, [rdx + 9]
000140091816  cmp     rax, r14
000140091819  ja      0x140091909
00014009181F  movzx   r8d, word ptr [rbp + rdx + 0xba7]
000140091828  lea     r9, [r8 + rax]
00014009182C  mov     qword ptr [rbp + 0x12a0], r9
000140091833  cmp     r9, r14
000140091836  ja      0x140091909
00014009183C  lea     rdx, [rax + rbp]
000140091840  add     rdx, 0xba0
000140091847  lea     rcx, [rbp + 0x1260]
00014009184E  call    0x1401b2c50
000140091853  mov     rdx, qword ptr [rbp + 0x1268]
00014009185A  mov     r8, qword ptr [rbp + 0x1270]
000140091861  mov     rcx, r15
000140091864  mov     qword ptr [rbp + 0x1230], rdx
00014009186B  call    0x14014b500
000140091870  mov     rax, qword ptr [rbp + 0xfa8]
000140091877  mov     qword ptr [rbp + 0x12a8], rax
00014009187E  mov     rax, qword ptr [rbp + 0xfb0]
000140091885  mov     qword ptr [rbp + 0x1290], rax
00014009188C  mov     rax, qword ptr [rbp + 0xfb8]
000140091893  mov     qword ptr [rbp + 0x1258], rax
00014009189A  mov     rdx, qword ptr [rbp + 0x1260]
0001400918A1  lea     rax, [rdx*2]
0001400918A9  test    rax, rax
0001400918AC  je      0x1400918c0
0001400918AE  mov     r8d, 1
0001400918B4  mov     rcx, qword ptr [rbp + 0x1230]
0001400918BB  call    0x1400549f0
0001400918C0  mov     rax, qword ptr [rbp + 0x12a0]
0001400918C7  add     rax, 0x10
0001400918CB  cmp     rax, r14
0001400918CE  jbe     0x140091996
0001400918D4  cmp     qword ptr [rbp + 0x12a8], 0
0001400918DC  je      0x140091909
0001400918DE  mov     r8d, 1
0001400918E4  mov     rcx, qword ptr [rbp + 0x1290]
0001400918EB  mov     rdx, qword ptr [rbp + 0x12a8]
0001400918F2  call    0x1400549f0
0001400918F7  jmp     0x140091909
0001400918F9  mov     rax, qword ptr [rbp + 0x1290]
000140091900  add     rax, 0x17
000140091904  cmp     rax, r14
000140091907  jbe     0x140091974
000140091909  mov     rdx, qword ptr [rbp + 0x1278]
000140091910  test    rdx, rdx
000140091913  je      0x140091927
000140091915  mov     r8d, 1
00014009191B  mov     rcx, qword ptr [rbp + 0x1238]
000140091922  jmp     0x1400916e5
000140091927  mov     rcx, qword ptr [rbp + 0x1280]
00014009192E  call    qword ptr [rip + 0x5544f4]   ; [rip -> 0x1405E5E28] str='Ne^'
000140091934  mov     rdx, qword ptr [rbp + 0x1208]
00014009193B  test    rdx, rdx
00014009193E  je      0x140091952
000140091940  mov     rcx, qword ptr [rbp + 0x1210]
000140091947  mov     r8d, 1
00014009194D  call    0x1400549f0
000140091952  mov     rax, qword ptr [rbp + 0x948]
000140091959  lock dec qword ptr [rax]
00014009195D  jne     0x140091357
000140091963  lea     rcx, [rbp + 0x948]
00014009196A  call    0x14005c450
00014009196F  jmp     0x140091357
000140091974  mov     eax, 1
000140091979  mov     qword ptr [rbp + 0x1290], rax
000140091980  mov     qword ptr [rbp + 0x1258], 0
00014009198B  mov     qword ptr [rbp + 0x12a8], 0
000140091996  mov     rax, qword ptr [rbp + 0x12a0]
00014009199D  movups  xmm6, xmmword ptr [rbp + rax + 0xba0]
0001400919A5  mov     rcx, r15
0001400919A8  mov     rdx, rsi
0001400919AB  mov     r8, rdi
0001400919AE  call    0x14014b500
0001400919B3  mov     r14, qword ptr [rbp + 0xfa8]
0001400919BA  lea     rax, [rbp + 0xfb0]
0001400919C1  movups  xmm0, xmmword ptr [rax]
0001400919C4  movaps  xmmword ptr [rbp + 0x11f0], xmm0
0001400919CB  mov     rcx, qword ptr [rbp + 0x1280]
0001400919D2  call    qword ptr [rip + 0x554450]   ; [rip -> 0x1405E5E28] str='Ne^'
0001400919D8  mov     rax, r14
0001400919DB  neg     rax
0001400919DE  jo      0x140091934
0001400919E4  mov     qword ptr [rbp + 0xfa8], r14
0001400919EB  movaps  xmm0, xmmword ptr [rbp + 0x11f0]
0001400919F2  lea     rax, [rbp + 0xfb0]
0001400919F9  movups  xmmword ptr [rax], xmm0
0001400919FC  mov     rax, qword ptr [rbp + 0x1278]
000140091A03  mov     qword ptr [rbp + 0xfc0], rax
000140091A0A  mov     rax, qword ptr [rbp + 0x1238]
000140091A11  mov     qword ptr [rbp + 0xfc8], rax
000140091A18  mov     rax, qword ptr [rbp + 0x1298]
000140091A1F  mov     qword ptr [rbp + 0xfd0], rax
000140091A26  mov     rax, qword ptr [rbp + 0x12a8]
000140091A2D  mov     qword ptr [rbp + 0xfd8], rax
000140091A34  mov     rax, qword ptr [rbp + 0x1290]
000140091A3B  mov     qword ptr [rbp + 0xfe0], rax
000140091A42  mov     rax, qword ptr [rbp + 0x1258]
000140091A49  mov     qword ptr [rbp + 0xfe8], rax
000140091A50  mov     dword ptr [rbp + 0xff0], 4
000140091A5A  movups  xmmword ptr [rbp + 0x1000], xmm6
000140091A61  mov     byte ptr [rbp + 0x12b7], 1
000140091A68  mov     rcx, r12
000140091A6B  mov     rdx, rsi
000140091A6E  mov     r8, rdi
000140091A71  call    0x1400bbad0
000140091A76  mov     rax, qword ptr [rbp + 0xba8]
000140091A7D  mov     qword ptr [rbp + 0x12a8], rax
000140091A84  neg     rax
000140091A87  jno     0x140091a98
000140091A89  mov     dword ptr [rbp + 0x12a0], 4
000140091A93  jmp     0x140091c38
000140091A98  mov     r14w, word ptr [rbp + 0xba0]
000140091AA0  mov     di, word ptr [rbp + 0xba2]
000140091AA7  mov     rax, qword ptr [rbp + 0xbb0]
000140091AAE  mov     qword ptr [rbp + 0x1298], rax
000140091AB5  mov     rsi, qword ptr [rbp + 0xbb8]
000140091ABC  mov     rcx, r12
000140091ABF  mov     edx, r14d
000140091AC2  mov     r8d, edi
000140091AC5  lea     r9, [rip + 0x2b2bc4]   ; [rip -> 0x140344690]
000140091ACC  call    0x140178f70
000140091AD1  movzx   eax, r14w
000140091AD5  movzx   r8d, di
000140091AD9  imul    r8, rax
000140091ADD  test    r8, r8
000140091AE0  mov     r10, qword ptr [rbp + 0x1298]
000140091AE7  je      0x140091bb4
000140091AED  mov     ecx, 2
000140091AF2  xor     eax, eax
000140091AF4  lea     rdx, [rcx - 2]
000140091AF8  cmp     rdx, rsi
000140091AFB  jae     0x140091e52
000140091B01  mov     rdx, qword ptr [rbp + 0xbb0]
000140091B08  cmp     rax, rdx
000140091B0B  jae     0x140091e66
000140091B11  mov     rdx, qword ptr [rbp + 0xba8]
000140091B18  movzx   r9d, byte ptr [r10 + rcx - 2]
000140091B1E  mov     byte ptr [rdx + rax], r9b
000140091B22  lea     rdx, [rcx - 1]
000140091B26  cmp     rdx, rsi
000140091B29  jae     0x140091e77
000140091B2F  lea     r9, [rax + 1]
000140091B33  mov     rdx, qword ptr [rbp + 0xbb0]
000140091B3A  cmp     r9, rdx
000140091B3D  jae     0x140091e8b
000140091B43  mov     rdx, qword ptr [rbp + 0xba8]
000140091B4A  movzx   r9d, byte ptr [r10 + rcx - 1]
000140091B50  mov     byte ptr [rdx + rax + 1], r9b
000140091B55  cmp     rcx, rsi
000140091B58  jae     0x140091e9c
000140091B5E  lea     r9, [rax + 2]
000140091B62  mov     rdx, qword ptr [rbp + 0xbb0]
000140091B69  cmp     r9, rdx
000140091B6C  jae     0x140091ead
000140091B72  mov     rdx, qword ptr [rbp + 0xba8]
000140091B79  movzx   r9d, byte ptr [r10 + rcx]
000140091B7E  mov     byte ptr [rdx + rax + 2], r9b
000140091B83  lea     r9, [rax + 3]
000140091B87  mov     rdx, qword ptr [rbp + 0xbb0]
000140091B8E  cmp     r9, rdx
000140091B91  jae     0x140091ebe
000140091B97  mov     rdx, qword ptr [rbp + 0xba8]
000140091B9E  mov     byte ptr [rdx + rax + 3], 0xff
000140091BA3  add     rax, 4
000140091BA7  add     rcx, 3
000140091BAB  dec     r8
000140091BAE  jne     0x140091af4
000140091BB4  lea     rcx, [rbp + 0x1260]
000140091BBB  mov     rdx, r12
000140091BBE  call    0x140179700
000140091BC3  lea     rcx, [rbp + 0x1260]
000140091BCA  mov     dl, 1
000140091BCC  call    0x140179ab0
000140091BD1  mov     eax, dword ptr [rbp + 0x1260]
000140091BD7  mov     dword ptr [rbp + 0x12a0], eax
000140091BDD  lea     rcx, [rbp + 0x1264]
000140091BE4  mov     rax, qword ptr [rcx]
000140091BE7  mov     qword ptr [rbp + 0x1280], rax
000140091BEE  mov     eax, dword ptr [rcx + 8]
000140091BF1  mov     dword ptr [rbp + 0x1288], eax
000140091BF7  mov     rdx, qword ptr [rbp + 0xba0]
000140091BFE  test    rdx, rdx
000140091C01  je      0x140091c15
000140091C03  mov     rcx, qword ptr [rbp + 0xba8]
000140091C0A  mov     r8d, 1
000140091C10  call    0x1400549f0
000140091C15  cmp     qword ptr [rbp + 0x12a8], 0
000140091C1D  je      0x140091c38
000140091C1F  mov     r8d, 1
000140091C25  mov     rcx, qword ptr [rbp + 0x1298]
000140091C2C  mov     rdx, qword ptr [rbp + 0x12a8]
000140091C33  call    0x1400549f0
000140091C38  mov     eax, dword ptr [rbp + 0xff0]
000140091C3E  cmp     eax, 4
000140091C41  je      0x140091c61
000140091C43  cmp     eax, 2
000140091C46  jne     0x140091c61
000140091C48  mov     rax, qword ptr [rbp + 0xff8]
000140091C4F  lock dec qword ptr [rax]
000140091C53  jne     0x140091c61
000140091C55  lea     rcx, [rbp + 0xff8]
000140091C5C  call    0x14016d220
000140091C61  mov     eax, dword ptr [rbp + 0x12a0]
000140091C67  mov     dword ptr [rbp + 0xff0], eax
000140091C6D  mov     eax, dword ptr [rbp + 0x1288]
000140091C73  lea     rcx, [rbp + 0xfb0]
000140091C7A  mov     dword ptr [rcx + 0x4c], eax
000140091C7D  mov     rax, qword ptr [rbp + 0x1280]
000140091C84  mov     qword ptr [rcx + 0x44], rax
000140091C88  mov     rax, qword ptr [rbp + 0x1008]
000140091C8F  mov     qword ptr [rbp + 0xc00], rax
000140091C96  movups  xmm0, xmmword ptr [rbp + 0xff8]
000140091C9D  movaps  xmmword ptr [rbp + 0xbf0], xmm0
000140091CA4  mov     rax, qword ptr [rbp + 0xfe8]
000140091CAB  mov     qword ptr [rbp + 0xbe0], rax
000140091CB2  mov     eax, dword ptr [rbp + 0xff0]
000140091CB8  mov     dword ptr [rbp + 0xbe8], eax
000140091CBE  mov     eax, dword ptr [rbp + 0xff4]
000140091CC4  mov     dword ptr [rbp + 0xbec], eax
000140091CCA  movups  xmm0, xmmword ptr [rbp + 0xfa8]
000140091CD1  movups  xmm1, xmmword ptr [rbp + 0xfb8]
000140091CD8  movups  xmm2, xmmword ptr [rbp + 0xfc8]
000140091CDF  movups  xmm3, xmmword ptr [rbp + 0xfd8]
000140091CE6  movaps  xmmword ptr [rbp + 0xbd0], xmm3
000140091CED  movaps  xmmword ptr [rbp + 0xbc0], xmm2
000140091CF4  movaps  xmmword ptr [rbp + 0xbb0], xmm1
000140091CFB  movaps  xmmword ptr [rbp + 0xba0], xmm0
000140091D02  mov     rdi, qword ptr [rbp + 0x1250]
000140091D09  cmp     rdi, qword ptr [rbp + 0x1240]
000140091D10  jne     0x140091d1e
000140091D12  lea     rcx, [rbp + 0x1240]
000140091D19  call    0x1402cc810
000140091D1E  mov     rax, qword ptr [rbp + 0x1248]
000140091D25  imul    rcx, rdi, 0x68
000140091D29  mov     rdx, qword ptr [rbp + 0xc00]
000140091D30  mov     qword ptr [rax + rcx + 0x60], rdx
000140091D35  movaps  xmm0, xmmword ptr [rbp + 0xbf0]
000140091D3C  movups  xmmword ptr [rax + rcx + 0x50], xmm0
000140091D41  movaps  xmm0, xmmword ptr [rbp + 0xbe0]
000140091D48  movups  xmmword ptr [rax + rcx + 0x40], xmm0
000140091D4D  movaps  xmm0, xmmword ptr [rbp + 0xba0]
000140091D54  movaps  xmm1, xmmword ptr [rbp + 0xbb0]
000140091D5B  movaps  xmm2, xmmword ptr [rbp + 0xbc0]
000140091D62  movaps  xmm3, xmmword ptr [rbp + 0xbd0]
000140091D69  movups  xmmword ptr [rax + rcx + 0x30], xmm3
000140091D6E  movups  xmmword ptr [rax + rcx + 0x20], xmm2
000140091D73  movups  xmmword ptr [rax + rcx + 0x10], xmm1
000140091D78  movups  xmmword ptr [rax + rcx], xmm0
000140091D7C  inc     rdi
000140091D7F  mov     qword ptr [rbp + 0x1250], rdi
000140091D86  jmp     0x140091934
000140091D8B  lea     rcx, [rbp - 0x58]
000140091D8F  call    0x14006dd80
000140091D94  cmp     dword ptr [rbp + 0x6d8], 2
000140091D9B  mov     rsi, qword ptr [rbp + 0x1228]
000140091DA2  lea     rdi, [rbp + 0xba0]
000140091DA9  jne     0x140091db7
000140091DAB  lea     rcx, [rbp + 0x6d8]
000140091DB2  call    0x14006ded0
000140091DB7  mov     rcx, qword ptr [rbp + 0x1248]
000140091DBE  mov     rdx, qword ptr [rbp + 0x1250]
000140091DC5  mov     qword ptr [rbp - 0x58], rdi
000140091DC9  cmp     rdx, 2
000140091DCD  jae     0x140091e02
000140091DCF  mov     rax, qword ptr [rbp + 0x1250]
000140091DD6  mov     qword ptr [rsi + 0x10], rax
000140091DDA  movups  xmm0, xmmword ptr [rbp + 0x1240]
000140091DE1  movups  xmmword ptr [rsi], xmm0
000140091DE4  mov     rax, rsi
000140091DE7  movaps  xmm6, xmmword ptr [rbp + 0x12c0]
000140091DEE  add     rsp, 0x1358
000140091DF5  pop     rbx
000140091DF6  pop     rdi
000140091DF7  pop     rsi
000140091DF8  pop     r12
000140091DFA  pop     r13
000140091DFC  pop     r14
000140091DFE  pop     r15
000140091E00  pop     rbp
000140091E01  ret     
000140091E02  cmp     rdx, 0x15
000140091E06  jae     0x140091e32
000140091E08  lea     r9, [rbp - 0x58]
000140091E0C  mov     r8d, 1
000140091E12  call    0x1401f0d70
000140091E17  jmp     0x140091dcf
000140091E19  lea     r9, [rip + 0x2b91b8]   ; [rip -> 0x14034AFD8]
000140091E20  mov     r8d, 0x400
000140091E26  xor     ecx, ecx
000140091E28  call    0x1402d4bb0
000140091E2D  jmp     0x140091ecd
000140091E32  lea     r8, [rbp - 0x58]
000140091E36  call    0x140055fe0
000140091E3B  jmp     0x140091dcf
000140091E3D  mov     rdx, qword ptr [rbp + 0xfb8]
000140091E44  mov     rcx, qword ptr [rbp + 0x1278]
000140091E4B  call    0x1402d4831
000140091E50  jmp     0x140091ecd
000140091E52  lea     r8, [rip + 0x2b2847]   ; [rip -> 0x1403446A0]
000140091E59  mov     rcx, rdx
000140091E5C  mov     rdx, rsi
000140091E5F  call    0x1402d4f02
000140091E64  jmp     0x140091ecd
000140091E66  lea     r8, [rip + 0x2b284b]   ; [rip -> 0x1403446B8]
000140091E6D  mov     rcx, rax
000140091E70  call    0x1402d4f02
000140091E75  jmp     0x140091ecd
000140091E77  lea     r8, [rip + 0x2b2852]   ; [rip -> 0x1403446D0]
000140091E7E  mov     rcx, rdx
000140091E81  mov     rdx, rsi
000140091E84  call    0x1402d4f02
000140091E89  jmp     0x140091ecd
000140091E8B  lea     r8, [rip + 0x2b2856]   ; [rip -> 0x1403446E8]
000140091E92  mov     rcx, r9
000140091E95  call    0x1402d4f02
000140091E9A  jmp     0x140091ecd
000140091E9C  lea     r8, [rip + 0x2b285d]   ; [rip -> 0x140344700]
000140091EA3  mov     rdx, rsi
000140091EA6  call    0x1402d4f02
000140091EAB  jmp     0x140091ecd
000140091EAD  lea     r8, [rip + 0x2b2864]   ; [rip -> 0x140344718]
000140091EB4  mov     rcx, r9
000140091EB7  call    0x1402d4f02
000140091EBC  jmp     0x140091ecd
000140091EBE  lea     r8, [rip + 0x2b286b]   ; [rip -> 0x140344730]
000140091EC5  mov     rcx, r9
000140091EC8  call    0x1402d4f02
000140091ECD  ud2     
000140091ECF  nop     
