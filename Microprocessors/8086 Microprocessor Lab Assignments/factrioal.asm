.model small
.stack 100h
.data 

num dw 9

.code
main proc far
    mov AX,@data
    mov Ds,AX 
    

    mov CX,num
    mov AX,1
    mov DX,0
    
    while:
    
    mul CX
    
    dec cx
    cmp cx,1h
    jZ exit
    jmp while
    
    exit:
    
    mov BP,DX
    
    mov DI,AX
    
    call print
    
    
    
    mov Ah,4ch
    int 21h
main endp


print proc near
    push CX
     
    mov SI,0
    
    
    label1:
        cmp AX,0
        je print1
        
        
        
        mov bx,10
        div bx
        
        push dx 
        mov dx,0
        inc SI
        
        jmp label1 
    
    print1:
        cmp SI,0
        je exit1 
        pop dx
        add dx,48
        mov ah, 02h
        int 21h
        
        dec SI
        jmp print1 
        
    exit1:
    
    pop CX
    
    ret
    
print endp
