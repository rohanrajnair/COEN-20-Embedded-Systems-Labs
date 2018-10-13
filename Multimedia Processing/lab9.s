                .syntax     unified
                .cpu        cortex-m4
                .text
                .thumb_func
                .align       2

                .global     SIMD_USatAdd
 SIMD_USatAdd:  PUSH        {R4 - R12}
                BFI         R2,R2,8,8   //two 8-bit copies of amount
                BFI         R2,R2,16,16 //Four 8-bit copies of amount
loop:           CMP         R1, 40
                BLO         CleanupLoop // check if count < 40
                LDMIA       R0,{R3-R12}    //Get next 40 bytes
                UQADD8      R3,R3,R2       //Add amount to 40
                UQADD8      R4,R4,R2
                UQADD8      R5,R5,R2
                UQADD8      R6,R6,R2
                UQADD8      R7,R7,R2
                UQADD8      R8,R8,R2
                UQADD8      R9,R9,R2
                UQADD8      R10,R10,R2
                UQADD8      R11,R11,R2
                UQADD8      R12,R12,R2
                STMIA       R0!, {R3-R12}    //Store the result, bump adrs
                SUB         R1,R1,40         //Decrement the count by 40
                B           loop             //Repeat until done
CleanupLoop:    CBZ         R1,done          //Test for completion (count = 0)
                LDR         R3, [R0]         //Get next four bytes
                UQADD8      R3, R3,R2        //Add amount to all four
                STR         R3, [R0], 4      //Store the result, bump adrs
                SUB         R1, R1, 4        //Decrement the count by 40
                B           CleanupLoop      //Repeat until done
done:           POP        {R4 - R12}
                BX          LR
                .end

