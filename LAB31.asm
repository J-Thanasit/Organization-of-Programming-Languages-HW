.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC                     
    MOV CX,10
    MOV AH,2
    MOV BL,80H
   
REPEAT:
    MOV DL,BL
    INT 21H
    MOV DL,' '
    INT 21H
    
    INC BL
    DEC CX

    CMP CX,0
    JE NEW_LINE
    CMP BL,0FFH 
    JE END_
    JMP REPEAT
     
NEW_LINE:        
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV CX,10
    JMP REPEAT

END_:
    MOV AH,4CH
    INT 21H
        
    MAIN ENDP
END MAIN
