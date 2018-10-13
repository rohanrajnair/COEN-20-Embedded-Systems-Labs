        .syntax     unified
        .cpu        cortex-m4
        .text
        .thumb_func
        .align       2



        .global     CallReturnOverhead
CallReturnOverhead:
        BX LR

        .global     SDIVby13
SDIVby13:
        MOVS.N R1, 13
        SDIV R0, R0, R1
        BX LR

        .global     UDIVby13
UDIVby13:
        MOVS.N R1, 13
        UDIV R0, R0, R1
        BX LR

        .global     MySDIVby13
MySDIVby13:
        LDR R1, =0x4EC4EC4F // 2^32 / 13
        SMMUL R1, R1, R0 // (2^32 / 13) * dividend
        ASRS.N R1, R1, 2
        ADD R0, R1, R0, LSR 31 //preserve sign bit
        BX LR

        .global     MyUDIVby13
MyUDIVby13:
        LDR R1, =0x4EC4EC4F //2^32 / 13
        UMULL R2, R1, R1, R0 // (2^32 / 13) * dividend
        LSRS.N R0, R1, 2
        BX LR

        .end
