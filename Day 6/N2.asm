;If condition 
;je lable(anyname to label) : jump if equal : a==b
;jne .. : jump if not equal : a!=b
;jg .. : jump if greater : 
;jge .. : jump if greater or equal: 
;jl .. : jump if less : 
;jle .. : jump if less or equal:


;Write the assembly program to input two single digit numbers and 
;compare which number is greater

.model small
.stack 100h
.data

msg1 db "Enter a number1: $"
msg2 db "Enter a number2: $"
msg3 db "Greater $"

n1 db 0
n2 db 0

.code
start:
mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov ah, 01h
int 21h

mov dl, al
sub dl, 48
mov n1, dl

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h

mov ah, 01h
int 21h

mov dl, al
sub dl, 48
mov n2, dl

mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg3
mov ah, 09h
int 21h

mov bl, n1
cmp bl , n2

jg true

false:
mov dl, n2
add dl, 48
mov ah, 02h
int 21h
jmp Endnn

true:
mov dl, bl
add dl, 48
mov ah, 02h
int 21h

Endnn:
mov ax, 4c00h
int 21h
end start

;Enter the number1: 7
;Enter the number2: 9
;Greater 9
