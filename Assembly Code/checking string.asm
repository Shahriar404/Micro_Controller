
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h
lea si,str1
lea di,str2
lea bx,ans
mov cx,len1 
mov cnt,0h
lv:
   lea si,str1
   mov cx,len1  
lvl:
    mov al,[si]
    mov ah,[di]
    inc si
    cmp al,ah
    je last
    loop lvl
        mov [bx],ah
        inc bx
    last:
        inc di 
        inc cnt
        cmp cnt,len2
        jne lv
ret
str1 db 'programming c'
len1 equ ($-str1)
str2 db 'computer'
len2 equ ($-str2)
ans db 100 dup(0)
cnt db ?


