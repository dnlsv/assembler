org 100h

.model small
.data
str1 db 'It is never wrong to do the right thing'  
len1 = $ - str1
str2 db 'to do'
len2 = $ - str2 
mess1 db 'found',10,13,'$'
mess2 db 'not found',10,13,'$'
 
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    cld 
    mov cx,len1
    mov di,offset str1
    mov al,str2
    cycle:
    mov si,offset str2 
    inc si
    repne scasb 
    jne not_found 
    push di 
    mov bx,cx
    mov cx,len2-1
    repe cmpsb
    je found
    pop di 
    mov cx,bx
    jmp cycle
    found:
    mov ah,09h
    mov dx,offset mess1
    int 21h
    jmp ex
    not_found: 
    mov ah,09h
    mov dx,offset mess2
    int 21h
    ex:
    .exit
main endp
 
ret
