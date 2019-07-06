
org 100h


.data

    str1 db 'programming'
    len1 equ ($-str1)
    str2 db 'computer'
    len2 equ ($-str2)
    res db len1 dup(?) 


.code
    mov ax,@data
    mov ds,ax
    
    lea si,str1
    lea di,str2
    lea bp,res
    
    mov cx,len2
   


while:

    lea si,str1
    mov  al,[di]
    mov bl,len1


    for:
    
        cmp al,[si]
        je border
        inc si
        dec bl
        cmp bl,0h
        jne for 
        
        mov [bp],ax
        inc bp

border:
    inc di
    loop while




ret




