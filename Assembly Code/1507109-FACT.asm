
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
MOV BL,5
LEA DI,NUM
LEA SI,FAC

;CX=5
A:
DEC BL
MOV DL,[DI]
MOV CL,DL
INC DI

MOV AX,CX
DEC CX


CALL FACT 
JMP EXIT

K:
FACT PROC NEAR
    MUL CX
    LOOP K
    RET
    ENDP
    
    
    
;MOV AX,[BX]
;INC AX
;RET
;ENDP


EXIT:
MOV [SI],AX
INC SI
INC SI
CMP BL,01H
JAE A
ret

NUM DB 02H,03H,04H,05H,06H
FAC DW 00H,00H,00H,00H,00H


