.model small
.stack 100h
.data

	msg db "enter the numbers : $"
	
	t db 0 ;ten's
	o db 0 ;one's
	dig db 0
	r db 0
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	;read first digit
	mov ah,01h ;al+2=48+2=50
	int 21h
	mov dl,al ;dl=50
	sub al,48
	mov t,al	;d1=2
	
	
	
	;read 2nd digit
	mov ah,01h
	int 21h
	mov dl,al
	sub al,48
	mov o,al	;d2=3
    
	;Combine
	mov bl,10	;bl-temp storing value register
	mov al,t	;al=2
	mul bl	;bl=al*bl=2*10=20
	
	mov dl,al
	add dl,o	;dl=dl+o=20+3=23
	
	mov dig,dl	;digit=23
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov ah,00	;ah=0
	mov bl,10	;bl=10
	mov al,dig	;al=23
	div bl 		;al=al/bl=23/10=2
	mov r,ah
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,r
	add dl,48
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start
	
	
	
