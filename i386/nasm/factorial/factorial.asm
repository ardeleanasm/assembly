; ----------------------------------------------------------------------------------------
; Compile and link it with:nasm -felf factorial.asm && gcc factorial.o -o factorial
; ----------------------------------------------------------------------------------------
section .data
	in_message	db	"Enter the number:",0 		;input message
	out_message	db	"%d!=%d",10,0 	;out message
	integer	times 4 db 	0			     	;32bits integer
	format_in_out	db	"%d",0				;format of printf,scanf
	
	
	
	
section	.text
	global	main
	extern	printf
	extern	scanf
main:
	push	in_message					;push in message on stack
	call	printf						;call printf
	add	esp,4						;remove parameters

	push	integer						;address of integer where number will be stored
	push	format_in_out					;%d parameter, arguments are right to left
	call	scanf						;call to scanf function
	add	esp,8						;remove parameters

	mov	ebx,[integer]					;save integer in ebx
	mov	ecx,1						;set counter to 1
	mov	eax,1						;eax will hold the result

	jmp	factorial					;jump to factorial

	mov	al,1						;al=1
	mov	ebx,0						;ebx=0
	int	80h
factorial:	
	mul	ecx						;eax=eax*ecx
	inc	ecx						;ecx++
	cmp	ecx,ebx						;if ecx<=ebx then continue
	jle	factorial					;
	push	eax						;push eax on stack(result)
	push	ebx						;push ebx on stack(number)
	push	out_message					;push out message on stack
	call	printf						;call printf
	add	esp,12

