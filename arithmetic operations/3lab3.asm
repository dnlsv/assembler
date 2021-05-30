
;8bc-(2a+b)/c

org 100h

.model small
.data
a dw 6
b dw 4
c dw 2
d dw ?
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov ax,8
    imul b
    imul c
    mov d,ax
    mov ax,2
    imul a
    add ax,b
    idiv c
    sub d,ax 
    mov ax,d
int 21h
main endp

ret