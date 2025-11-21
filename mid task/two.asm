.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB "ENTER THREE INITIALS:$"
    ERRMSG DB 0DH,0AH,"INVALID INPUT$"
    NL DB 0DH,0AH,"$"
    A DB ?
    B DB ?
    C DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Show prompt
    LEA DX,PROMPT
    MOV AH,9
    INT 21H

    ; Input A
    MOV AH,1
    INT 21H
    MOV A,AL
    CMP AL,'A'
    JL BAD
    CMP AL,'Z'
    JG BAD

    ; Input B
    MOV AH,1
    INT 21H
    MOV B,AL
    CMP AL,'A'
    JL BAD
    CMP AL,'Z'
    JG BAD

    ; Input C
    MOV AH,1
    INT 21H
    MOV C,AL
    CMP AL,'A'
    JL BAD
    CMP AL,'Z'
    JG BAD

    ; print newline
    LEA DX,NL
    MOV AH,9
    INT 21H

    ; print reverse: C B A
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

    JMP EXIT

BAD:
    LEA DX,ERRMSG
    MOV AH,9
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
