TITLE CLASS XYZ
.MODEL SMALL
.STACK 100H
.DATA
COL DB ', $'
THREE DW 3 ;สร้างตัวแปรและกำหนดค่าไว้สำหรับการหาร
XYZ DW 63, 50, 72, 97, 47, 35, 48 ; X
    DW 49, 80, 80, 57, 20, 55, 63 ; Y
    DW 7 DUP(0) ; Z
.CODE	
MAIN PROC
	MOV	AX, @DATA
	MOV	DS, AX
	MOV	SI, 0 ;แถว X
    MOV DI, 14 ;แถว Y
REPEAT:
	MOV	CX, 7 ;ทำซ้ำ 7 ครั้ง
	XOR	AX, AX ;เคลียค่า AX

FOR:
	MOV	AX, XYZ[SI] ;ทำการกำหนดค่าให้ AX
    MOV BX, XYZ[DI] ;ทำการกำหนดค่าให้ BX
    XOR	DX, DX ;เคลียค่า DX ไว้สำหรับการหาร
    MUL BX ;คูณ AX ด้วย BX
    DIV THREE ;หาร AX ด้วย 3

    ADD XYZ[SI],AX ;เก็บค่า Z ไปใน array XYZ
    CALL OUTDEC ;แสดงผลตัวเลข Z

    ;แสดงเครื่องหมาย ,  
    LEA DX, COL
    MOV AH, 9
    INT 21H

    ADD SI,2 ;เพิ่มค่าให้ SI อีก 2
    ADD DI,2 ;เพิ่มค่าให้ DI อีก 2
    LOOP FOR ;ทำการวนลูปๅ FOR

    ;return to dos
	MOV	AH, 4CH
	INT	21H
MAIN	ENDP
INCLUDE	OUTDEC.ASM
	END	MAIN