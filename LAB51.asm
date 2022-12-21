TITLE CLASS AVERAGE
.MODEL SMALL
.STACK 100H
.DATA
DOT DB ': $'
FOUR DW 4
CLASS DB 'MARY ALLEN  ', 67, 45, 98, 33
      DB 'SCOTT BAYLIS', 70, 56, 87, 44
      DB 'GEORGE FRANK', 82, 72, 89, 40
      DB 'SAM WONG    ', 78, 76, 92, 60
AVG DW 4 DUP(0)
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,2
    ;กำหนด SI เป็น 0
    MOV SI,0
REPEAT:
    ;ทำการกำหนดค่า CX เป็น 12
    MOV CX,12
    ;เคลียค่า BX ให้เป็น 0
    XOR BX,BX
FOR:
    ;ทำการเก็บตัวอักษรในตำแหน่งที่ BX+SI ไว้ใน DL
    MOV DL,CLASS[BX+SI]
    ;ทำการเพิ่มค่า BX ขึ้น 1
    ADD BX,1
    ;ทำการแสดงผลตัวอักษร
    INT 21H
    ;ทำการทำซ้ำลูปตามจำนวน CX
    LOOP FOR

    ;ทำการแสดงผล string ;
    LEA DX, DOT
    MOV AH, 9
    INT 21H

    ;กำหนดค่า SI ให้เป็น 12
    MOV SI,12

REPEAT1:
    ;ทำการกำหนดค่า CX เป็น 4
	MOV	CX, 4
    ;เคลียค่า BX ให้เป็น 0
	XOR	BX, BX
    ;เคลียค่า AX ให้เป็น 0
	XOR	AX, AX
FOR1:
    ;ทำการเก็บตัวเลขในตำแหน่งที่ BX+SI ไว้ใน AL
	MOV AL,CLASS[BX+SI]
    ;ทำการกำหนดค่า AH ให้เป็น 0
    MOV AH,0
    ;ทำการเพิ่มค่า AX เข้าไปใน array แบบ word AVG ที่สร้างไว้ในตำแหน่ง SI
    ADD	AVG[SI],AX
    ;ทำการเพิ่มค่า BX ขึ้น 1
    ADD BX,1
    ;ทำการวนลูปซ้ำตามจำนวน CX
	LOOP FOR1
    
    ;ทำการเคลียค่า AX ให้เป็น 0
    XOR AX,AX
    ;ย้ายค่าทั้งหมดใน array AVG ไปไว้ใน AX
    MOV AX,AVG[SI]
    ;ทำการเคลียค่า DX ให้เป็น 0
	XOR	DX, DX
    ;ทำการหาร AX ด้วย 4
    DIV FOUR
    ;ทำการแสดงผลจำนวนที่หารแล้ว
    CALL OUTDEC

    ;ขึ้นบรรทัดใหม่
	MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

;โค้ดจากนี้ไปจะทำงานเหมือน 2 ลูปหมดทุกประการยกเว้นการกำหนด SI เริ่มต้น
;สำหรับชื่อและคะแนนโดยชื่อจะเพิ่มครั้งละ 5 และคะแนนจะเพิ่มครั้งละ 16 เรียงลำดับไปตามแต่ละคน
    MOV SI,16
REPEAT2:
    MOV CX,12
    XOR BX,BX
FOR2:
    MOV DL,CLASS[BX+SI]
    ADD BX,1
    INT 21H
    LOOP FOR2

    LEA DX, DOT
    MOV AH, 9
    INT 21H

    MOV SI,28

REPEAT3:
	MOV	CX, 4
	XOR	BX, BX
	XOR	AX, AX
FOR3:
	MOV AL,CLASS[BX+SI]
    MOV AH,0
    ADD	AVG[SI],AX
    ADD BX,1
	LOOP FOR3
    
    XOR AX,AX
    MOV AX,AVG[SI]
	XOR	DX, DX
    DIV FOUR
    CALL OUTDEC

	MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    MOV SI,32
REPEAT4:
    MOV CX,12
    XOR BX,BX
FOR4:
    MOV DL,CLASS[BX+SI]
    ADD BX,1
    INT 21H
    LOOP FOR4

    LEA DX, DOT
    MOV AH, 9
    INT 21H

    MOV SI,44

REPEAT5:
	MOV	CX, 4
	XOR	BX, BX
	XOR	AX, AX
FOR5:
	MOV AL,CLASS[BX+SI]
    MOV AH,0
    ADD	AVG[SI],AX
    ADD BX,1
	LOOP FOR5
    
    XOR AX,AX
    MOV AX,AVG[SI]
	XOR	DX, DX
    DIV FOUR
    CALL OUTDEC

	MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    MOV SI,48
REPEAT6:
    MOV CX,12
    XOR BX,BX
FOR6:
    MOV DL,CLASS[BX+SI]
    ADD BX,1
    INT 21H
    LOOP FOR6

    LEA DX, DOT
    MOV AH, 9
    INT 21H

    MOV SI,60

REPEAT7:
	MOV	CX, 4
	XOR	BX, BX
	XOR	AX, AX
FOR7:
	MOV AL,CLASS[BX+SI]
    MOV AH,0
    ADD	AVG[SI],AX
    ADD BX,1
	LOOP FOR7
    
    XOR AX,AX
    MOV AX,AVG[SI]
	XOR	DX, DX
    DIV FOUR
    CALL OUTDEC

    ;return to dos
	MOV	AH,4CH
	INT	21H

MAIN	ENDP
INCLUDE	OUTDEC.ASM
	END	MAIN