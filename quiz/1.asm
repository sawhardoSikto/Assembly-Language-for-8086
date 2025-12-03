.MODEL SMALL
.STACK 100H

.DATA
    Amsg db 'AAA',0dh,0ah,'$'
    newline db 0dh,0ah,'$'
    Bmsg db 'BBB',0dh,0ah,'$'
    Cmsg db 'CCC',0dh,0ah,'$'

.CODE
MAIN PROC
    mov ax,@data
    mov ds,ax

    ; Print AAA 3 times
    mov cx,3
A_loop:
    mov ah,09  ;string print kore
    lea dx,Amsg   ;DX er moddhe kon jinis ta print korbo seta rekhe dite hoy 
    int 21h
    loop A_loop

    ; Blank line
    mov ah,09
    lea dx,newline
    int 21h

    ; Print BBB 5 times
    mov cx,5
B_loop:
    mov ah,09
    lea dx,Bmsg
    int 21h
    loop B_loop

    ; Print CCC 2 times
    mov cx,2
C_loop:
    mov ah,09
    lea dx,Cmsg
    int 21h
    loop C_loop

    ; Exit
    mov ah,4ch
    int 21h
MAIN ENDP
END MAIN

