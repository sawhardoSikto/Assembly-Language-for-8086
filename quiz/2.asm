.MODEL SMALL
.STACK 100H

.DATA
    space db ' $'
    lucky db 'LUCKY ', '$'

.CODE
MAIN PROC
    mov ax,@data
    mov ds,ax

    mov cx,30     ; loop 1?30
    mov bl,1      ; number counter

StartLoop:
    mov al,bl
    mov ah,0

    ; Check multiple of 7 ? print "LUCKY"
    mov dl,7
    div dl         ; AL/DL ? AH = remainder
    cmp ah,0
    je PrintLucky

    ; otherwise print number
    mov dl,bl
    add dl,30h
    mov ah,02h
    int 21h

    ; print space
    mov ah,09
    lea dx,space
    int 21h
    jmp Continue

PrintLucky:
    mov ah,09
    lea dx,lucky
    int 21h

Continue:
    inc bl
    loop StartLoop

    mov ah,4ch
    int 21h
MAIN ENDP
END MAIN
