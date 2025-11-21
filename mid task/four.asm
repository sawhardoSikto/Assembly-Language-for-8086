.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB "ENTER THREE INITIALS:$"
    NL DB 0DH,0AH,"$"
    A DB ?
    B DB ?
    C DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,PROMPT
    MOV AH,9
    INT 21H

    ; read 3 chars
    MOV AH,1
    INT 21H
    MOV A,AL

    MOV AH,1
    INT 21H
    MOV B,AL

    MOV AH,1
    INT 21H
    MOV C,AL

    ; print newline
    LEA DX,NL
    MOV AH,9
    INT 21H

    MOV AH,2
    MOV DL,C
    INT 21H
    LEA DX,NL
    MOV AH,9
    INT 21H

    MOV DL,B
    MOV AH,2
    INT 21H
    LEA DX,NL
    MOV AH,9
    INT 21H

    MOV DL,A
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
