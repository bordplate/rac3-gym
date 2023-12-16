# Function: FUN_000a4b60, Instruction Count: 55325
# Function: FUN_0019dab0, Instruction Count: 10631
# Function: FUN_0018a550, Instruction Count: 9111
# Function: FUN_00195fc0, Instruction Count: 7136
# Function: FUN_001c55c0, Instruction Count: 3985
# Function: load_gameplay, Instruction Count: 2851
# Function: FUN_006bb820, Instruction Count: 2298
# Function: FUN_004e1ed0, Instruction Count: 2200
# Function: FUN_00a1c118, Instruction Count: 2183
# Function: FUN_00a8ff00, Instruction Count: 2174
# Function: FUN_00033778, Instruction Count: 2027
# Function: FUN_00144dc0, Instruction Count: 2009
# Function: FUN_00969028, Instruction Count: 1970
# Function: FUN_00097cb0, Instruction Count: 1919
# Function: FUN_008d1920, Instruction Count: 1902
# Function: FUN_0009a7e8, Instruction Count: 1895
# Function: FUN_00148c6c, Instruction Count: 1850
# Function: FUN_00a6755c, Instruction Count: 1755
# Function: FUN_0017d9c8, Instruction Count: 1742
# Function: FUN_001d6ce0, Instruction Count: 1679
# Function: FUN_004db678, Instruction Count: 1664
# Function: FUN_000956c0, Instruction Count: 1640
# Function: FUN_00adb804, Instruction Count: 1614
# Function: FUN_008e8dac, Instruction Count: 1613
# Function: FUN_00949de8, Instruction Count: 1606
# Function: FUN_000243a8, Instruction Count: 1560
# Function: FUN_003dd4e0, Instruction Count: 1505
# Function: FUN_007c6660, Instruction Count: 1457
# Function: FUN_00495118, Instruction Count: 1454
# Function: FUN_003b51e0, Instruction Count: 1432
# Function: FUN_00a958b8, Instruction Count: 1414
# Function: FUN_003957a8, Instruction Count: 1412
# Function: FUN_00142cd0, Instruction Count: 1393
# Function: FUN_005627e0, Instruction Count: 1377
# Function: FUN_00219978, Instruction Count: 1308
# Function: FUN_00276c28, Instruction Count: 1305
# Function: ???_qwark_update_func, Instruction Count: 1302
# Function: FUN_003aeca8, Instruction Count: 1299
# Function: FUN_009c85d8, Instruction Count: 1281
# Function: FUN_00acaca4, Instruction Count: 1275
# Function: FUN_00291060, Instruction Count: 1274
# Function: FUN_00956b78, Instruction Count: 1272
# Function: FUN_00359d50, Instruction Count: 1266
# Function: FUN_0053c578, Instruction Count: 1261
# Function: FUN_0061d4c8, Instruction Count: 1261
# Function: FUN_0002a058, Instruction Count: 1214
# Function: FUN_00a5a4f0, Instruction Count: 1205
# Function: FUN_007023a0, Instruction Count: 1198
# Function: FUN_00453080, Instruction Count: 1195
# Function: FUN_00659748, Instruction Count: 1193
# Function: FUN_004433b0, Instruction Count: 1191
# Function: FUN_0074f278, Instruction Count: 1188
# Function: FUN_0076ad68, Instruction Count: 1186
# Function: FUN_006160b8, Instruction Count: 1175
# Function: FUN_005c8898, Instruction Count: 1163
# Function: FUN_00596e20, Instruction Count: 1155
# Function: FUN_00a9efd8, Instruction Count: 1117
# Function: FUN_0009c590, Instruction Count: 1112
# Function: FUN_0009d708, Instruction Count: 1098
# Function: FUN_0077e490, Instruction Count: 1097
# Function: FUN_00587f28, Instruction Count: 1095
# Function: FUN_0073e530, Instruction Count: 1093
# Function: FUN_0094d4f0, Instruction Count: 1081
# Function: FUN_00268da0, Instruction Count: 1067
# Function: FUN_0011eb3c, Instruction Count: 1051
# Function: FUN_009a69c4, Instruction Count: 1034
# Function: FUN_00a6b1f0, Instruction Count: 1030
# Function: FUN_002e46d4, Instruction Count: 1024
# Function: FUN_008c9970, Instruction Count: 1019
# Function: FUN_006e99d0, Instruction Count: 1009
# Function: FUN_000eaa18, Instruction Count: 1006
# Function: FUN_003433f8, Instruction Count: 998
# Function: FUN_0096b838, Instruction Count: 998
# Function: FUN_006f3348, Instruction Count: 997
# Function: FUN_003e1980, Instruction Count: 992
# Function: FUN_0021bca8, Instruction Count: 992
# Function: FUN_000f7438, Instruction Count: 986
# Function: FUN_00705d70, Instruction Count: 983
# Function: FUN_009821e8, Instruction Count: 982
# Function: FUN_0094f5b0, Instruction Count: 981
# Function: FUN_0015d0f8, Instruction Count: 969
# Function: FUN_007e99a8, Instruction Count: 968
# Function: FUN_002189d0, Instruction Count: 963
# Function: FUN_00183ea8, Instruction Count: 958
# Function: FUN_002e5d20, Instruction Count: 956
# Function: FUN_008d989c, Instruction Count: 952
# Function: FUN_00011638, Instruction Count: 950
# Function: FUN_008afb60, Instruction Count: 941
# Function: FUN_00740058, Instruction Count: 940
# Function: FUN_008f4dd0, Instruction Count: 940
# Function: FUN_00929948, Instruction Count: 938
# Function: FUN_004a7410, Instruction Count: 937
# Function: FUN_009b6a58, Instruction Count: 932
# Function: FUN_0033a5c0, Instruction Count: 931
# Function: FUN_009dc278, Instruction Count: 930
# Function: FUN_005d88a0, Instruction Count: 927
# Function: FUN_004f1910, Instruction Count: 925
# Function: FUN_00168250, Instruction Count: 925
# Function: FUN_004d5e20, Instruction Count: 924
# Function: FUN_0020f558, Instruction Count: 922

