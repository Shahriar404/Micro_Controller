
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
MARK DB 87H,77H,63H,70H
GRADE DW 'F','F','F','F'
GP DB 00H,00H,00H,00H
GPA DB 00H

.CODE
MOV CX,04H
LEA BX,MARK
LEA SI,GRADE
LEA DI,GP

A:
MOV AL, [BX]
CMP AL,80H
JAE GA
CMP AL,70H
JAE GB
CMP AL,60H
JAE GC
CMP AL,50H
JAE GD

MOV DL,00H
ADD GPA,DL
JMP INCR


GA:
MOV [SI],'A'
MOV [DI],05H
MOV DL,[DI]
ADD GPA,DL
JMP INCR

GB:
MOV [SI],'B'
MOV [DI],04H
MOV DL,[DI]
ADD GPA,DL
JMP INCR

GC:
MOV [SI],'C'
MOV [DI],03H
MOV DL,[DI]
ADD GPA,DL
JMP INCR

GD:
MOV [SI],'D'
MOV [DI],02H
MOV DL,[DI]
ADD GPA,DL
JMP INCR

INCR:
INC BX
INC SI
INC SI
INC DI

LOOP A

MOV AL,GPA
MOV BL,04H
DIV BL
MOV GPA,AL
ret






