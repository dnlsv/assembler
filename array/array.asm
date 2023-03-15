org 100h

mov dx, offset str1
mov ah,09
int 21h
Call Input 
mov n,bx

mov si,0 
mov cx,0

mov dx, offset str2
mov ah,09
int 21h

begin:
cmp cx,n
je exit

Call Input
mov mass[si],bx
add si,2
inc cx
jmp begin
exit:

mov dx, offset str3
mov ah,09
int 21h

mov si,0
mov di,0
Call IFB0 

mov si,0
mov di,0
Call IFR0

mov si,0
mov di,0
Call IFM0 

Call OutMass 

mov dx, offset str4
mov ah,09
int 21h

lea si,mass
lea di,newMass
Call IFB0 

lea si,mass
lea di,newMass
Call IFR0

lea si,mass
lea di,newMass
Call IFM0

Call OutMass

ret  

n dw ?
mass dw n dup(?)  
newMass dw n dup(?)
str1 db "Enter n = $"
str2 db 10,13,"Enter array elements: $"   
str3 db 10,13,"Direct addressing with indexing $"     
str4 db 10,13,"Indirect addressing $"    
str5 db 10,13,"New array: $" 

IFB0 PROC  
        
    mov cx,0

b2:
    cmp cx,n
    je ex2

    cmp mass[si],0
    jbe lb2
    mov ax,mass[si]
    mov newMass[di],ax 
    add si, 2  
    add di, 2  
    inc cx
lb2:

    jmp b2
ex2: 
    ret
    
IFB0 ENDP 

IFR0 PROC 
    
    mov cx,0

b3:
    cmp cx,n
    je ex3

    cmp mass[si],0
    jae lb3
    mov ax,mass[si]
    mov ds:newMass[di],ax
    add si, 2  
    add di, 2
    inc cx
lb3:

    jmp b3
ex3:    
    
IFR0 ENDP

IFM0 PROC
    
    mov cx,0

b4:
    cmp cx,n
    je ex4

    cmp mass[si],0
    jne lb4
    mov ax,mass[si]
    mov newMass[di],ax 
    add si, 2  
    add di, 2
    inc cx
lb4:

    jmp b4
ex4:

IFM0 ENDP

Input PROC

    push ax
    push cx
    push dx
    mov bx,0000
    mov cx,0000
    mov dx,1
    mov ah,01
l1:
    mov ah,01
    int 21h
    cmp al,0DH
    je l2
    cmp al,'-'
    je l3
    sub al,30h    
l3:
    mov ah,0
    push ax
    inc cx
    jmp l1
l2:
    pop ax
    cmp al,'-'
    jne l4
    neg bx
    jmp l5
l4:
    mul dl
    add bx,ax
    mov ax,dx
    mov dx,000AH
    mul dl
    mov dx,ax
    loop l2
l5:
    pop dx
    pop cx   
    pop ax
    ret 

Input ENDP 

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

OutMass proc

    mov dx, offset str5
    mov ah,09
    int 21h
           
begin2:
    cmp cx,n
    je exit

    mov ax,mass[si]
    Call OutNum
    add si,2
    inc cx
    jmp begin
exit2:
    ret       
    
OutMass endp
