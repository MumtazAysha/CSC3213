.model small
.stack 100h

.data
msg1 db "Enter the first number: $"
n1 db 0
msg2 db "Enter the second number: $"
n2 db 0
msg3 db "The Addition is:$"
msg4 db "The Subtraction is:$"
msg5 db "The Multiplication is:$"
msg6 db "The Division is:$"
msg7 db "The Division remainder is:$"
r db ?
.code
start:

mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

mov ah,01h
int 21h
mov dl,al
sub dl,48
mov n1,dl

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg2
mov ah,09h
int 21h

mov ah,01h
int 21h
mov dl,al
sub dl,48
mov n2,dl

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg3
mov ah,09h
int 21h

mov dl,n1
add dl,n2
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg4
mov ah,09h
int 21h

mov dl,n1
sub dl,n2
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg5
mov ah,09h
int 21h

mov al,n1
mul n2
mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg6
mov ah,09h
int 21h

mov ah,00
mov al,n1
div n2
mov r,ah  

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset msg7
mov ah,09h
int 21h

mov dl,r
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start
