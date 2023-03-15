org 100h

.model small
.data
a dw 1
b dw 2  
c dw 9 
str1 db 'triangle exists',10,13,'$'    
str2 db 'triangle does not exists',10,13,'$' 
counter dw ?

.code
main proc far
    mov ax,@data
    mov ds,ax
    
    mov ax,a
    add ax,b 
    mov bx,c              
            
    cmp ax,bx  
    jbe label  
    inc counter
    label: 
    
    mov ax,a
    add ax,c 
    mov bx,b              
            
    cmp ax,bx  
    jbe label_2  
    inc counter
    label_2:  
    
    mov ax,b
    add ax,c 
    mov bx,a              
            
    cmp ax,bx  
    jbe label_3  
    inc counter
    label_3:    
    
    mov ax,counter
    mov bx,3
    cmp ax,bx
    je label_4 
    mov ah,09h
    mov dx,offset str2
    int 21h
    jmp label_5
    label_4: 
    mov ah,09h
    mov dx,offset str1
    int 21h 
    label_5:

main endp

ret
