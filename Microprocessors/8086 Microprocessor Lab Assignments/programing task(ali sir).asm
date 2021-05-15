;prompt the user to enter a line of text. on the next line, display the
;capital letter entered that comes first alphabetically and the one 
;that comes last. if no capital letters are entered, display
;"No Capital letters" 
                
.model small
.stack 100H
.data
label1 DB "Enter line of text: $"
label2 DB "No Capital letters! $" 
label3 DB "Capital letters are(Alphabetically): $"
label4 DB "Capital letters are: $"
text DB 11H DUP(?)
capital_letter DB 11H DUB(?)

.code 
main proc
    mov AX,@DATA
    mov DS,AX
    
    mov AH,9
    lea DX,label1
    int 21H
    mov DL,0DH
    mov AH,2
    int 21H
    mov DL, 0AH
    mov AH,2
    int 21H 
    
    mov AH,1
    int 21H
    
    mov DI,00H
    
    WHILE:
        cmp AL,0DH
        je ENDWHILE
        
        mov text[DI],AL
        
        INC DI
        
        int 21H
        jmp WHILE
    
    ENDWHILE:
    
    mov text[DI],'$'
    
    mov DL,0DH
    mov AH,2
    int 21H
    mov DL, 0AH
    mov AH,2
    int 21H
             
    mov DI,00H
    mov AH,2
    mov SI,00H
    
    WHILE1:
         mov DL,text[DI]
         cmp DL,'$'
         je ENDWHILE1
         
         cmp DL,41H
         jl SKIP
         cmp DL,5AH
         jg SKIP
         
         mov capital_letter[SI],DL 
         inc SI
         
                 
         SKIP:
         inc DI
         ;int 21H 
        
         jmp WHILE1
         
    ENDWHILE1:
    
    mov capital_letter[SI],'$'
    cmp SI,0000H
    je NOCAPITAL
    
    mov DL,0DH
    mov AH,2
    int 21H
    mov DL, 0AH
    mov AH,2
    int 21H
    
    mov AH,9
    lea DX,label4
    int 21H 
    lea DX,capital_letter
    int 21H
    
    
    mov DI,00H
    mov AH,2
    
    WHILE2:
        mov BL,capital_letter[DI] 
        cmp BL,'$'
        je ENDWHILE2
        inc DI
        mov SI,DI
        dec DI
        
        WHILE3:
            mov CL,capital_letter[SI] 
            cmp CL,'$'
            je ENDWHILE3
            cmp BL,CL
            jl SKIP1 
            mov capital_letter[DI],CL
            mov capital_letter[SI],BL
            mov BL,capital_letter[DI] 
            
            SKIP1:
            inc SI
            jmp WHILE3
        ENDWHILE3:
        inc DI
        ;int 21H
        jmp WHILE2
    
    ENDWHILE2:       
             
            
    mov DL,0DH
    mov AH,2
    int 21H
    mov DL, 0AH
    mov AH,2
    int 21H
    
    mov AH,9
    lea DX,label3
    int 21H 
    
    mov AH,9
    ;lea DX,text
    lea DX,capital_letter;
    int 21H 
    
    jmp EXIT
    
    NOCAPITAL:
    mov AH,9
    ;lea DX,text
    lea DX,label2;
    int 21H
    
    EXIT:
      
    
    
   
    
    mov AH,4CH
    int 21H
    
main ENDP
