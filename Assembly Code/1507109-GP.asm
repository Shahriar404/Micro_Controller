
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

.DATA
MARK DB 87H
GRADE DW 'F'
GPA DB 00H

.CODE
MOV AL, MARK
CMP AL,80H
JAE GA
CMP AL,70H
JAE GB
CMP AL,60H
JAE GC
CMP AL,50H
JAE GD
JMP EXIT


GA:
MOV GRADE,'A'
MOV GPA,05H
JMP EXIT

GB:
MOV GRADE,'B'
MOV GPA,04H
JMP EXIT

GC:
MOV GRADE,'C'
MOV GPA,03H
JMP EXIT

GD:
MOV GRADE,'D'
MOV GPA,02H
JMP EXIT

EXIT:
ret

