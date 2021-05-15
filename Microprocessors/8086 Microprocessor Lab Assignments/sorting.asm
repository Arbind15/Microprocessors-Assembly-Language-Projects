.model smaal
.stack
.data
data1 db '6','4','2','9','7',,'5','0','3','$'
.code
main proc far
    mov AX,@data
    mov ds,Ax 
    mov DI,0h
    
    
    
    while1:
        cmp data1[DI],'$'
        je done1
        
        mov SI,0h
        
        while2:
               mov DX,0h
               mov DH,data1[SI+1] 
               mov DL, data1[SI]
               cmp DH,'$'
               je done2 
                
               cmp DL,DH
               jl SKIP
               mov data1[SI],DH
               mov data1[SI+1],DL
               
               SKIP:
               inc SI 
               
               jmp while2 
               
        done2:
               
        
        inc DI
        jmp while1
    
    done1:
    
    mov Ah,09
    lea DX,data1
    int 21h 
    
    mov Ah,4ch
    int 21h
    
    main endp