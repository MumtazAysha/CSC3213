;write an Assembly program to input three marks,
;calculate the average and,
;print if the student passed(average >= 50)

.model small
.stack 100h

.data
	msg1 db "enter the 1st mark: $"
	n1 db 0
	n2 db 0
	mark1 db 0
	
	msg2 db "enter the 2nd mark: $"
	n3 db 0
	n4 db 0
	mark2 db 0
	
	msg3 db "enter the 3rd mark: $"
	n5 db 0
	n6 db 0
	mark3 db 0
	
	msg4 db "student pass or fail $"
	
	m1 db "Pass $"
	m2 db "Fail $"

	
.code 
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n1,al
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n2,al
	
	mov bl,10
	mov al,n1
	mul bl
	
	mov dl,al
	add dl,n2
	
	mov mark1,dl
	
	mov dl,10	;new line
	mov ah,02h
	int 21h
	
	;enter 2nd mark
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n3,al
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n4,al
	
	mov bl,10
	mov al,n3
	mul bl
	
	mov dl,al
	add dl,n4
	
	mov mark2,dl
	
	mov dl,10	;new line
	mov ah,02h
	int 21h
	
	;enter 3rd mark
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n5,al
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n6,al
	
	mov bl,10
	mov al,n5
	mul bl
	
	mov dl,al
	add dl,n6
	
	mov mark3,dl
	
	mov dl,10	;new line
	mov ah,02h
	int 21h
	
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov dl,10	;new line
	mov ah,02h
	int 21h
	
	;calculate the average 
	mov dl,mark1
	add dl,mark2
	add dl,mark3
	
	mov al,dl
	mov bl,3
	div bl
	
	
	cmp al,50
	jge mg1

	;if part
	mg1:
	mov dx,offset m1 ;print the msg
	mov ah,09h
	int 21h
	jmp endn

	jmp endn
	
	endn:
	
	mov ax,4c00h
	int 21h
end start
