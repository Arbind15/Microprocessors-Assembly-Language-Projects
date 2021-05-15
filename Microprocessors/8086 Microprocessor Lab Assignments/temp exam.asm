page 60,132
title exam pratice
.model small
.stack 100h
.data 
Temp db 20 dub(?)
.code
main proc far
    mov AX,@DATA
    mov DS,AX 
    
    mov AH,0Ah
    lea DX,Temp
    int 21h 
    
    mov Ah,02h
    mov dl,0ah
    int 21h
    
    mov Ah,02h
    mov dl,0dh
    int 21h 
    
    mov Ah,9h
    lea DX,temp
    int 21H
    
    mov AH,4ch
    int 21h
    
main endp