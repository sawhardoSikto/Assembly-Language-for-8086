.Model Small
.Stack 100h

.Data
    msg1 db 'please enter your three number: $'
    msg2 db 0dh,0ah, 'the maximum number is: $'
    
    n1 db ?
    n2 db ?
    n3 db ? 
    max db ?
.Code
    main proc 
        ;load data
        mov ax,@data
        mov ds,ax
        
        ;msg1 output dekhabe
         
        mov ah,09   ;string print kore     
        lea dx,msg1 ;DX er moddhe kon jinis ta print korbo seta rekhe dite hoy 
        int 21h    
        
        ;ekhon 1st number input nibe 
        
        mov ah,1  ;keyboard theke 1 character input ney ,seta AL er moddhe store kore 
        int 21h
        sub al,30h
        mov n1,al
        
        ;ekhon new line print hobe jemon c++ e cout<<endl use kori temon 
        
        mov ah,2   ; eta Ah,9 er motoi kaj kore shudhu eta 1ta character er jonno 
        mov dl,10  ; same kaj kora hoiche kon jinista print korbo seta DL er moddhe rakhte hobe 
        int 21h
        mov dl,13
        int 21h
        
        
        ;ekhon 2nd nubmer input  nibe
        
        mov ah,1
        int 21h
        sub al,30h
        mov n2,al
        
        ;ekhon new line print hobe jemon c++ e cout<<endl use kori temon 
        
        mov ah,2   ; eta Ah,9 er motoi kaj kore shudhu eta 1ta character er jonno 
        mov dl,10  ; same kaj kora hoiche kon jinista print korbo seta DL er moddhe rakhte hobe 
        int 21h
        mov dl,13
        int 21h
        
        
        ;ekhon 3rd number input nibe
        
        mov ah,1
        int 21h
        sub al,30h
        mov n3,al
        
        ;check maximun number 
        
        mov al,n1
        mov max,al
        
        ;check n2  
        mov al,n2
        cmp al,max
        jle skip1
        
        mov max,al
        
        
        
         skip1:
            ;compare with n3
            mov al,n3
            cmp al,max
            jle skip2
            mov max,al
        skip2:
            
            mov ah,09
            lea dx,msg2
            int 21h
            
            mov ah,2
            mov dl,max
            add dl,30h
            int 21h  
            
            mov ah,4ch
            int 21h 
            
        
        