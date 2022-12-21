.MODEL	SMALL
.STACK
.DATA
	HFD DB ' half-dollar $'
    QTR DB ' quarter $'
    DME DB ' dime $'
    NKL DB ' nickel $'
    PNY DB ' penny $'
.CODE
MAIN PROC
	MOV AX, @DATA
    MOV DS, AX
    
    ;รับเลข
    CALL INDEC
    PUSH AX
	
    POP AX

    ;หา half-dollar
    XOR DX, DX
    MOV CX, 50
    DIV CX

    ;เทียบว่าหารแล้วไม่เป็น 0 ให้ทำขั้นต่อไป
    CMP AX, 0
	JNE HALF_DOLLAR
    PUSH AX

HALF_DOLLAR:
    ;แสดงผลจำนวน half-dollar
    CALL OUTDEC

    MOV AX, DX
    PUSH AX
    
	LEA DX, HFD
    MOV AH, 9
    INT 21H

    POP AX
	
    ;หา quarter
    XOR DX, DX
    MOV CX, 25
    DIV CX

    ;เทียบว่าหารแล้วไม่เป็น 0 ให้ทำขั้นต่อไป
    CMP AX, 0
    JNE QUARTER
    PUSH AX

QUARTER:
    ;แสดงผลจำนวน quarter
    CALL OUTDEC

    MOV AX, DX
    PUSH AX
    
	LEA DX, QTR
    MOV AH, 9
    INT 21H

    POP AX
    
    ;หา dime
    XOR DX, DX
    MOV CX, 10
    DIV CX

    ;เทียบว่าหารแล้วไม่เป็น 0 ให้ทำขั้นต่อไป
    CMP AX, 0
    JNE DIME
    PUSH AX

DIME:
    ;แสดงผลจำนวน dime
    CALL OUTDEC

    MOV AX, DX
    PUSH AX
    
	LEA DX, DME
    MOV AH, 9
    INT 21H

    POP AX
	
    ;หา nickel
    XOR DX, DX
    MOV CX, 25
    DIV CX

    ;;เทียบว่าหารแล้วไม่เป็น 0 ให้ทำขั้นต่อไป
    CMP AX, 0
    JNE NICKEL
    PUSH AX

NICKEL:
    ;แสดงผลจำนวน nickel
    CALL OUTDEC

    MOV BX, DX

	LEA DX, NKL
    MOV AH, 9
    INT 21H

    MOV AX, BX

PENNY:
    ;แสดงผลจำนวน penny
    CALL OUTDEC

    LEA DX, PNY
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
INCLUDE	OUTDEC.ASM
INCLUDE	INDEC.ASM
	END MAIN
