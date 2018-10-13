            .syntax     unified
            .cpu        cortex-m4
            .text
            .thumb_func
            .align       2

//void UseLDRB(void *dst, void *src) ;
            .global UseLDRB
UseLDRB:
            .rept 512 //512 bytes, 1 byte at a time, repeat 512 times
            LDRB R2, [R1], 1 //Use R2 as a 'temp' register, load current byte from src, and post increment by 1 byte
            STRB R2, [R0], 1 //store contents of R2 into dst, increment to next 8 bit location
            .endr
            BX LR
//void UseLDRH(void *dst, void *src) ;

            .global UseLDRH
UseLDRH:
            .rept 256
            LDRH R2, [R1], 2 //load current byte from src, post increment by 2 bytes (16 bits)
            STRH R2, [R0], 2 //store contents of R2 into dst, increment to next 16 bit location
            .endr
            BX LR
//void UseLDR(void *dst, void *src) ;

            .global UseLDR
UseLDR:
            .rept 128
            LDR R2, [R1], 4 //load current byte from src, post increment by 4 bytes (32 bits)
            STR R2, [R0], 4 //store contents of R2 into current 32 bit location in dst, increment
            .endr
            BX LR
//void UseLDRD(void *dst, void *src) ;

            .global UseLDRD
UseLDRD:
            .rept 64
            LDRD R2, R3, [R1], 8 //load current byte from src, post inc by 8 bytes (64 bits)
            STRD R2, R3, [R0], 8 //store contents of R2, R3 into current 64 bit location in dst, increment
            .endr
            BX LR
//void UseLDMIA(void *dst, void *src) ;

            .global UseLDMIA
UseLDMIA:
            PUSH {R4, R5, R6, R7, R8, R9} //preserve original contents of R4-R9
            .rept 16 //32 bytes at a time, each reg is 4 bytes so need 8 registers total
            LDMIA R1!, {R2-R9} //start from current location in src, store next 32 bytes in R2-R9, increment position of src by 32 bytes
            STMIA R0!, {R2-R9} //store current 32 bytes into current location in dst, increment to next 32 byte location
            .endr
            POP {R4, R5, R6, R7, R8, R9} //restore original contents of R4-R9
            BX LR

            .end
