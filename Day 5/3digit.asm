.model small
.stack 100h

.data 
	msg db "enter the numbers : $"
	h db 0  ;2
	t db 0	;3
	o db 0	;5
	dig2 db 0	;35
	fdig db 0	;235
	r1 db 0
	r2 db 0

.code	
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	;first digit hundred's
	mov ah,01h
	int 21h
	mov dl,al
	sub dl,48
	mov h,dl ;h=2
	
	;2nd didgit ten's
	mov ah,01h
	int 21h
	mov dl,al
	sub dl,48
	mov t,dl ;t=3
	
	;3rd digit one'small
	mov ah,01h
	int 21h
	mov dl,al
	sub dl,48
	mov o,dl ;o=5
	
	
	mov bl,100 
	mov al,h ;al=2
	mul bl   ;bl=bl*al=100*2=200
	mov dl,al

	
	mov dig2,dl
	
	mov bl,10
	mov al,t ;al=3
	mul bl	;bl=bl*al=10*3=30
	
	mov dl,al ;dl=30
	add dl,dig2 ;dl=dl+dig2=30+200=230
	add dl,o   ;dl=dl+o=230+5=235
	
	mov fdig,dl ;fdigit=235
	
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
	
	mov ah,00 ;ah=0
	mov bl,100 ;bl=100
	mov al,fdig ;al=235
	div bl	;al=al/bl=235/100=2
	mov r1,ah  ;r1=35
	
	mov dl,al ;dl=2
	add dl,48 ;dl=dl+48=2+48=50 
	mov ah,02h
	int 21h
	
	 
	
	mov ah,00 ;ah=0
	mov dl,al
	mov bl,10 ;bl=10
	mov al,r1  ;al=35
	div bl    ;al=al/bl=35/10=3
	mov r2,ah  ;r2=5
	
	mov dl,al ;dl=3
	add dl,48	;dl=dl+48=3+48=51
	mov ah,02h 
	int 21h
	
	mov dl,r2
	add dl,48
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start
	
	
	
	
	
	
