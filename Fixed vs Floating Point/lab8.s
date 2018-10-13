        .syntax     unified
        .cpu        cortex-m4
        .text
        .thumb_func
        .align       2



// FLOATING POINT
four:
        .float 4.0

two:
        .float 2.0

        .global     Discriminant
Discriminant:
        VMUL.F32    S1, S1, S1 //b^2
        VLDR        S3, four
        VMUL.F32    S3, S3, S0 // 4ac
        VMUL.F32    S3, S3, S2
        VSUB.F32    S0, S1, S3
        BX          LR

        .global     Root1
Root1:
        PUSH        {R4, R5, LR}
        VMOV        R4, S0
        VMOV        R5, S1
        BL          Discriminant  //b^2 - 4ac
        VSQRT.F32   S0, S0 //sqrt(b^2 - 4ac)
        VMOV        S1, R4
        VMOV        S2, R5
        VLDR        S3, two
        VMUL.F32    S3, S1, S3 // 2a
        VNEG.F32    S2, S2
        VADD.F32    S0, S0, S2
        VDIV.F32    S0, S0, S3
        POP         {R4, R5, PC}

        .global     Root2
Root2:
        PUSH        {R4, R5, LR} //preserve a, b
        VMOV        R4, S0
        VMOV        R5, S1
        BL          Discriminant
        VSQRT.F32   S0, S0 //sqrt(b^2 - 4ac) --> S0
        VMOV        S1, R4 // a --> S1
        VMOV        S2, R5 //b --> S2
        VLDR        S3, two
        VMUL.F32    S3, S1, S3 //2a --> S3
        VNEG.F32    S2, S2 // -b --> S2
        VSUB.F32    S0, S2, S0 // -b - sqrt(b^2-4ac)
        VDIV.F32    S0, S0, S3 // divide by 3a
        POP         {R4, R5, PC}

        .global     Quadratic
Quadratic:
        VMUL.F32    S2, S2, S0 // bx
        VMUL.F32    S0, S0, S0  // x^2
        VMUL.F32    S1, S1, S0 // ax^2
        VADD.F32    S0, S1, S2 //ax^2 + bx
        VADD.F32    S0, S0, S3 // + c
        BX          LR


// FIXED POINT

        .global     Discriminant

Discriminant:
        PUSH        {R4, R5, LR}
        MOV         R4, R1 // b --> R4
        MOV         R1, R2 // c --> R1
        BL          Q16Product // a*c
        LSL         R0, R0, 2 // 4ac
        MOV         R5, R0
        MOV         R0, R4
        MOV         R1, R4
        BL          Q16Product // b^2
        SUB         R0, R0, R5
        POP         {R4, R5, PC}


        .global     Root1
Root1:
        PUSH        {R4, R5, R6, LR}
        MOV         R4, R0 // a --> R4
        MOV         R5, R1 // b --> R5
        MOV         R6, R2 // c --> R6
        BL          Discriminant
        BL          Q16SquareRoot
        NEG         R5, R5 // -b
        ADD         R0, R0, R5
        LSL         R4, R4, 1
        MOV         R1, R4
        BL          Q16Quotient
        POP         {R4, R5, R6, PC}


        .global     Root2
Root2:

        PUSH        {R4, R5, R6, LR}
        MOV         R4, R0 // a --> R4
        MOV         R5, R1 // b --> R5
        MOV         R6, R2 // c --> R6
        BL          Discriminant
        BL          Q16SquareRoot
        NEG         R5, R5 // -b
        SUB         R0, R5, R0
        LSL         R4, R4, 1
        MOV         R1, R4
        BL          Q16Quotient
        POP         {R4, R5, R6, PC}

        .global     Quadratic
Quadratic:
        PUSH        {R4, R5, R6, R7, LR}
        MOV         R4, R0 // x --> R4
        MOV         R5, R1 // a --> R5
        MOV         R6, R2 // b --> R6
        MOV         R7, R3 // c --> R7
        MOV         R1, R0 // x --> R1
        BL          Q16Product // x^2
        MOV         R1, R5 // a --> R1
        BL          Q16Product // ax^2
        MOV         R5, R0
        MOV         R0, R4
        MOV         R1, R6
        BL          Q16Product // bx
        ADD         R0, R0, R5 // ax^2 + bx
        ADD         R0, R0, R7 // ax^2 + bx + c
        POP         {R4, R5, R6, R7, PC}

        .end
