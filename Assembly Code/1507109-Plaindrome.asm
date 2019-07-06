
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
ST1 DB 'MADAM'
LN EQU ($-ST1)
ST2 DB '00000'
VAR DB 00H

.CODE
LEA SI,ST1
LEA DI,ST2

MOV CX,LN
I:
INC SI
LOOP I


MOV CX,LN
DEC SI
L:
MOV AX,[SI]
MOV [DI],AX
DEC SI
INC DI
LOOP L

LEA SI,ST1
LEA DI,ST2
MOV CX,LN

CLD
REPE CMPSB
JNE NE
MOV VAR,'Y'
JMP E
NE:
MOV VAR,'N'

E:
ret




