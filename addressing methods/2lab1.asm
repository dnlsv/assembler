;nothing is eternal

org 100h

.model small
.data
bufer db 'abcdefghijklmnopqrstuvwxyz ',10,13,'$'
str db '???????????????'
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov ah,09h ;output bufer
    mov dx,offset bufer
    int 21h
    mov bl,bufer[13] ;write letter 'n' in the str
    mov str[0],bl
    mov str[5],bl
    mov str[15],bl 
    mov bl,bufer[14] ;letter 'o'
    mov str[1],bl
    mov bl,bufer[19] ;letter 't'
    mov str[2],bl
    mov str[12],bl
    mov bl,bufer[7] ;letter 'h'
    mov str[3],bl
    mov bl,bufer[8] ;letter 'i'
    mov str[4],bl
    mov str[8],bl
    mov bl,bufer[6] ;letter 'g'
    mov str[6],bl     
    mov bl,bufer[26] ;simbol ' '
    mov str[7],bl
    mov str[10],bl
    mov bl,bufer[18] ;letter 's'
    mov str[9],bl
    mov bl,bufer[4] ;letter 'e'
    mov str[11],bl
    mov str[13],bl
    mov bl,bufer[17] ;letter 'r'
    mov str[14],bl
    mov bl,bufer[0] ;letter 'a'
    mov str[16],bl
    mov bl,bufer[11] ;letter 'l'
    mov str[17],bl
    mov bl,bufer[27] ;carriage return to a new line
    mov str[18],bl
    mov bl,bufer[28] ;carriage return to a beginning of line
    mov str[19],bl
    mov bl,bufer[29] ;symbol '?', end of str
    mov str[20],bl
    mov ah,09h ;output string
    mov dx, offset str
    int 21h
main endp

ret