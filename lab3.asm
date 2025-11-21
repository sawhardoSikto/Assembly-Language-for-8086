; Program: Convert lowercase letter to uppercase


.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER A LOWER-CASE LETTER: $'
    MSG2 DB 0DH,0AH,'IN UPPERCASE IT IS: $'
    CHAR DB ?          ; to store user input

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display first message
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Take one character input
    MOV AH, 1
    INT 21H
    MOV CHAR, AL        ; store input in CHAR

    ; Convert lowercase to uppercase
    ; ASCII: 'a' = 97, 'A' = 65, difference = 32
    SUB AL, 32          ; AL = AL - 32 (convert to uppercase)

    ; New line and show message
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Display converted character
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN       





