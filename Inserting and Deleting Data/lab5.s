        .syntax     unified
	.cpu        cortex-m4
        .text
        .thumb_func
        .align       2

// uint32_t  Add1(uint32_t x) ;



        .global     DeleteItem

DeleteItem:
        PUSH {R4}
        MOV R4, R2 // index --> R4
        SUB R1, R1, 1
L1:     CMP R2, R1 // i < items ?
        BGE L2
        ADD R2, R2, 1 // ++i
        LDR R3, [R0, R2, LSL 2] //data[i+1]
        STR R3, [R0, R4, LSL 2] // data[i] = data[i+1]
        ADD R4, R4, 1 //increment pos of index
        B L1
L2:
        POP {R4}
        BX LR

        .global     InsertItem
InsertItem:
        PUSH {R4, R5}
        SUB R4, R4, 1
        MOV R4, R1 // items --> R4
        MOV R5, R3 //value --> R5
        //ADD R2, R2, 1
L3:     CMP R4, R2 // i > index?
        BLE L4 // i <= index
        SUB R1, R1, 1 // -- i
        LDR R3, [R0, R1, LSL 2] // data[i-1]
        STR R3, [R0, R4, LSL 2] // data[i] = data[i-1]
        SUB R4, R4, 1 // decrement pos of items
        B L3
L4:
        STR R5, [R0, R2, LSL 2] //insert value
        POP {R4, R5}
        BX LR

        .end
