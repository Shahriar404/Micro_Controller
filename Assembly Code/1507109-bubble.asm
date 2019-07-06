; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
MOV DX,6
LEA DI,NUM
LEA SI,NUM



A: 
;MOV SI,DI
MOV CX,DX
DEC DX

MOV AL,[SI]
;MOV ,SI
;MOV DI,TEMP
LEA DI,SI
DEC CX

CALL BS
JMP EXIT

K:
BS PROC NEAR
    CMP DX,00H
    JE E
    INC DI
    MOV BL,[DI]
    CMP AL,BL 
    
    
    JBE R
    MOV [DI],AL
    MOV [SI],BL
    MOV AL,BL
    

    R:
    LOOP K
    RET
    ENDP
    
    
    
;MOV AX,[BX]
;INC AX
;RET
;ENDP



EXIT:
;MOV [SI],AX
INC SI
CMP DX,01H
JAE A
ret

E:
RET


NUM DB 02H,03H,04H,03H,05H
;TEMP DB 00H




