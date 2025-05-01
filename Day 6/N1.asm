;If condition 
;je lable(anyname to label) : jump if equal : a==b
;jne .. : jump if not equal : a!=b
;jg .. : jump if greater : 
;jge .. : jump if greater or equal: 
;jl .. : jump if less : 
;jle .. : jump if less or equal:


;Write the assembly program to input a single digit number and 
;check if it is even or odd

.model small
.stack 100h
.data

msg db "Enter a number: $"
msg1 db "Even",10,"$"
msg2 db "Odd",10,"$"

.code
start:
mov ax, @data
mov ds, ax

mov dx, offset msg
mov ah, 09h
int 21h

mov ah, 01h
int 21h

mov ah, 00
mov bl, 2
div bl

cmp ah, 1
je odd
jne even1

odd:
mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h
jmp Endnn

even1:
mov dl, 10
mov ah, 02h
int 21h

mov dx, offset msg1
mov ah, 09h
int 21h

Endnn:
mov ax, 4c00h
int 21h
end start

;Enter a number:8
;Even

;Enter a number:5
;Odd
