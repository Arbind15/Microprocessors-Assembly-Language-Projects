page 60,132
title exam pratice
.model small
.stack 100h
.data 
Temp db ?
.code

proce proc  near
     mov Ah,9h
    lea DX,Temp
    int 21H
   ret
proce endp

    
    

main proc far
    mov AX,@DATA
    mov DS,AX 
   
     mov SI,00h
     l1:
     mov AH,01h
     int 21h
     mov temp[SI],AL
     inc SI
     cmp AL,0dh
     je exit
     jmp l1
     exit:
     mov temp[SI],'$'
     
     mov AH,02h
     mov dl,0dh
     int 21h 
     mov AH,02h
     mov dl,0ah
     int 21h
     
     
     
     mov AH,09h 
     lea DX,temp
     int 21h
     
     
     
   
    
    mov AH,4ch
    int 21h
    
main endp
end main