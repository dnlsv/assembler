 
;a^2/(b+2c)+(8b-a)+ab/(4c-1)

org 100h

.model small
.data
a dw 7
b dw 3
c dw 2
d dw ?
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov ax,a
    imul a  
    mov d,ax
    mov ax,2
    imul c
    add ax,b
    mov bx,ax
    mov ax,d
    idiv bx
    mov d,ax
    mov ax,8
    imul b
    sub ax,a
    add d,ax
    mov ax,a
    imul b
    mov bx,ax
    mov ax,4
    imul c
    sub ax,1
    mov cx,ax
    mov ax,bx
    idiv cx
    add d,ax  
    mov ax,d
int 21h
main endp

ret                                                           