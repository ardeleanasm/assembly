; ----------------------------------------------------------------------------------------
; Compile and link it with:nasm -felf decbin.asm && gcc decbin.o -o decbin
; ----------------------------------------------------------------------------------------
section .data
	in_message	db	"Enter a number in decimal:",0 	;input message
	out_message	db	"The binary number is:",10,0 	;output message
	integer	times 4 db 	0			     	;32bits integer
	formatin	db	"%d",0				;format of printf,scanf
	binary		db	2 				;base
	result times 32 dd	0				;array which will store the remainders
	size	equ	($-result)/4
	
section	.text
	global	main
	extern	printf
	extern	scanf
main:
;;; Ask for integer
	push	in_message					;push in message on stack
	call	printf						;call printf
	add	esp,4						;remove parameters

	push	integer						;address of integer where number will be stored
	push	formatin					;%d parameter, arguments are right to left
	call	scanf						;call to scanf function
	add	esp,8						;remove parameters

	mov	eax,[integer]					;move integer to eax
	mov	ebx,[binary]					;move binary to ebx

	xor	ecx,ecx						;initialize counter register with 0
	jmp	loop						;jump to loop which will calculate the binary number

	jmp	print_array					;jump to print_array which will print the binary number

	mov	al,1						;al=1
	mov	ebx,0						;ebx=0
	int	80h

loop:
	xor	edx,edx						;initialize edx register with 0
	div	ebx						;edx:eax/ebx=eax+edx remainder
	mov	dword[result+4*ecx],edx 			;save remainder to array
	inc	ecx						;increment counter register ecx
	cmp	eax,0						;compare the quotient from eax with 0;
	jnz	loop						;jump to loop if eax is not 0;

print_array:
	push	out_message					;push out_message on stack
	call	printf						;call printf function
	add	esp,4						;esp=esp+4
	mov	ecx,size-1					;move size to ecx,size is the length of the array
	jmp	iterate_array					;jump to iterate array
iterate_array:
	mov	eax,dword[result+4*ecx] 			;move to eax the value from array
	push	ecx						;save ecx on stack
	push	eax						;push eax to stack
	push	formatin					;push %d to stack
	call	printf						;call printf
	add	esp,8						;esp=esp+8
	pop	ecx						;get ecx from stack	
	dec	ecx						;decrement ecx
	cmp	ecx,0						;compare with 0
	jge	iterate_array					;if ecx is greater or equal with 0 then jump to iterate_array

       

       