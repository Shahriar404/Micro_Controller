org  100h	; set location counter to 100h

.data
ARR1 DB 01H,02H,03H,04H,05H,06H,07H,08H,09H,10H
ARR2 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
CNT DB 00H
E DB 00H

.CODE
LEA SI,ARR1 
LEA DI,ARR2


A:
INC E
MOV AL,[SI]
CALL PRIME
;MOV AX,E
CMP E,10H
JNE A
CMP E,10H
JE X



PRIME PROC NEAR:
    MOV CL,AL
    B:
    MOV AL,[SI]
    DIV CL
    CMP AH,01H
    JE K
    INC CNT
    K:
    MOV AH,00H 
    LOOP B
    ;MOV BX,CNT
    CMP CNT,02H
    JA N
    MOV AL,[SI]
    MOV [DI],AL
    INC DI
    N:
    INC SI
    MOV CNT,00H
    ENDP






X:
ret   