# Cyberchef Recipe from Ghidra listing
# Find_/_Replace({'option':'Regex','string':'^ *'},'',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'00[a-f0-9]*\\(.\\)[, ]'},'',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'undefined[\\d] *Stack\\[\\-0x'},'.set local_',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'(\\]:8) *local_'},', -0x',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'   local_'},', -0x',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'XREF.*'},'',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'^(?:[\\t ]*(?:\\r?\\n|\\r))+'},'',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'(?<=^(FUN|LAB)_00[a-f0-9]{6})'},':',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'(?=^(FUN|LAB)_00[a-f0-9]{6})'},'\\n',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'\\= [A-Z0-9\\?]{1,8}.*$'},'',true,false,true,false)
# Find_/_Replace({'option':'Regex','string':'00[0-9a-z]{6} ([0-9a-z]{2} ){4}\\s*'},'',true,false,true,false)



.global _shk_prx_elf_substitute_impl
_shk_prx_elf_substitute_impl:
.int ._shk_prx_elf_substitute_impl
.int _shk_elf_toc

# function extracted from the game to make extra room for code
.global ._shk_prx_elf_substitute_impl
._shk_prx_elf_substitute_impl:
.set param_9, 0xb
.set param_10, 0xf
.set param_11, 0x10
.set param_12, 0x74
.set param_13, 0x7c
.set param_14, 0x94
.set param_15, 0x9c
.set param_16, 0xa4
.set local_8, -0x8
.set local_10, -0x10
.set local_18, -0x18
.set local_20, -0x20
.set local_28, -0x28
.set local_30, -0x30
.set local_38, -0x38
.set local_40, -0x40
.set local_48, -0x48
.set local_50, -0x50
.set local_58, -0x58
.set local_60, -0x60
.set local_68, -0x68
.set local_70, -0x70
.set local_78, -0x78
.set local_80, -0x80
.set local_88, -0x88
.set local_90, -0x90
.set local_98, -0x98
.set local_a0, -0xa0
.set local_a8, -0xa8
.set local_b0, -0xb0
.set local_b8, -0xb8
.set local_c0, -0xc0
.set local_c8, -0xc8
.set local_d0, -0xd0
.set local_d8, -0xd8
.set local_e0, -0xe0
.set local_e8, -0xe8
.set local_f0, -0xf0
.set local_f8, -0xf8
.set local_100, -0x100
.set local_108, -0x108
.set local_110, -0x110
.set local_118, -0x118
.set local_120, -0x120
.set local_128, -0x128
.set local_130, -0x130
.set local_138, -0x138
.set local_140, -0x140
.set local_148, -0x148
.set local_150, -0x150
.set local_158, -0x158
.set local_160, -0x160
.set local_168, -0x168
.set local_170, -0x170
.set local_178, -0x178
.set local_180, -0x180
.set local_188, -0x188
.set local_1b8, -0x1b8
.set local_1c8, -0x1c8
.set local_1d4, -0x1d4
.set local_1d8, -0x1d8
.set local_1dc, -0x1dc
.set local_1e0, -0x1e0
.set local_1e4, -0x1e4
.set local_1e8, -0x1e8
.set local_1f4, -0x1f4
.set local_1f8, -0x1f8
.set local_1fc, -0x1fc
.set local_200, -0x200
.set local_204, -0x204
.set local_208, -0x208
.set local_214, -0x214
.set local_218, -0x218
.set local_21c, -0x21c
.set local_220, -0x220
.set local_224, -0x224
.set local_228, -0x228
.set local_234, -0x234
.set local_238, -0x238
.set local_23c, -0x23c
.set local_240, -0x240
.set local_244, -0x244
.set local_248, -0x248
.set local_24c, -0x24c
.set local_250, -0x250
.set local_254, -0x254
.set local_258, -0x258
.set local_25c, -0x25c
.set local_260, -0x260
.set local_264, -0x264
.set local_268, -0x268
.set local_26c, -0x26c
.set local_270, -0x270
.set local_2b8, -0x2b8
.set local_2e0, -0x2e0

