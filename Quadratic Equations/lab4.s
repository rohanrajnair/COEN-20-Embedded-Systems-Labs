        .syntax     unified
	.cpu        cortex-m4
        .text
        .thumb_func
        .align       2

// uint32_t  Add1(uint32_t x) ;

                 .global     SquareRoot
SquareRoot:      CMP           R0, 2
                 BGE           L1
                 BX            LR

                 L1:  //R1 = smallCandidate, R2 = largeCandidate (eventually)
                 PUSH          {R4, R5, LR}
                 MOV           R5, R0 // n --> R5
                 LSR           R0, R0, 2 // n/4 --> R0
                 BL SquareRoot // squareroot(n/4) --> R0

                 LSL           R1, R0, 1 //2*squareroot(n/4) --> R1 (smallCandidate)
                 ADD           R2, R1, 1 // smallCandidate + 1 --> R2 (largeCandidate)
                 MUL           R4, R2, R2 //largeCandidate*largeCandidate --> R4
                 CMP           R4, R5
                 ITE GT
                 MOVGT         R0, R1 //smallCandidate to R0
                 MOVLE         R0, R2 //largeCandidate to R0
                 POP           {R4, R5, PC}






                 .global     Discriminant
Discriminant:   MUL         R1,R1,R1     //b^2 --> R1
                LSL         R0,R0,2     //4a --> R0
                MLS         R0,R0,R2,R1  //b^2 - 4ac --> R0
                BX          LR



                .global     Root1
Root1:          PUSH        {R4,R5}
                MOV         R4,R0           // a --> R4
                LSL         R4,R4,1         //2a --> R4
                MOV         R5,R1           //b --> R5
                PUSH        {LR}
                BL          Discriminant    // b^2 - 4ac --> R0
                BL          SquareRoot    // SquareRoot(b^2 - 4ac) --> R0
                POP         {LR}
                SUB         R0,R0,R5        // (-b + SquareRoot(b^2 - 4ac)) --> R0
                SDIV        R0,R0,R4        // (-b + SquareRoot(b^2 - 4ac))/2a --> R0
                POP         {R4,R5}
                BX          LR



                .global     Root2
Root2:          PUSH        {R4,R5}
                MOV         R4,R0           // a --> R4
                LSL         R4,R4,1         //2a --> R4
                MOV         R5,R1           //b --> R5
                PUSH        {LR}
                BL          Discriminant    // b^2 - 4ac --> R0
                BL          SquareRoot      // SquareRoot(b^2 - 4ac) --> R0
                POP         {LR}
                NEG         R0, R0
                SUB         R0,R0,R5        // (-b - SquareRoot(b^2 - 4ac)) --> R0
                SDIV        R0,R0,R4        // (-b - SquareRoot(b^2 - 4ac))/2a --> R0
                POP         {R4,R5}
                BX          LR



                .global     Quadratic
Quadratic:      MUL         R2,R2,R0    //bx --> R2
                MUL         R0,R0,R0    //x^2 --> R0
                MUL         R1,R1,R0    //ax^2 --> R1
                ADD         R0,R1,R2    //ax^2 + bx --> R0
                ADD         R0,R0,R3    //ax^2 + bx + c --> R0
                BX          LR


                 .end


