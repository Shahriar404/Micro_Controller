
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
ST1 DB 'KA4M5'
LN EQU ($-ST1)
ST2 DB '00000'
ST3 DB '00000'

;VAR DB 00H

.CODE
LEA SI,ST1
LEA DI,ST2
LEA BX,ST3

MOV CX,LN


L:
    MOV AX,[SI]

    CMP AX,'0'
    JB LP
    CMP AX,'9'
    JA LP
    
    MOV [DI],AX
    
    INC DI
    LP:
    INC SI
    CMP CX,00H
    JBE E
    
    LOOP L





E:
JMP EXIT



;C:
;MOV [BX],AX
;INC BX
;INC SI
;CMP CX,00H
;JBE E
;JMP LP


EXIT:
RET
