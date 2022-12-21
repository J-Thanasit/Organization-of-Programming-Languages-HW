.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    ;display prompt
    MOV AH,2
	MOV	DL,'?'
	INT	21H	

    ;input 2 characters
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL
    CMP BL,CL
    ;if 
    JG HIGHER

    ;new line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;output
    MOV DL,BL
    INT 21H
    MOV DL,CL
    INT 21H
    JMP END_IF

HIGHER:
    ;new line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;output
    MOV DL,CL
    INT 21H
    MOV DL,BL
    INT 21H

END_IF:
    MOV	AH, 4CH
	INT	21H	

MAIN ENDP
    END MAIN