org 100h

.model small
.data
y db ?
y1 db ?  
y2 db ?
x db ? 
a db ?  

str1 db 'Input x',13,10,'$'
str2 db 13,10,'Input a',13,10,'$'  
str3 db 13,10,'y = ','$'

.code
main proc far
    mov ax,@data
    mov ds,ax
      
    mov dx,offset str1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov x,al  
    
    mov dx,offset str2
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov a,al
        
    mov al,2  
    cmp x,al
    jae label
    mov y1,8
    jmp label2
    label:
    mov bl,x
    sub bl,2
    mov y1,bl
    label2:
    
    mov al,0
    cmp x,al
    je label3:
    mov bl,a
    sub bl,x
    mov y2,bl 
    jmp label4
    label3:
    mov y2,4
    label4:
        
    mov dx,offset str3
    mov ah,09h
    int 21h  
    
    mov al,y1
    sub al,y2  
     
    mov dl,al
    add dl,30h
    mov ah,02h
    int 21h    

main endp

ret