stdu       r1,local_2e0(r1)
mfspr      r0,LR
std        r0,param_11(r1)
stfd       f14,local_90(r1)
stfd       f15,local_88(r1)
stfd       f16,local_80(r1)
stfd       f17,local_78(r1)
stfd       f18,local_70(r1)
stfd       f19,local_68(r1)
stfd       f20,local_60(r1)
stfd       f21,local_58(r1)
stfd       f22,local_50(r1)
stfd       f23,local_48(r1)
stfd       f24,local_40(r1)
stfd       f25,local_38(r1)
stfd       f26,local_30(r1)
stfd       f27,local_28(r1)
stfd       f28,local_20(r1)
stfd       f29,local_18(r1)
stfd       f30,local_10(r1)
stfd       f31,local_8(r1)
lis        r7,0xcc
fmr        f20,f1
li         r6,0x2e0
std        r31,local_98(r1)
fmr        f21,f2
ori        r31,r3,0x0
fmr        f18,f4
addc       r6,r1,r6
std        r16,local_110(r1)
fmr        f19,f5
lis        r16,0x21
std        r18,local_100(r1)
lwz        r7,-0x5818(r7)
ori        r18,r1,0x0
subi       r16,r16,0xad4
lwz        r8,param_16(r6)
ori        r3,r9,0x0
lwz        r11,param_12(r6)
extsh      r8,r8
std        r30,local_a0(r1)
lwz        r12,param_13(r6)
lwz        r30,param_14(r6)
lwz        r6,param_15(r6)
std        r8,local_180(r1)
std        r11,local_138(r1)
std        r12,local_150(r1)
lbz        r7,0xc8(r7)
std        r30,local_188(r1)
std        r6,local_158(r1)
cmpwi      r7,0x0
std        r31,local_160(r1)
std        r5,local_148(r1)
std        r10,local_140(r1)
std        r29,local_a8(r1)
std        r28,local_b0(r1)
std        r27,local_b8(r1)
std        r26,local_c0(r1)
std        r25,local_c8(r1)
std        r24,local_d0(r1)
std        r23,local_d8(r1)
std        r22,local_e0(r1)
std        r21,local_e8(r1)
std        r20,local_f0(r1)
std        r19,local_f8(r1)
std        r17,local_108(r1)
std        r15,local_118(r1)
std        r14,local_120(r1)
stfd       f3,local_178(r1)
bne        LAB_0020f678
li         r3,0x0
b          LAB_00210324

LAB_0020f678:
li         r9,0x0
std        r3,local_130(r1)
lfs        f16,0x0(r16)
lis        r5,0x3f80
stw        r9,0x0(r3)
lfs        f25,0x4(r16)
stw        r9,local_1b8(r1)
fcmpu      cr1,f21,f25
fcmpu      cr0,f20,f25
lfs        f14,0x8(r16)
stw        r5,local_1c8(r1)
cror       eq,eq,4*cr1+eq
beq        LAB_0020f6b8
lfd        f7,local_178(r1)
fcmpu      cr0,f7,f25
bne        LAB_0020f6c0

LAB_0020f6b8:
ori        r3,r9,0x0
b          LAB_00210324

LAB_0020f6c0:
lwz        r3,0x0(r4)
lwz        r5,0x4(r4)
lfs        f3,0x0(r4)
lfs        f4,0x4(r4)
fabs       f5,f3
fabs       f2,f4
stw        r9,local_270(r1)
rlwinm     r5,r5,0x3,0x1d,0x1d
lis        r15,0xc4
addic      r15,r15,0x3b00
fsubs      f1,f5,f2
stfs       f1,local_24c(r1)
lfs        f17,0xc(r16)
lwz        r6,local_24c(r1)
lfs        f1,local_24c(r1)
rlwimi     r5,r6,0x2,0x1e,0x1e
fsub       f6,f1,f25
fsub       f8,f1,f25
rlwimi     r5,r3,0x4,0x1c,0x1c
ori        r6,r15,0x0
rlwinm     r3,r5,0x2,0x0,0x1d
rlwimi     r6,r5,0x2,0x1a,0x1c
rldicl     r5,r6,0x0,0x20
lfsx       f1,r15,r3
fsel       f6,f6,f5,f2
fsel       f5,f8,f2,f5
lfs        f2,0x4(r5)
fcmpu      cr0,f6,f25
bgt        LAB_0020f73c
stfs       f25,local_128(r1)
b          LAB_0020f858

LAB_0020f73c:
fsubs      f8,f5,f6
fadds      f5,f5,f6
addic      r3,r1,0x10
li         r8,0x2
addic      r5,r3,0xe8
addic      r6,r3,0xf8
mtspr      CTR,r8
fdivs      f5,f8,f5
fmuls      f6,f5,f5
stfs       f5,local_1e8(r18)
stfs       f5,local_1e4(r18)
stfs       f5,local_1e0(r18)
stfs       f5,local_1dc(r18)
lfs        f5,local_1dc(r1)
lfs        f8,local_1e4(r1)
lfs        f10,local_1e0(r1)
fmuls      f9,f6,f6
fmuls      f8,f8,f6
fmuls      f11,f5,f9
fmuls      f10,f10,f9
fmuls      f5,f9,f9
stfs       f8,local_1e4(r1)
fmuls      f6,f11,f6
stfs       f10,local_1e0(r1)
stfs       f6,local_1dc(r1)

LAB_0020f7a0:
lfs        f6,local_1e8(r3)
fmuls      f6,f6,f5
stfs       f6,local_1d8(r3)
lfs        f6,local_1e4(r5)
addic      r3,r3,0x8
addic      r5,r5,0x8
fmuls      f6,f6,f5
stfs       f6,local_1d4(r6)
addic      r6,r6,0x8
bdnz       LAB_0020f7a0
li         r6,0x4
ori        r3,r1,0x0
mtspr      CTR,r6
lis        r5,0xc4
addic      r6,r3,0xf8
addic      r5,r5,0x3ae0
ori        r7,r6,0x0

LAB_0020f7e4:
lfs        f5,local_1e8(r3)
lfs        f6,0x0(r5)

fmuls      f5,f5,f6
lfs        f6,0x4(r5)

addic      r5,r5,0x8
stfs       f5,local_1e8(r3)
lfs        f5,local_1e4(r6)
addic      r3,r3,0x8
fmuls      f5,f5,f6
stfs       f5,local_1e4(r6)
addic      r6,r6,0x8
bdnz       LAB_0020f7e4
fmr        f5,f25
ori        r3,r1,0x0
mtspr      CTR,r8

