
org 100h

MOV AL,'5'
MOV BL,'9'
AND AL,0FH
AND BL,0FH
MOV CL,04H
ROL AL,CL
OR AL,BL
RET

ret




