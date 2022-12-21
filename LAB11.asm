.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    ;display prompt
    MOV AH,2
	MOV	DL,'?'
	INT	21H	

    ;input
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL

    ;new line
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H


    ;output
    ADD CL,BL
    SUB CL,30H
    MOV DL,CL
    INT 21H

    ;return to DOS
    MOV	AH, 4CH
	INT	21H		
MAIN ENDP
    END MAIN