
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data
str1 db 27 dup('1'),10,13,'$'     
str2 db 62 dup('&'),10,13,'$' 
str3 db 'ford focus best car',10,13,'$' 
str4_1 db '12353hfjvhfyvvifocusvbvjblioimo',10,13,'$' 
str4 db '12353hfjvhfyvvifocusvbvjblioimo'
len1 = $ - str4
str5_1 db 'focus',10,13,'$'  
str5 db 'focus'         
len2 = $ - str5
counter dw 0
symbol db '&',10,13,'$' 
mess1 db 'substring found',10,13,'$'
mess2 db 'substring not found',10,13,'$'  
space db 10,13,'$'   
                                    
.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax

;copy to string
cld
mov cx,11
mov si,offset str1[7]
mov di,offset str2[3]
rep movsb
mov ah,09h
mov dx,offset str1
int 21h
mov dx,offset str2
int 21h       
 
;----------------------- 
mov dx, offset space
int 21h 
;----------------------- 
 
;search symbol in string 
mov dx,offset str3
int 21h
mov ah,01h
int 21h                            
mov symbol[0],al
mov ah,02h
mov dx,10
int 21h
mov dx,13
int 21h 
xor si,si 
begin_cycle:
cmp str3[si],'$'
je end_cycle
mov al,str3[si]
cmp al,symbol[0]
jne not_match
inc counter
not_match:
inc si   
jmp begin_cycle
end_cycle:
mov ax,counter 
add al,'0'
mov symbol[0],al
mov ah,09h
mov dx,offset symbol
int 21h    

;----------------------- 
mov dx, offset space
int 21h 
;-----------------------
 
;search substring in string
mov dx,offset str4_1
int 21h             
mov dx,offset str5_1
int 21h
cld 
mov cx,len1
mov di,offset str4
mov al,str5
cycle:
mov si,offset str5 
inc si
repne scasb 
jne not_found 
push di 
mov bx,cx
mov cx,len2-1
repe cmpsb
je found
pop di 
mov cx,bx
jmp cycle
found:
mov dx,offset mess1
int 21h
jmp escape
not_found: 
mov dx,offset mess2
int 21h
escape:
.exit
main endp

ret




