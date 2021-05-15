.model small
.stack 
.data
table1 Db 200,7,5,2,4,3,10,'$'
.code
main proc far 
    mov AX,@data
    mov ds,AX 
    
    mov SI,0h
    while:
        mov Cl,table1[SI]
        cmp Cl,'$'
        je exit
        
        mov ch,1h
        while2:
            cmp ch,0Bh
            je exit2
             
            mov Al,ch
            mul cl
            call print
            
            mov dl,0ah
            int 21h
            mov dl,0dh
            int 21h
            
            INC ch
            jmp while2
        
      
        exit2:
        
        mov ah,02h
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        ;mov dl,30h
        ;mov dh,12h
        ;mov ah,2h
        ;mov bh,0h
        ;int 10h
      
        inc SI
        jmp while
    
    
    exit:
    
    ;mov DX,table1[2] 
    
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
        
        mov bx,10
        div bx
        
        push dx
        inc cx
        mov dx,0
        jmp label1 
    
    print1:
        cmp cx,0
        je exit1 
        pop dx
        add dx,48
        mov ah, 02h
        int 21h
        
        dec cx
        jmp print1 
        
    exit1:
    
    pop CX
    
    ret
    
print endp
