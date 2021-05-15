;STORE HEX CODE ENTERED INTO BX REGISTER WITH SHIFTING

.MODEL SMALL
.STACK 100H
.DATA 
LABEL1 DB "Enter Hex Code: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV BX,0000H
    MOV CL,4
    
    MOV AH,9
    LEA DX,LABEL1
    INT 21H
    
    MOV AH,1
    INT 21H
    WHILE:
        CMP AL,0DH
        JE ENDWHILE
        
        
        CMP AL,39H
        JG LETTER
        
        AND AL,0FH
        JMP SHIFT
        
        LETTER:
            SUB AL,37H
        
        SHIFT:
            SHL BX,CL
            OR BL,AL
            
        INT 21H        
        JMP WHILE
    
    ENDWHILE:
       
    MOV AH,4CH
    INT 21H
MAIN ENDP