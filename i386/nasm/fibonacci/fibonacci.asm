%macro _input 2				;macro for input %1=format,%destination
	push	%2			;push destination
	push	%1			;push format
	call	scanf			;call scanf
	add	esp,8
%endmacro
%macro _output 2			;macro for output
	push	%2			;push destination
	push	%1			;push format
	call	printf			;call printf
	add	esp,8
%endmacro
	
section	.text
	global	main	
	extern printf
	extern scanf
main:
	push	in_message		;push message
	call	printf			;call printf
	add	esp,4
	_input	format_in,no	 	;call macro for input
	call fibonacci			;call fibonacci procedure
	mov	al,1			;al=1
	mov	ebx,0			;ebx=0
	int	80h			;int 80h
fibonacci:
	xor	ecx,ecx			;ecx register=0
	xor	eax,eax			;eax register=0
start_calculate:			;
	cmp	ecx,1			;if ecx<=1
	jle	less			;jump to less
	mov	eax,[second]		;eax=second number
	add	eax,[first]		;second=secon+first number
	mov	[next],eax		;next=eax
	
	mov	eax,[second]		;eax=second number	
	mov	[first],eax		;first=second

	mov	eax,[next]		;eax=next number
	mov	[second],eax		;second=next
	jmp	print_number		;jump to print number
less:
	mov	[second],ecx		;second=ecx
	mov	[next],ecx		;next=ecx
	jmp	print_number		;jump to print number
print_number:
	inc	ecx			;ecx++
	push	ecx			;save ecx on stack
	mov	eax,[next]		;eax=next number
	_output	format_out,eax		;print next number
	pop	ecx			;get ecx from stack
	cmp	ecx,[no]		;compare ecx with integer(number of terms)
	jl	start_calculate		;if is less than integer, then jump to start_calculate
	ret				;return
section	.data
	in_message	db	"Enter the number of terms:",0 ;input message
	no	times 4	db	0			       ;number of terms
	first	times 4	db	0			       ;first term
	second	times 4	db	0			       ;second term
	next	times 4 db	0			       ;next term that will be print
	format_in	db	"%d",0			       ;input format for scanf
	format_out	db	"%d",10			       ;output format for printf





