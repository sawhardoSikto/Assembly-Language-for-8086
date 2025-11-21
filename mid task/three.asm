.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "Enter 1st digit:$"
    MSG2 DB "Enter 2nd digit:$"
    MSG3 DB "Enter 3rd digit:$"
    SMMSG DB 0DH,0AH,"Smallest: $"
    LGMSG DB 0DH,0AH,"Largest: $"
    A DB ?
    B DB ?
    C DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Read A
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV A,AL

    ; Read B
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV B,AL

    ; Read C
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV C,AL

    ; ---- Find smallest ? AL ----
    MOV AL,A
    CMP B,AL
    JL SM_B
    CMP C,AL
    JL SM_C
    JMP PRINT_SM

SM_B:
    MOV AL,B
    CMP C,AL
    JL SM_C
    JMP PRINT_SM

SM_C:
    MOV AL,C

PRINT_SM:
    LEA DX,SMMSG
    MOV AH,9
    INT 21H
    ADD AL,'0'
    MOV DL,AL
    MOV AH,2
    INT 21H

    ; ---- Find largest ? AL ----
    MOV AL,A
    CMP B,AL
    JG LG_B
    CMP C,AL
    JG LG_C
    JMP PRINT_LG

LG_B:
    MOV AL,B
    CMP C,AL
    JG LG_C
    JMP PRINT_LG

LG_C:
    MOV AL,C

PRINT_LG:
    LEA DX,LGMSG
    MOV AH,9
    INT 21H
    ADD AL,'0'
    MOV DL,AL
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
