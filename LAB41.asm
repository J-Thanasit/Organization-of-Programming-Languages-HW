.MODEL	SMALL
.STACK
.DATA
	DOT DB ' : $'	
.CODE
MAIN PROC
	MOV AX, @DATA
    MOV DS, AX
    
    ;รับ input
    CALL INDEC
    PUSH AX
	
    POP AX

    ;เคลียค่า DX
    XOR DX, DX
    ;กำหนดค่าให้ CX เป็น 3600 
    MOV CX, 3600
    ;หาร AX ด้วย CX
    DIV CX

    ;เทียบ AX ไม่เท่ากับ 0 ให้โดดไปทำ HOURS
    CMP AX, 0
	JNE HOURS
    PUSH AX

HOURS:
    ;แสดงผลชั่วโมง
    CALL OUTDEC

    ;ย้าย DX ใส่ AX
    MOV AX, DX
    PUSH AX
    
    ;แสดงผล :
	LEA DX, DOT
    MOV AH, 9
    INT 21H

    POP AX
	
    ;ล้างค่า DX
    XOR DX, DX
    ;กำหนดค่า CX เป็น 60
    MOV CX, 60
    ;หาร AX ด้วย CX
    DIV CX

    ;ถ้า AX ไม่เท่ากับ 0 ให้โดดไปทำ MINUTES
    CMP AX, 0
    JNE MINUTES
    PUSH AX

MINUTES:
    ;แสดงผลนาที
    CALL OUTDEC

    ;ฝากค่า DX ใน BX
    MOV BX, DX

    ;แสดงผล :
	LEA DX, DOT
    MOV AH, 9
    INT 21H

    ;ย้ายค่า BX ไปใส่ใน AX
    MOV AX, BX

SECONDS:
    ;แสดงผลวินาที
    CALL OUTDEC

    ;return to dos
    MOV AH, 4CH
    INT 21H
MAIN ENDP
INCLUDE	OUTDEC.ASM
INCLUDE	INDEC.ASM
	END MAIN
