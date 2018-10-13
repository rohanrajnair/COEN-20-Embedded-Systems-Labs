                .syntax     unified
                .cpu        cortex-m4
                .text
                .thumb_func
                .align       2

                .global     CallReturnOverhead
CallReturnOverhead:
                BX LR

                .global     ReverseBits
ReverseBits:

                //LDR R1, = 0
                .rept 32
                LSLS R0, R0, 1 //preserve carry
                RRX R1, R1 // carry goes into MSB of R1, right shifted
                .endr
                MOV R0, R1
                BX LR


                .global     ReverseBytes
ReverseBytes:

                MOV R1, R0
                BFI R1, R0, 24, 8 // insert bits 0-7 of original word into 24-31
                LSR R0, R0, 8 // go to second byte
                BFI R1, R0, 16, 8 // insert bits 8-15 of original word into 16-23
                LSR R0, R0, 8 // go to third byte
                BFI R1, R0, 8, 8 //insert bits 16-23 of original word into 8-15
                LSR R0, R0, 8 // go to fourth byte
                BFI R1, R0, 0, 8 // insert bits 24-31 of original word into 0-7
                MOV R0, R1
                BX LR


                 .end


