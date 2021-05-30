
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
org 100h
.data
string db 10,13,'the best day came yesterday$'
.code
main proc far
variable dw ?
variable_segment dw ?
mov variable,output_symbol
mov variable_segment, seg output_symbol
mov al,'d'
call far variable
mov al,' '
call far variable
mov al,'t'
call far variable
mov al,10
call far variable
mov al,13
call far variable
number1 db 1
number2 db 3
call output_number
push offset string
mov variable,output_string
mov variable_segment, seg output_string
call far variable
.exit
main endp

output_symbol proc far
xor dx,dx
mov dl,al
mov ah,02h
int 21h
ret
output_symbol endp

output_number proc near
mov dl,number1
add dl,'0'
mov ah,02h
int 21h
mov dl,number2
add dl,'0'
mov ah,02h
int 21h
ret
output_number endp 

output_string proc far
push bp
mov bp,sp
mov dx,[bp+6]
mov ah,09h
int 21h
mov sp,bp
pop bp
ret
output_string endp




