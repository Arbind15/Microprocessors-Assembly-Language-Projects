; this program alternate the case of letters

.model small
.stack 100H
.data
label1 DB "Enter line of text: $" 
label3 DB "Line of text after case conversion: $"
text DB 11H DUP(?)
inverted_letters DB 11H DUB(?)

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
         jle TOLOWER
         
         cmp DL,61H
         jl SKIP
         cmp DL,7AH
         jle TOUPPER
         
         jmp SKIP
        
                 
         TOUPPER:
            sub DL,20h
            mov inverted_letters[SI],DL 
            inc SI
            jmp DONE
         
         TOLOWER:
            add DL,20h
            mov inverted_letters[SI],DL 
            inc SI
            jmp DONE
         
         
         SKIP:
            mov inverted_letters[SI],DL 
            inc SI
         
         DONE:
             inc DI
             jmp WHILE1
         
    ENDWHILE1:
    
    mov inverted_letters[SI],'$'
    
    mov DL,0DH
    mov AH,2
    int 21H
    mov DL, 0AH
    mov AH,2
    int 21H
    
    mov AH,9
    lea DX,label3
    int 21H 
    lea DX,inverted_letters
    int 21H
    
    
    mov DI,00H
    mov AH,2
 
    
    EXIT:
      
    
    
   
    
    mov AH,4CH
    int 21H
    
main ENDP
