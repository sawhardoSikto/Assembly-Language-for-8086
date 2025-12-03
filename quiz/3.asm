.model small
.stack 100h

.data
    star db '#'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 1          ; starting row = 1

row_loop:
    mov bx, cx         ; BX = how many '#' to print for this row

print_loop:
    mov dl, star
    mov ah, 02h
    int 21h

    dec bx
    jnz print_loop     ; loop until BX becomes 0

    ; print newline
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    inc cx             ; next row (cx = 2,3,4,...)
    cmp cx, 11         ; stop after printing row 10
    jne row_loop

    mov ah, 4Ch
    int 21h
main endp
end main
