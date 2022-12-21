.MODEL SMALL
.STACK 100H
.DATA
MSG	DB 'ENTER THREE INITIALS: $'
.CODE

MAIN PROC
    ; initialize DS
	MOV	AX, @DATA
	MOV	DS, AX

    ;display message
    LEA	DX, MSG
	MOV	AH, 9
	INT	21H	

    ;input
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL
    INT 21H
    MOV CH,AL

    ;new line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;output 1 + newline
    MOV DL,BL
    INT 21H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;output 2 + newline
    MOV DL,CL
    INT 21H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;output 3
    MOV DL,CH
    INT 21H

    ;return to DOS
    MOV	AH, 4CH
	INT	21H		
MAIN ENDP
    END MAIN