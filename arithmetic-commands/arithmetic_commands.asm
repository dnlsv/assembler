org 100h

.model small
.data
a dw ?
b dw ?  
c dw ?  
d dw ?
y dd ?
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov ax,21 
    mov bx, 2
    mul bx
    mov cx,ax
    mov ax,6
    mov bx,4
    mul bx
    sub cx,ax
    mov ax,15
    mov bx,7
    sub ax,bx 
    mov a,cx
    mov b,ax
    mov ax,49
    mov bx,7
    add ax,bx  
    mov c,ax
    mov ax,2
    mov bx,3
    mul bx
    mov bx,4
    mul bx    
    mov d,ax  
    
    mov ax,a
    mul d
    mov a,ax   
    mov ax,b
    mul c
    mov c,ax
    mov ax,a
    sub ax,c
    neg ax
    mov a,ax
    mov ax,b
    mul d
    mov b,ax
    mov ax,a
    div b
 
int 21h
main endp

ret
