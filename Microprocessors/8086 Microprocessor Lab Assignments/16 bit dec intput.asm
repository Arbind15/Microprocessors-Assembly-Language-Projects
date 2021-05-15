;16 bit decimal input "TNUM" contains decimal input

.model small
.stack 100h
.data
LABEL1 DB "Enter number: $"
TNUM DW ?
.code 
main proc
    
    mov AX,@DATA
    mov DS,AX
    
    mov AH,9
    lea DX,LABEL1
    int 21H   
    
    mov CX,0000h
    mov BX,0000h
    mov AH,1   
    INPUT1:
        int 21H
        mov CH,AL
        
        cmp CH,0Dh
        je DONE
        
        
        sub AL,30h ;convert ascii to num
        SHL BX,4
        OR BL,AL
        
        cmp CL,03h
        je DONE
         
        inc CL
        jmp INPUT1
    
    
    DONE:
    
    mov TNUM,BX 
    
    ;mov Ah,02h
    ;mov DL,label1[8]
    ;int 21h
   
    mov AH,4CH
    int 21h
    
main ENDP