LAB_0020f820:
lfs        f6,local_1e8(r3)
fadds      f5,f5,f6
addic      r3,r3,0x10
lfs        f6,local_1e4(r7)
lfs        f8,local_1e0(r7)
lfs        f9,local_1dc(r7)
addic      r7,r7,0x10
fadds      f5,f5,f6
fadds      f5,f5,f8
fadds      f5,f5,f9
bdnz       LAB_0020f820
fadds      f5,f5,f17
fmadds     f1,f5,f1,f2
stfs       f1,local_128(r1)

LAB_0020f858:
fmuls      f1,f4,f4
lwz        r3,0x8(r4)
lfs        f2,0x8(r4)
fabs       f2,f2
rlwinm     r3,r3,0x3,0x1d,0x1d
fmadds     f1,f3,f3,f1
fsqrts     f1,f1
fabs       f5,f1
stfs       f1,local_254(r1)
fsubs      f1,f5,f2
stfs       f1,local_250(r1)
lwz        r4,local_254(r1)
lfs        f1,local_254(r1)
lwz        r5,local_250(r1)
fabs       f4,f1
lfs        f1,local_250(r1)
rlwimi     r3,r5,0x2,0x1e,0x1e
fsub       f3,f1,f25
rlwimi     r3,r4,0x4,0x1c,0x1c
fsub       f6,f1,f25
ori        r4,r15,0x0
rlwimi     r4,r3,0x2,0x1a,0x1c
rlwinm     r3,r3,0x2,0x0,0x1d
rldicl     r4,r4,0x0,0x20
fsel       f4,f3,f4,f2
lfsx       f3,r15,r3
fsel       f2,f6,f2,f5
lfs        f1,0x4(r4)
fcmpu      cr0,f4,f25
bgt        LAB_0020f8d8
fmr        f15,f25
b          LAB_0020f9f0

LAB_0020f8d8:
fsubs      f5,f2,f4
fadds      f2,f2,f4
addic      r3,r1,0x10
li         r6,0x2
addic      r5,r3,0xd8
addic      r4,r3,0xc8
mtspr      CTR,r6
fdivs      f2,f5,f2
fmuls      f4,f2,f2
stfs       f2,local_208(r18)
stfs       f2,local_204(r18)
stfs       f2,local_200(r18)
stfs       f2,local_1fc(r18)
lfs        f2,local_1fc(r1)
lfs        f5,local_204(r1)
lfs        f8,local_200(r1)
fmuls      f6,f4,f4
fmuls      f5,f5,f4
fmuls      f9,f2,f6
fmuls      f8,f8,f6
fmuls      f2,f6,f6
stfs       f5,local_204(r1)
fmuls      f4,f9,f4
stfs       f8,local_200(r1)
stfs       f4,local_1fc(r1)

LAB_0020f93c:
lfs        f4,local_208(r3)
fmuls      f4,f4,f2
stfs       f4,local_1f8(r3)
lfs        f4,local_204(r4)
addic      r4,r4,0x8
fmuls      f4,f4,f2
addic      r3,r3,0x8
stfs       f4,local_1f4(r5)
addic      r5,r5,0x8
bdnz       LAB_0020f93c
li         r5,0x4
ori        r3,r1,0x0
mtspr      CTR,r5
lis        r4,0xc4
addic      r5,r3,0xd8
addic      r4,r4,0x3ae0
ori        r7,r5,0x0

LAB_0020f980:
lfs        f2,local_208(r3)
lfs        f4,0x0(r4)

fmuls      f2,f2,f4
lfs        f4,0x4(r4)

addic      r4,r4,0x8
stfs       f2,local_208(r3)
lfs        f2,local_204(r5)
addic      r3,r3,0x8
fmuls      f2,f2,f4
stfs       f2,local_204(r5)
addic      r5,r5,0x8
bdnz       LAB_0020f980
ori        r3,r1,0x0
fmr        f15,f25
mtspr      CTR,r6

LAB_0020f9bc:
lfs        f2,local_208(r3)
lfs        f4,local_204(r7)
fadds      f2,f15,f2
lfs        f5,local_200(r7)
lfs        f15,local_1fc(r7)
addic      r3,r3,0x10
addic      r7,r7,0x10
fadds      f2,f2,f4
fadds      f2,f2,f5
fadds      f15,f2,f15
bdnz       LAB_0020f9bc
fadds      f15,f15,f17
fmadds     f15,f15,f3,f1

LAB_0020f9f0:
ori        r14,r9,0x0
fdivs      f14,f14,f7
ori        r17,r14,0x0
std        r14,local_170(r1)
ori        r21,r17,0x0
std        r17,local_168(r1)

LAB_0020fa08:
cmpwi      r17,0x100
bge        LAB_0020fa1c
lis        r3,0xef
addic      r3,r3,0x5ac8
lwzx       r22,r3,r14

LAB_0020fa1c:
cmpwi      r22,0x0
beq        LAB_002101bc
ld         r3,local_180(r1)
cmpwi      r3,0x0
beq        LAB_0020fa3c
lbz        r3,0x31(r22)
cmpwi      r3,0x0
beq        LAB_002101bc

LAB_0020fa3c:
lhz        r4,0x34(r22)
ld         r3,local_148(r1)
rlwinm     r4,r4,0x0,0x13,0x13
cmpwi      r4,0x0
beq        LAB_002101bc
cmpwi      r3,0x0
bne        LAB_0020fa6c
lbz        r3,0xbe(r22)
rlwinm     r3,r3,0x0,0x1b,0x1b
cmpwi      r3,0x0
bne        LAB_002101bc
b          LAB_0020fa84

