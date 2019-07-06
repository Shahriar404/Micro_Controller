
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

.DATA
ST DB 'Enter the Score team obtained batting first: $'
DF DB 'My Prediction: DEFEAT$'
DV DB 'My Prediction: VICTORY$'
RUN DW ?
A DW ?
B DW ?
C DW ?

.CODE
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,ST
    MOV AH,09H
    INT 21H 
        
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV AH,00H
    MOV A,AX
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV AH,00H
    MOV B,AX
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV AH,00H
    MOV C,AX 
    
MOV AX,A
MOV BX,100D
MUL BX
MOV RUN,AX
MOV AX,B
MOV BX,10D
MUL BX
MOV BX,RUN
ADD AX,BX
MOV BX,C
ADD AX,BX
MOV RUN,AX

CMP AX,341D
JAE GA
CMP AX,300D
JAE GA
CMP AX,250D
JAE GB
CMP AX,200D
JAE GA
JMP GB

GA:
    MOV AH, 02H
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
MOV AX,@DATA
MOV DS,AX
LEA DX,DV
MOV AH,09H
INT 21H
JMP EXIT

GB:
    MOV AH, 02H
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
MOV AX,@DATA
MOV DS,AX 
LEA DX,DF
MOV AH,09H
INT 21H
JMP EXIT

EXIT:
ret

