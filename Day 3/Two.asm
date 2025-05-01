.model small
.stack 100h

.data
	msg1 db "Enter the number01:  $"
	msg2 db "Enter the number02:  $"
	msg3 db "Total of number01 and number02:  $"
	n1 db 0
	n2 db 0

.code
start:
	mov ax,@data
	mov ds,ax
	
	;print 1st user input
	mov dx,offset msg1
	mov ah,09h
	int 21h 
	
	mov ah,01h ;al=3
	int 21h
	
	mov dl,al ;dl=48+3=51
	sub dl,48 ;dl=3
	
	mov n1,dl  
	
	mov dl,0ah 
	mov ah,02h
	int 21h
	
	;print second user input
	mov dx,offset msg2 
	mov ah,09h
	int 21h 
	
	mov ah,01h 
	int 21h
	
	mov dl,al ;dl=48+3=51
	sub dl,48 ;dl=3
	
	mov n2,dl  
	
	mov dl,0ah 
	mov ah,02h
	int 21h
	
	;print Total
	mov dx,offset msg3
	mov ah,09h 
	int 21h
	
	mov dl,n1 
	add dl,n2 
	add dl,48 
	mov ah,02h      
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start