LAB_0020fa6c:
cmpwi      r3,0x1
bne        LAB_0020fa84
lbz        r3,0xbe(r22)
rlwinm     r3,r3,0x0,0x1c,0x1c
cmpwi      r3,0x0
bne        LAB_002101bc

LAB_0020fa84:
ori        r3,r22,0x0
bl         0x1ec388
ori        r20,r3,0x0
lhz        r30,0xaa(r22)
cmpwi      r20,0x0
subic      r30,r30,0x1099
beq        LAB_0020faac
ld         r3,local_188(r1)
cmpwi      r3,0x0
beq        LAB_002101bc

LAB_0020faac:
ori        r3,r22,0x0
bl         0x3307b4
ori        r0,r0,0x0
ori        r31,r3,0x0
li         r3,0x0
cmpwi      r31,0x0
ori        r19,r3,0x0
beq        LAB_0020fb5c
ori        r19,r3,0x0
lwz        r3,0x4(r31)
rlwinm     r3,r3,0x8,0x1c,0x1f
cmpwi      r3,0x0
bne        LAB_0020faf0
lwz        r3,0x19ec(r31)
cmpwi      r3,0x14
beq        LAB_002101bc
li         r19,0x1

LAB_0020faf0:
lwz        r5,0x0(r31)
ld         r4,local_148(r1)
ori        r3,r31,0x0
std        r2,local_2b8(r1)
lwz        r5,0x1c(r5)
lwz        r6,0x0(r5)
lwz        r2,0x4(r5)
mtspr      CTR,r6
bctrl
cmpwi      r3,0x0
ld         r2,local_2b8(r1)
bne        LAB_002101bc
lhz        r3,0xaa(r22)
cmpwi      r3,0x109d
bne        LAB_0020fb5c
lwz        r5,0x0(r31)
ori        r3,r31,0x0
std        r2,local_2b8(r1)
li         r4,-0x1
lwz        r5,0x1c(r5)
lwz        r6,0x0(r5)
lwz        r2,0x4(r5)
mtspr      CTR,r6
bctrl
ld         r2,local_2b8(r1)
cmpwi      r3,0x0
bne        LAB_002101bc

LAB_0020fb5c:
cmpwi      r30,0x0
addic      r3,r1,0x118
beq        LAB_0020fb74
ori        r3,r22,0x0
bl         0x10a76c
ori        r0,r0,0x0

LAB_0020fb74:
cmpwi      r3,0x0
beq        LAB_002101bc
lwz        r4,0x0(r3)
cmpwi      r4,0x0
bgt        LAB_0020fb90
cmpwi      r20,0x0
beq        LAB_002101bc

LAB_0020fb90:
lwz        r4,0x24(r22)
cmpwi      r4,0x0
beq        LAB_0020fba8
lbz        r4,0x46(r4)
cmpwi      r4,0x5
beq        LAB_0020fbb8

LAB_0020fba8:
cmpwi      r20,0x0
bne        LAB_0020fbb8
cmpwi      r30,0x0
bne        LAB_002101bc

LAB_0020fbb8:
ld         r6,local_150(r1)
cmpwi      r6,0x0
beq        LAB_0020fc04
li         r4,0x0
ori        r5,r6,0x0

LAB_0020fbcc:
lwz        r6,0x0(r5)
cmpw       cr1,r22,r6
cmpwi      r6,0x0
cror       eq,eq,4*cr1+eq
beq        LAB_0020fbec
addic      r5,r5,0x4
addic      r4,r4,0x1
b          LAB_0020fbcc

LAB_0020fbec:
rlwinm     r4,r4,0x2,0x0,0x1d
ld         r5,local_150(r1)
extsw      r4,r4
lwzx       r4,r5,r4
cmpwi      r4,0x0
bne        LAB_002101bc

LAB_0020fc04:
ld         r5,local_158(r1)
cmpwi      r5,0x0
beq        LAB_0020fc58
li         r4,0x0
ori        r6,r5,0x0

LAB_0020fc18:
lwz        r5,0x0(r6)
cmpwi      r5,-0x1
beq        LAB_0020fc40
lhz        r7,0xaa(r22)
extsh      r7,r7
cmpw       r7,r5
beq        LAB_0020fc40
addic      r6,r6,0x4
addic      r4,r4,0x1
b          LAB_0020fc18

LAB_0020fc40:
rlwinm     r4,r4,0x2,0x0,0x1d
ld         r5,local_158(r1)
extsw      r4,r4
lwzx       r4,r5,r4
cmpwi      r4,-0x1
bne        LAB_002101bc

LAB_0020fc58:
lwz        r5,0xe8(r22)
lis        r4,0x3f73
lfs        f26,0x10(r22)
srawi      r6,r5,0x1f
lfs        f27,0x14(r22)
ori        r4,r4,0x3333
lfs        f1,0x18(r22)
rlwinm     r7,r6,0x1f,0x1,0x1f
lfs        f22,0x1c(r22)
lfs        f2,0xe8(r22)
xor        r5,r7,r5
subfc      r5,r6,r5
cmpw       r5,r4
bge        LAB_0020fcac
lfs        f3,local_1b8(r3)
lfs        f4,0xe0(r22)
lfs        f5,0xe4(r22)
fmuls      f2,f2,f3
fmadds     f26,f4,f3,f26
fmadds     f27,f5,f3,f27
b          LAB_0020fcb0

LAB_0020fcac:
lfs        f2,local_1b8(r3)

