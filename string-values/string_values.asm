org 100h     

mov dx, offset str1
Call OutStr

xor dx,dx
mov cx,512
lea bx,text
label:
mov ax,[bx+di]
inc di
add dl,al
sub dl,48

cmp cx,8
jne label2
label2: 

mov ah,0
sub ax,48
mov temp,2
div temp
cmp ah,0
jne label3
inc counter
mov dx, offset str2
Call OutStr
mov dx, offset str3
Call OutStr  
mov ax,counter
Call OutNum
label3:

loop label 

ret  

OutStr proc       
    mov ah,09
    int 21h
    ret       
OutStr endp 

InputStr proc  
    mov cx,4
    mov dl,0
    mov dh,dl
    l1:
    mov ah,1
    int 21h
    cmp al,13
    je l4
    cmp al,'-'
    jne l2
    mov dh, 1
    jmp l3
    l2:
    mov bl,al
    sub bl,30h
    mov al,dl
    mov bh,10 
    mul bh
    mov dl,al 
    add dl,bl 
    l3:    
    loop l1  
    l4:
    cmp dh , 1 
    jne l5 
    neg dl  
    l5: 
    ret
InputStr endp 

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

text db 512 dup (0)  
temp db ? 
counter dw ?
str1 dw " Enter original text: ",10,13,"$"     
str2 dw " Word: ",10,13,"$"
str3 dw " Number of letters: ",10,13,"$"
