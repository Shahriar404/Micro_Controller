
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
ST1 DB 'MANON'
LN EQU ($-ST1)
ST2 DB 'NOMAN'
LN2 EQU ($-ST2)
VAR DB 00H


.CODE
MOV AL,LN
MOV AH,LN2
CMP AL,AH
JNE NE

MOV BH,0H
MOV CX,LN
L:
    MOV DX,CX
    CALL SRT
L1:
    mov cx,DX
    loop L
    jmp EX
    
    SRT PROC NEAR
        
        LEA SI,ST1
        LEA DI,ST1
        INC DI
        MOV CX,LN
        DEC CX
        L2:
        MOV AH,[SI]
        MOV AL,[DI]
        CMP AH,AL
        JG LL
        L3:
        INC SI
        INC DI
        LOOP L2 
        
        JMP L1
        
        SRT ENDP
        LL:
            MOV [SI],AL
            MOV [DI],AH
            JMP L3
            
            
EX:            
MOV BH,0H
MOV CX,LN2
K:
    MOV DX,CX
    CALL SRT2
K2:
    MOV CX,DX
    LOOP K
    JMP EE
    
    SRT2 PROC NEAR
        
        LEA SI,ST2
        LEA DI,ST2
        INC DI
        MOV CX,LN2
        DEC CX
        K3:
        MOV AH,[SI]
        MOV AL,[DI]
        CMP AH,AL
        JG K0
        K4:
        INC SI
        INC DI
        LOOP K3 
        
        JMP K2
        
        SRT2 ENDP
        K0:
            MOV [SI],AL
            MOV [DI],AH
            JMP K4    


EE:

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






