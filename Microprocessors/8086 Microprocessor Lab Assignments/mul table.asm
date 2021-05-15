.model small
.stack 
.data
table1 DW 50 DUP (?)
.code
main proc far 
    mov AX,@data
    mov ds,AX
    
    mov Al,0h
    mov AH,01h
    int 21h
    
    sub Al,30h  
    
    mov SI,01h
    mov DI,0h 
    
    while:
    cmp SI,4h
    je exit
    mul SI 
    add AX,30h
    
    mov table1[DI],AX 
    INC DI
    mov table1[DI],' ' 
    
    
    inc SI
    jmp while
    exit:
            
    INC DI
    mov table1[DI],'$'
    
    mov AH, 09h
    lea DX,table1
    int 21h          

    
    
     
    
main endp
