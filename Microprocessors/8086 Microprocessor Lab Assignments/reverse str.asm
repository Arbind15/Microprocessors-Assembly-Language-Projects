.model small
.data 
str1 dw 'Arbind Mehta$'
str2 dw ?
.stack
.code
main proc far
    mov AX,@data
    mov ds,AX
    
    mov BX,0h
    while1:
    mov AX,str1[BX]
    cmp AX,'$'
    je done1
    push AX
    inc BX
    jmp while1
    
    done1: 
    
    mov DI,0h
    
    while2:
    
    pop AX
    mov str2[DI],AX
    dec BX
    inc DI
    cmp BX,0h
    je done2
    jmp while2
    
    done2:
          
    mov str2[DI],'$'
    
    mov AH,09
    lea DX,str2
    int 21h
    
    
    mov AH,4ch
    int 21h
    
    main endp