LAB_0020fcb0:
ld         r3,local_160(r1)
fadds      f23,f1,f2
lfs        f2,0x4(r3)
lfs        f1,0x0(r3)
fsubs      f2,f27,f2
fsubs      f1,f26,f1
lfs        f31,0x8(r3)
fsubs      f31,f23,f31
lfd        f3,local_178(r1)
fmuls      f28,f2,f2
fmadds     f28,f1,f1,f28
fmadds     f29,f31,f31,f28
fsqrts     f29,f29
fcmpu      cr0,f29,f3
bgt        LAB_002101bc
lfs        f3,0x10(r16)
fcmpu      cr0,f29,f3
blt        LAB_002101bc
fmuls      f24,f29,f14
lfs        f3,0x14(r16)
lfs        f4,0x1c(r16)
lfs        f6,0x18(r16)
fcmpu      cr0,f20,f4
fcmpu      cr1,f21,f4
fmuls      f5,f24,f24
fmuls      f3,f5,f3
fmadds     f3,f5,f24,f3
fmadds     f24,f24,f6,f3
blt        LAB_0020fd30
fmr        f3,f25
fmr        f30,f3
bge        cr1,LAB_002100b8

LAB_0020fd30:
fabs       f3,f1
fabs       f4,f2
stfs       f1,local_260(r1)
stfs       f2,local_25c(r1)
fsubs      f1,f3,f4
stfs       f1,local_258(r1)
lwz        r3,local_260(r1)
lfs        f1,local_260(r1)
lwz        r4,local_25c(r1)
lfs        f2,local_25c(r1)
fabs       f1,f1
lwz        r5,local_258(r1)
rlwinm     r4,r4,0x3,0x1d,0x1d
lfs        f5,local_258(r1)
fabs       f2,f2
rlwimi     r4,r5,0x2,0x1e,0x1e
fsub       f6,f5,f25
fsub       f5,f5,f25
rlwimi     r4,r3,0x4,0x1c,0x1c
ori        r3,r15,0x0
rlwimi     r3,r4,0x2,0x1a,0x1c
rlwinm     r4,r4,0x2,0x0,0x1d
rldicl     r3,r3,0x0,0x20
fsel       f4,f6,f1,f4
lfsx       f1,r15,r4
fsel       f3,f5,f2,f3
lfs        f2,0x4(r3)
fcmpu      cr0,f4,f25
bgt        LAB_0020fdac
fmr        f1,f25
b          LAB_0020fec4

LAB_0020fdac:
fsubs      f5,f3,f4
fadds      f3,f3,f4
addic      r3,r1,0x10
li         r10,0x2
addic      r4,r3,0xa8
addic      r5,r3,0xb8
mtspr      CTR,r10
fdivs      f3,f5,f3
fmuls      f4,f3,f3
stfs       f3,local_228(r18)
stfs       f3,local_224(r18)
stfs       f3,local_220(r18)
stfs       f3,local_21c(r18)
lfs        f3,local_21c(r1)
lfs        f5,local_224(r1)
lfs        f7,local_220(r1)
fmuls      f6,f4,f4
fmuls      f5,f5,f4
fmuls      f8,f3,f6
fmuls      f7,f7,f6
fmuls      f3,f6,f6
stfs       f5,local_224(r1)
fmuls      f4,f8,f4
stfs       f7,local_220(r1)
stfs       f4,local_21c(r1)

LAB_0020fe10:
lfs        f4,local_228(r3)
fmuls      f4,f4,f3
stfs       f4,local_218(r3)
lfs        f4,local_224(r4)
addic      r3,r3,0x8
addic      r4,r4,0x8
fmuls      f4,f4,f3
stfs       f4,local_214(r5)
addic      r5,r5,0x8
bdnz       LAB_0020fe10
li         r3,0x4
ori        r4,r1,0x0
mtspr      CTR,r3
lis        r5,0xc4
addic      r3,r4,0xb8
addic      r5,r5,0x3ae0
ori        r9,r3,0x0

LAB_0020fe54:
lfs        f3,local_228(r4)
lfs        f4,0x0(r5)

fmuls      f3,f3,f4
lfs        f4,0x4(r5)

addic      r5,r5,0x8
stfs       f3,local_228(r4)
lfs        f3,local_224(r3)
addic      r4,r4,0x8
fmuls      f3,f3,f4
stfs       f3,local_224(r3)
addic      r3,r3,0x8
bdnz       LAB_0020fe54
fmr        f3,f25
ori        r3,r1,0x0
mtspr      CTR,r10

LAB_0020fe90:
lfs        f4,local_228(r3)
fadds      f3,f3,f4
addic      r3,r3,0x10
lfs        f4,local_224(r9)
lfs        f5,local_220(r9)
lfs        f6,local_21c(r9)
addic      r9,r9,0x10
fadds      f3,f3,f4
fadds      f3,f3,f5
fadds      f3,f3,f6
bdnz       LAB_0020fe90
fadds      f3,f3,f17
fmadds     f1,f3,f1,f2

