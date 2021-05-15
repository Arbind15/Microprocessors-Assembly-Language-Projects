.model small
.stack 
.data
table1 Dw 2Ah
.code
main proc far 
    mov AX,@data
    mov ds,AX 
    
    mov AX,table1
    call print
    
    
    
    mov AH,4ch
    int 21h     
    
main endp
          
print proc near
    push CX
     
    mov cx,0
    mov dx,0
    
    label1:
        cmp ax,0
        je print1
        
        mov bx,10h  ;hex
        div bx
        
        push dx
        inc cx
        mov dx,0
        jmp label1 
    
    print1:
        cmp cx,0
        je exit1 
        pop dx
        cmp dx,0Ah
        jge CHAR
        add dx,48
        jmp skip
        
        CHAR:
        add dx,55
        
        skip:
        
        mov ah, 02h
        int 21h
        
        dec cx
        jmp print1 
        
    exit1:
    
    pop CX
    
    ret
    
print endp
