org 100h

.model small
.data
; ------------------ -
x1 db 17h; byte
x2 db 18h; byte
x3 dw 19h; word
x4 dw 20h; word
x5 db '*'; byte in ASCII
x6 db '#'; byte in ASCII
x7 db '!'; byte in ASCII
x8 db ? ; byte(not init)
x9 db ? ; byte(not init)
x10 db ? ; byte(not init)
x11 db ? ; byte(not init)
x12 db ? ; byte(not init)
dw ? ; word(not init)
x13 dd 21h; dword
x14 dd 22h; dword
s1 db 'String 1'; bytes in ASCII
s2 db 'String 2'; bytes in ASCII
; dq 23h; qword
; x15 dt 24h; 10 bytes

.code
; ------------------ -
main proc far
    start:
    mov ax, @data
    mov ds, ax
    
    exit:
    mov ax, 4C00h; exit
    int 21h
    ; ------------------ -
    end start
main endp

ret