LAB_0020fec4:
lfs        f2,local_128(r1)
bl         0x9949a0
ori        r0,r0,0x0
fsubs      f2,f20,f19
fmr        f30,f1
fsub       f3,f25,f19
fmadds     f1,f2,f24,f19
fsel       f1,f3,f20,f1
fcmpu      cr0,f1,f30
cror       4*cr1+eq,lt,eq
beq        cr1,LAB_002101bc
fsqrts     f1,f28
stfs       f31,local_268(r1)
fabs       f3,f31
lwz        r3,local_268(r1)
lfs        f2,local_268(r1)
rlwinm     r3,r3,0x3,0x1d,0x1d
fabs       f2,f2
fabs       f4,f1
stfs       f1,local_26c(r1)
fsubs      f1,f4,f3
stfs       f1,local_264(r1)
lwz        r4,local_26c(r1)
lfs        f1,local_26c(r1)
lwz        r5,local_264(r1)
lfs        f5,local_264(r1)
fabs       f1,f1
rlwimi     r3,r5,0x2,0x1e,0x1e
fsub       f6,f5,f25
fsub       f5,f5,f25
rlwimi     r3,r4,0x4,0x1c,0x1c
ori        r4,r15,0x0
rlwimi     r4,r3,0x2,0x1a,0x1c
rlwinm     r3,r3,0x2,0x0,0x1d
rldicl     r4,r4,0x0,0x20
fsel       f3,f6,f1,f3
lfsx       f31,r15,r3
fsel       f2,f5,f2,f4
lfs        f1,0x4(r4)
fcmpu      cr0,f3,f25
bgt        LAB_0020ff70
fmr        f31,f25
b          LAB_00210088

LAB_0020ff70:
fsubs      f4,f2,f3
fadds      f2,f2,f3
addic      r3,r1,0x10
li         r10,0x2
addic      r5,r3,0x98
addic      r4,r3,0x88
mtspr      CTR,r10
fdivs      f2,f4,f2
fmuls      f3,f2,f2
stfs       f2,local_248(r18)
stfs       f2,local_244(r18)
stfs       f2,local_240(r18)
stfs       f2,local_23c(r18)
lfs        f2,local_23c(r1)
lfs        f4,local_244(r1)
lfs        f6,local_240(r1)
fmuls      f5,f3,f3
fmuls      f4,f4,f3
fmuls      f7,f2,f5
fmuls      f6,f6,f5
fmuls      f2,f5,f5
stfs       f4,local_244(r1)
fmuls      f3,f7,f3
stfs       f6,local_240(r1)
stfs       f3,local_23c(r1)

LAB_0020ffd4:
lfs        f3,local_248(r3)
fmuls      f3,f3,f2
stfs       f3,local_238(r3)
lfs        f3,local_244(r4)
addic      r4,r4,0x8
fmuls      f3,f3,f2
addic      r3,r3,0x8
stfs       f3,local_234(r5)
addic      r5,r5,0x8
bdnz       LAB_0020ffd4
li         r3,0x4
ori        r4,r1,0x0
mtspr      CTR,r3
lis        r5,0xc4
addic      r3,r4,0x98
addic      r5,r5,0x3ae0
ori        r9,r3,0x0

LAB_00210018:
lfs        f2,local_248(r4)
lfs        f3,0x0(r5)

fmuls      f2,f2,f3
lfs        f3,0x4(r5)

addic      r5,r5,0x8
stfs       f2,local_248(r4)
lfs        f2,local_244(r3)
addic      r4,r4,0x8
fmuls      f2,f2,f3
stfs       f2,local_244(r3)
addic      r3,r3,0x8
bdnz       LAB_00210018
ori        r3,r1,0x0
fmr        f2,f25
mtspr      CTR,r10

LAB_00210054:
lfs        f3,local_248(r3)
fadds      f2,f2,f3
lfs        f3,local_244(r9)
addic      r3,r3,0x10
lfs        f4,local_240(r9)
lfs        f5,local_23c(r9)
addic      r9,r9,0x10
fadds      f2,f2,f3
fadds      f2,f2,f4
fadds      f2,f2,f5
bdnz       LAB_00210054
fadds      f2,f2,f17
fmadds     f31,f2,f31,f1

LAB_00210088:
fmr        f1,f31
fmr        f2,f15
bl         0x9949a0
ori        r0,r0,0x0
fsubs      f2,f21,f18
fmr        f3,f1
fsub       f4,f25,f18
fmadds     f1,f2,f24,f18
fsel       f1,f4,f21,f1
fcmpu      cr0,f3,f1
cror       4*cr1+eq,gt,eq
beq        cr1,LAB_002101bc

LAB_002100b8:
fmadds     f1,f29,f30,f29
cmpwi      r20,0x0
cmpwi      cr6,r19,0x0
fmadds     f29,f29,f3,f1
beq        LAB_002100d4
lfs        f1,-0x20(r16)
fadds      f29,f29,f1

LAB_002100d4:
ld         r4,local_168(r1)
cmpwi      cr1,r4,0x20
beq        cr6,LAB_002100e8
lfs        f1,0x24(r16)
fadds      f29,f29,f1

LAB_002100e8:
bge        cr1,LAB_00210114
addic      r4,r4,0x1
ld         r5,local_170(r1)
lis        r3,0xf4
addic      r3,r3,0xc20
std        r4,local_168(r1)
addic      r4,r5,0x20
addc       r3,r3,r5
rldicl     r3,r3,0x0,0x20
std        r4,local_170(r1)
b          LAB_00210124

LAB_00210114:
ori        r3,r21,0x0
li         r4,0x0
lwz        r5,0xc(r3)
stw        r4,0x0(r5)

LAB_00210124:
stfs       f26,0x10(r3)
stfs       f27,0x14(r3)
stfs       f23,0x18(r3)
stfs       f22,0x1c(r3)
stw        r22,0x0(r3)
stfs       f29,0x4(r3)
lwz        r4,local_270(r1)
cmpwi      r4,0x0
beq        LAB_002101a4
cmpwi      r4,0x0
beq        LAB_00210168

LAB_00210150:
lfs        f1,0x4(r4)
fcmpu      cr0,f29,f1
blt        LAB_00210168
lwz        r4,0x8(r4)
cmpwi      r4,0x0
bne        LAB_00210150

