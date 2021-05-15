;generate mutiplication table

.model small
.stack 100h
.data
NUM DB ?
LABEL1 DB "Enter number: $"

.code 
main proc
    
    mov AX,@DATA
    mov DS,AX
    
    mov AH,9
    lea DX,LABEL1
    int 21H
    
    mov AH,1
    int 21H
    mov BL,AL
    
    mov BH,BL
    sub BH,30h ;convert ascii to num
    
    
    
    mov CL,00h
    
    TABLE:
        inc CL
        cmp CL,10d
        je DONE
        
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
        
    DONE:
    
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

END main