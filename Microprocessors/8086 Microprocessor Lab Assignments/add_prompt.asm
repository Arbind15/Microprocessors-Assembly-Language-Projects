.model small
.stack 100H
.data
A DB ?
B DB ?
MSG1 DB 'Enter number: $'
MSG2 DB 'Sum is: $'
SUM DB ?
.code
main proc
    mov Ax,@DATA
    mov Ds,AX
    
    mov AH,9
    lea DX,MSG1
    int 21h
  
    
    mov AH,1
    int 21h
    mov A,AL  
    
    
    mov DL,0Dh
    mov AH,2
    int 21h
    
    mov DL,0Ah
    mov AH,2
    int 21h 
    
    
    
    
    
    
    mov AH,9
    lea DX,MSG1
    int 21h   
    
    mov AH,1
    int 21h
    mov B,AL
    
    mov DL,0Ah
    mov AH,2
    int 21h
    mov DL,0Dh
    mov AH,2
    int 21h
    
    
    mov AL,A
    Add AL,B
    mov SUM,AL  
    
    ;converting SUM to decimal
    ;mov AX,20h
    ;sub AX,SUM
    ;mov SUM,AX
    
    
    mov AH,9
    lea DX,MSG2
    int 21h 
    
     
   
    ;converting asii of sum to ascii of number 
    mov AL,SUM
    sub AL,30h
    mov BL,AL
    mov SUM,BL 
    
    
    mov AH,2
    mov DL,SUM
    int 21h
    
    
     
    
    
    mov AH,4CH
    int 21H
main ENDP

    