LAB_00210168:
cmpwi      r4,0x0
stw        r4,0x8(r3)
beq        LAB_00210190
lwz        r6,0xc(r4)
addic      r5,r3,0x8
stw        r6,0xc(r3)
lwz        r6,0xc(r4)
stw        r3,0x0(r6)
stw        r5,0xc(r4)
b          LAB_002101bc

LAB_00210190:
addic      r4,r21,0x8
stw        r3,0x8(r21)
ori        r21,r3,0x0
stw        r4,0xc(r3)
b          LAB_002101bc

LAB_002101a4:
ori        r21,r3,0x0
addic      r3,r1,0x70
li         r4,0x0
stw        r21,local_270(r1)
stw        r3,0xc(r21)
stw        r4,0x8(r21)

LAB_002101bc:
addic      r17,r17,0x1
addic      r14,r14,0x4
cmpwi      r17,0x100
blt        LAB_0020fa08
lwz        r4,local_270(r1)
li         r28,0x0
cmpwi      r4,0x0
ori        r31,r28,0x0
beq        LAB_00210288
ld         r29,local_160(r1)
ld         r27,local_140(r1)
ori        r31,r28,0x0
ld         r26,local_138(r1)
ld         r25,local_130(r1)

LAB_002101f4:
ori        r3,r4,0x0
lfs        f1,0x4(r3)
lwz        r30,0x0(r4)
fcmpu      cr0,f1,f16
cror       4*cr1+eq,gt,eq
beq        cr1,LAB_00210274
ori        r3,r29,0x0
addic      r4,r4,0x10
li         r5,0x12
ori        r6,r30,0x0
li         r7,0x0
bl         0x956c0
ori        r0,r0,0x0
cmpwi      r3,0x0
beq        LAB_0021023c
lwz        r3,local_270(r1)
lwz        r3,0x8(r3)
b          LAB_00210278

LAB_0021023c:
lwz        r3,local_270(r1)
cmpwi      r27,0x0
ori        r31,r30,0x0
lfs        f16,0x4(r3)
beq        LAB_00210274
lwz        r4,0x0(r25)
cmpw       r4,r26
bge        LAB_00210274
lwz        r4,0x0(r25)
rlwinm     r5,r4,0x2,0x0,0x1d
addic      r4,r4,0x1
extsw      r5,r5
stw        r4,0x0(r25)
stwx       r30,r27,r5

LAB_00210274:
lwz        r3,0x8(r3)

LAB_00210278:
ori        r4,r3,0x0
stw        r3,local_270(r1)
cmpwi      r4,0x0
bne        LAB_002101f4

LAB_00210288:
ld         r3,local_140(r1)
cmpwi      cr1,r31,0x0
cmpwi      r3,0x0
beq        LAB_00210320
ld         r5,local_140(r1)
ld         r6,local_138(r1)
beq        cr1,LAB_00210304
cmpwi      r6,0x0
ori        r3,r28,0x0
ble        LAB_002102f8
ori        r3,r28,0x0
ori        r4,r5,0x0

LAB_002102b8:
lwz        r7,0x0(r4)
cmpw       r7,r31
bne        LAB_002102e8
cmpwi      r3,0x0
beq        LAB_002102f8
rlwinm     r4,r3,0x2,0x0,0x1d
lwz        r7,0x0(r5)
extsw      r4,r4
lwzx       r8,r5,r4
stw        r8,0x0(r5)
stwx       r7,r5,r4
b          LAB_002102f8

LAB_002102e8:
addic      r3,r3,0x1
addic      r4,r4,0x4
cmpw       r3,r6
blt        LAB_002102b8

LAB_002102f8:
cmpw       r3,r6
bne        LAB_00210304
stw        r31,0x0(r5)

LAB_00210304:
ld         r3,local_130(r1)
lwz        r3,0x0(r3)
cmpw       r3,r6
bge        LAB_00210320
rlwinm     r3,r3,0x2,0x0,0x1d
extsw      r3,r3
stwx       r28,r5,r3

LAB_00210320:
ori        r3,r31,0x0

LAB_00210324:
ld         r0,param_11(r1)
mtspr      LR,r0
lfd        f14,local_90(r1)
lfd        f15,local_88(r1)
lfd        f16,local_80(r1)
lfd        f17,local_78(r1)
lfd        f18,local_70(r1)
lfd        f19,local_68(r1)
lfd        f20,local_60(r1)
lfd        f21,local_58(r1)
lfd        f22,local_50(r1)
lfd        f23,local_48(r1)
lfd        f24,local_40(r1)
lfd        f25,local_38(r1)
lfd        f26,local_30(r1)
lfd        f27,local_28(r1)
lfd        f28,local_20(r1)
lfd        f29,local_18(r1)
lfd        f30,local_10(r1)
lfd        f31,local_8(r1)
ld         r14,local_120(r1)
ld         r15,local_118(r1)
ld         r16,local_110(r1)
ld         r17,local_108(r1)
ld         r18,local_100(r1)
ld         r19,local_f8(r1)
ld         r20,local_f0(r1)
ld         r21,local_e8(r1)
ld         r22,local_e0(r1)
ld         r23,local_d8(r1)
ld         r24,local_d0(r1)
ld         r25,local_c8(r1)
ld         r26,local_c0(r1)
ld         r27,local_b8(r1)
ld         r28,local_b0(r1)
ld         r29,local_a8(r1)
ld         r30,local_a0(r1)
ld         r31,local_98(r1)
addi       r1,r1,0x2e0
blr
