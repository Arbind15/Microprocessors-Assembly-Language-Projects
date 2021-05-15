;generate mutiplication table

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
        
        
        ;sub AL,30h ;convert ascii to num
        SHL BX,8
        OR BL,AL 
        
        cmp CL,03h
        je DONE
         
        inc CL
        jmp INPUT1
    
    
    DONE:
    
    mov TNUM,BX
    
    ;mov DL,0DH
    ;mov AH,2
    ;int 21H
    ;mov DL, 0AH
    ;int 21H
   
    
    call DEC_TO_HEX
    
    ;JMP DONE1
    
    
    
    mov CX,0000h
    
    TABLE:
        inc CL
        cmp CL,10d
        je DONE1
        
        mov DL,0DH
        mov AH,2
        int 21H
        mov DL, 0AH
        int 21H
        mov DL,BL
        int 21h
        mov DL,'x'
        int 21h
        mov DL,CL 
        add DL,30h
        int 21H
        mov DL,'='
        int 21h
        
        mov AL,CL
        mul BH
        
        call DISPLAY_DIGIT
        
        
        
        jmp TABLE
        
    DONE1:
    
    ;mov Al,0fh
    ;mov bl,10h
    ;mul bl
    
    ;mov DI,AX
  
    
    
    mov AH,4CH
    int 21h
    
main ENDP 


DISPLAY_DIGIT proc
    
    ;initilize count 
    mov DI,0 
    mov DX,0 
    label3: 
        ; if ax is zero 
        cmp AX,0 
        je print1       
          
        ;initilize bx to 10 
        mov SI,10         
          
        ; extract the last digit 
        div SI                   
          
        ;push it in the stack 
        push DX               
          
        ;increment the count 
        inc DI               
          
        ;set dx to 0  
        xor DX,DX 
        jmp label3 
    print1: 
        ;check if count  
        ;is greater than zero 
        cmp DI,0 
        je exit
          
        ;pop the top of stack 
        pop DX 
          
        ;add 48 so that it  
        ;represents the ASCII 
        ;value of digits 
        add DX,48 
          
        ;interuppt to print a 
        ;character 
        mov AH,02h 
        int 21h 
          
        ;decrease the count 
        dec DI 
        jmp print1
         
    exit: 
    
        RET
DISPLAY_DIGIT ENDP



DEC_TO_HEX proc 
    
    ;initialize count 
    mov cx,0h
    
    mov dx,0h
    mov AX,TNUM 
    label4: 
        ;ax is zero 
        cmp ax,0
        je print2 
      
    ;initialize bx to 16 
        mov bx,16 
      
    ;divide it by 16 
    ;to convert it to Hexadecimal 
        div bx 
      
    ;push it in the stack 
        push dx 
      
    ;increment the count 
        inc cx 
      
    ;set dx to 0 
        xor dx,dx 
        jmp label4
        
        
    xor bx,bx 
    print2: 
        ;check if count 
        ;is greater than zero 
        cmp cx,0 
        je exit2
          
        ;pop the top of stack 
        pop dx 
          
        ;compare the value 
        ;with 9 
        cmp dx,9 
        jle continue
          
        ;if
        ;value is greater than 9 
        ;then add 7 so that after 
        ;adding 48 it represents A 
        ;for example 10 + 7 + 48 = 65 
        ;which is ASCII value of A 
        add dx,7 
      
    continue:
    
    SHL BX,8
    OR BX,DX 
      
    ;add 48 so that it 
    ;represents the ASCII 
    ;value of digits 
        ;add dx,48 
      
    ;interrupt to print a 
    ;character 
        ;mov ah,02h 
        ;int 21h 
      
    ;decrease the count 
        dec cx 
        jmp print2
         
    exit2:
    RET
        
DEC_TO_HEX ENDP    

END main

