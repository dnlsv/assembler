;(a-b)/4c+3abc

org 100h

.model small
.data
a dw 8
b dw 4
c dw 1
d dw ?
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov ax,a
    sub ax,b
    mov d,ax
    mov ax,4
    imul c
    mov bx,ax
    mov ax,d
    idiv bx
    mov d,ax
    mov ax,3
    imul a
    imul b
    imul c
    add d,ax  
    mov ax,d
int 21h
main endp

ret
