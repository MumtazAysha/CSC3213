.model small
.stack 100h

.data
msg1 db "Enter the first number: $"
n1 db 0
n2 db 0
msg2 db "The printed number is: $"
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

mov ah,01h
int 21h
mov dl,al
sub dl,48
mov n2,dl

mov dl,10
mov ah,02h 
int 21h

mov dx,offset msg2
mov ah,09h
int 21h

mov al,n1
mov bl,10
mul bl 
mov dl,al
add dl,n2
mov ah,00
mov al,dl
mov bl,10
div bl
mov r,ah

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,r
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start
