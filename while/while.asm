org 100h

xor dx,dx
mov cx,size
lea bx, number
label:
mov ax,[bx+di]
inc di
add dl,al
sub dl,48

cmp cx,8
jne label2
mov firstNum,dl
label2: 

mov ah,0
sub ax,48
mov temp,2
div temp
cmp ah,0
jne label3
inc counter
label3:

loop label 

mov t,dx
 
mov dx, offset strNumber
Call OutStr    
 
mov dx, offset strSum
Call OutStr

mov ax,t
Call OutNum

mov dx, offset strFirst
Call OutStr

mov dl,firstNum
Call OutOneNum

mov dx, offset strEven
Call OutStr

mov dl,counter
Call OutOneNum 

ret         
      
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

OutOneNum proc  
         
    add dl,30h
    mov ah,02h
    int 21h
    ret       
    
OutOneNum endp    

OutStr proc  
         
    mov ah,09
    int 21h
    ret       
    
OutStr endp 
      
number db "47970355"  
size = $- offset number 
strNumber db "Number: 47970355$"   
firstNum db ?
temp db ?     
space db " $"  
counter db ?
strSum db 10,13,"Sum of digits = $"
strFirst db 10,13,"First digit = $"  
strEven db 10,13,"Number of even digits = $"  
t dw ?
 