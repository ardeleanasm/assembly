	.data
message:	.asciz	"Enter a number:"
format:		.asciz	"%d"
output:		.asciz	"%d!=%d\n"
number:		.word	0
	.text

factorial:
	push	{r4,lr}			//push	r4 and lr onto the top of the stack <=>sdmdb sp!,{r4,lr}
	
	mov	r4,r0			//make a copy of r0

	cmp	r0,#0			//compare r0 with 0

	bne	not_zero		//branch to not_zero if not equal	
	mov	r0,#1			//r0=1
	b	end
not_zero:
	sub	r0,r0,#1		//r0=r0-1
	bl	factorial		//call recursively factorial
	mov	r1,r4		
	mul	r0,r0,r1		//r0=r0*r1
end:
	pop	{r4,lr}			//pop	<=>	ldmia sp! {r4,lr}
	bx	lr

.global	main
main:
	push	{lr}

	ldr	r0,addr_message		//load in r0 &message1
	bl	printf

	ldr	r0,addr_format		//load in r0 &format
	ldr	r1,addr_number		//load in r1 &addr_number
	bl	scanf
	
	ldr	r0,addr_number		//load the integer read by scanf
	ldr	r0,[r0]
	bl	factorial

	mov	r2,r0			//move result to r2
	ldr	r1,addr_number
	ldr	r1,[r1]			//move initial integer to r1
	ldr	r0,addr_output		//load address of output message in r0
	bl	printf


	pop	{lr}
	bx	lr

addr_message:	.word	message
addr_format:	.word	format
addr_output:	.word	output
addr_number:	.word	number
	.global printf
	.global scanf