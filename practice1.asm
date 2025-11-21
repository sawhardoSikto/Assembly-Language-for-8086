.Model Small
.Stack 100H

.DATA
    MSG1 db 'Input $'
    MSG2 db 0dh,0ah, 'sum is: $'
    MSG3 db 0dh,0ah,  'Sum is greater than 12$'
    MSG4 db 0dh,0ah, 'Sum is not greater than 12$'
    
    N1 db ?
    N2 db ?   
    sum db ?
    
.Code 
    Main Proc
        mov ax,@DATA
        mov ds,ax
        
        ;prothom line ta print korbe
        mov ah,09
        lea dx,MSG1
        int 21h                 
                 
  
        
        ;prothom number input nicche 
        mov ah,1 
        int 21h 
        sub al,30h
        mov N1,al    
           ;NEWLINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
   
        
        ;2nd number input nicche 
        
        mov ah,1
        int 21h
        sub al,30h
        mov N2,al     
    
        
        
        ;sum korbe n1+n2
        
        mov al,N1
        Add al,N2
        Mov sum,al   
   
        
        ; print sum is 
        mov ah,09
        lea dx,MSG2
        int 21h     
 
        
        ;print sum
        mov ah,2
        mov dl,sum
        add dl,30h
        int 21h
        
        ;check sum >12?
        
        cmp sum,12
        jg ShowGt
        
        
        ;check sum<12
        
        cmp sum,12
        mov ah,09
        lea dx,MSG4
        int 21h
        jmp Exit 
                      
                     
                   
        
        
        
        
        
        
ShowGt:
    mov ah,09 
    lea dx,MSG3  
    int 21h
Exit:
    mov ah,4ch
    int 21                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
       
        
        
        
        
        