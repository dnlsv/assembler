org 100h

mov dx,offset str1
mov ah,09
int 21h 

Call InputNum
mov a,dx   

mov dx,offset enter
mov ah,09
int 21h    

Call InputNum
mov b,dx 

mov ax,b
sub ax,a
mov iter,ax   

mov dx,offset str2
mov ah,09
int 21h 
  
mov bx,3
mov cx,0 

begin:
mov ax,a   
mov dx,0   
div bx
cmp dx,0
jne label
inc counter
mov ax,a  
Call OutNum  
mov dx,offset enter
mov ah,09
int 21h

label:
mov dx,0  
inc a     
inc cx

cmp cx,iter
jle begin 

mov dx,offset str3
mov ah,09
int 21h   
mov ax,counter
Call OutNum

ret                 
 
str1 dw " Enter range limits: ",10,13,"$"
str2 dw 10,13,"Multiple of 3: ",10,13,"$" 
str3 dw "Number of multiples of 3: $"
a dw ?    
b dw ?    
iter dw ? 
counter dw ?
enter dw 10,13,"$"  

OutNum proc      
    aam
    add ax,3030h
    mov dl,ah
    mov dh,al
    mov ah,02
    int 21h
    mov dl,dh
    int 21h
    ret   
OutNum endp    

InputNum proc      
    mov cx,4
    mov dl,0
    mov dh,dl
    label1:
    mov ah,1
    int 21h
    cmp al,13
    je label4
    cmp al,'-'
    jne label2
    mov dh, 1
    jmp label3
    label2:
    mov bl,al
    sub bl,30h
    mov al,dl
    mov bh,10 
    mul bh
    mov dl,al 
    add dl,bl 
    label3:    
    loop label1  
    label4:
    cmp dh , 1 
    jne label5 
    neg dl  
    label5: 
    ret
InputNum endp
