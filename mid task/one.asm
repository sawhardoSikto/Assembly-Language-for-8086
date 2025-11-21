
.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'Input: $'
    MSG_SUM DB 0DH,0AH,'Sum is: $'
    MSG_GT DB 0DH,0AH,'Sum is greater than 12$'
    MSG_LT DB 0DH,0AH,'Sum is NOT greater than 12$'

    N1  DB ?
    N2  DB ?
    SUM DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

; 1st promt ta dekhabe
    MOV AH,09
    LEA DX,MSG1
    INT 21H

; first number input nibe

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV N1,AL

; read second
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV N2,AL

; SUM = N1 + N2
    MOV AL,N1
    ADD AL,N2
    MOV SUM,AL

; print "Sum is: "
    MOV AH,09
    LEA DX,MSG_SUM
    INT 21H

; print SUM
    MOV AH,2
    MOV DL,SUM
    ADD DL,30H
    INT 21H

; check sum > 12 ?
    CMP SUM,12
    JG SHOW_GT

; sum <= 12
    MOV AH,09
    LEA DX,MSG_LT
    INT 21H
    JMP EXIT

SHOW_GT:
    MOV AH,09
    LEA DX,MSG_GT
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
