org 100h
    
;y = x^2 + (x + 7) + 9  
;72 58 46 36 28 22 18

mov dx, offset strFor
mov ah,09
int 21h
    
mov cx,n  
for:

Call Function
  
dec cx
cmp cx,0
jne for

Call OutSum  

mov dx, offset strLoop
mov ah,09
int 21h

mov sum,0
mov cx,n
m:

Call Function

Loop m

Call OutSum

ret    

Function proc
        
    mov dx, offset str1
    mov ah,09
    int 21h
    mov ax,cx
    Call OutNum
    mov dx, offset space
    mov ah,09
    int 21h 

    mov ax,cx
    mul ax
    mov bx,cx
    add bx,7
    add bx,9
    add ax,bx 
    mov y,ax
    add sum,ax

    mov dx, offset str2
    mov ah,09
    int 21h
    mov ax,y
    Call OutNum
    ret   
        
Function endp  

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

OutBigNum proc

    xor cx, cx
    mov bx, 10
    label1:
    xor dx,dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz label1
    mov ah, 02h
    label2:
    pop dx
    add dl, '0'
    int 21h
    loop label2
    ret

OutBigNum endp 

OutSum proc
    
    mov dx, offset strSum
    mov ah,09
    int 21h
    mov ax,sum
    Call OutBigNum
    ret  
    
OutSum endp 
    
n dw 7
y dw ?
str1 db 10,13,"x = $"
str2 db "y = $" 
space db " $" 
;enter db 10,13,"$"   
strFor db "For$",10,13
strLoop db 10,13,"Loop$",10,13   
sum dw 0 
strSum  db 10,13,"Sum = $",10,13 