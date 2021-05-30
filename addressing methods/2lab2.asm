
org 100h

.model small
.data
arr db 8,0,3,4,0,6,0,3,2
message db 'zeros in an array:',10,13,'$'
buf db '? $'
n dw 9  
;num dw ?
.code
main proc far
        mov ax,@data
        mov ds,ax
        mov ah,09h ;output message
        mov dx,offset message
        int 21h
    mov si,0  
    ;mov num,0
    begin:
    xor ax,ax
    mov al,arr[si]
    cmp al,0
    jne odd
    mov al,arr[si]
    add al,'0'
    mov buf,al
    mov ah,09h ;output buf
    mov dx,offset buf
    int 21h     
    ;add num,1
    odd:
    inc si
    cmp si,n
    jb begin 
main endp

ret