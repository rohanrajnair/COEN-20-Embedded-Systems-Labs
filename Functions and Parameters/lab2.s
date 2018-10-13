        .syntax     unified
	.cpu        cortex-m4
        .text
        .thumb_func
        .align       2

//unsigned Ten32(void) ;

        .global     Ten32
Ten32:      LDR R0, =10		// Load 10 into R0
            BX          LR

// unsigned long long Ten64(void) ;

        .global     Ten64
Ten64:      LDR R1, =0 //set all bits in R1 = 0 since output is 64 bit (zero extend)
            LDR R0, =10 //load 10 into R0
            BX          LR

//extern unsigned Incr(unsigned n) ;
                .global     Incr
Incr:       ADD         R0,R0,1		// add 1 to R0 and store result in R0
            BX          LR

//unsigned Nested1(void) ;
                .global     Nested1
Nested1:    PUSH {LR}
            BL rand //call rand function
            ADD R0,R0,1 //add 1 to result of rand fxn call
            POP {PC}


 //unsigned Nested2(void) ;
                .global     Nested2
Nested2:    PUSH {R4,LR} //preserve contents of R4
            BL rand //call rand function
            MOV R4, R0 //store output of rand in R4
            BL rand //call rand again
            ADD R0, R0, R4 //add new and initial outputs of rand, store in R0
            POP {R4, PC} //restore contents of R4


//void PrintTwo(char *format, unsigned number) ;
                .global     PrintTwo
PrintTwo:   PUSH {R4,R5,LR} //preserve contents of R4,R5
            MOV R4,R0 //save format in R4
            MOV R5,R1 //save n in R1
            BL printf //call printf function
            MOV R0,R4 //move format back to R0
            ADD R1, R5, 1 //call printf function with n+1, n in R1
            BL printf //call printf again
            POP {R4,R5,PC} //restore contents of R4,R5


        .end



