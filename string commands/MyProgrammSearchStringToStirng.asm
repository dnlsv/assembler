
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data
str4 db 'dfgdfvdfgdfgfddfgdfocusdfgfhfdbdfbdf'  
len1 = $ - str4
str5 db 'fvdfgdfgfddfgdfocussdfgfhfdbdfbd'
len2 = $ - str5 
mess1 db 'found',10,13,'$'
mess2 db 'notfound',10,13,'$'
 
.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax

cld 
mov cx,len1
mov di,offset str4
mov al,str5
cycle:
mov si,offset str5 
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




