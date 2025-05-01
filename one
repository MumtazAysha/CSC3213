.model small
.stack 100h

.data
	msg db "Enter the number:  $"
	n1 db 0

.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg ; print the msg
	mov ah,09h
	int 21h 
	
	mov ah,01h ;read the input
	int 21h
	mov n1,al
	;read the single input
	
	mov dl,0ah ; this is for next line_0ah
	mov ah,02h
	int 21h
	
	mov dl,n1
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start


	
	
	
