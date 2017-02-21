/*
if(n%2==0)
   n=n/2;
else
   n=3n+1;
*/

	.data
message:	.asciz	"Number:"
format:	.asciz	"%d"
output:		.asciz 	"Length of the Hailstone sequence for %d is %d\n"
number:		.word	0
	.text
collatz:
	mov	r1,r0			//r1=r0
	mov	r0,#0			//r0=0
loop:
	cmp	r1,#1
	beq	end
	and	r2,r1,#1
	cmp	r2,#0
	moveq	r1,r1,ASR #1 		//if equal, r1=r1>>1<=>r1=r1/2
	addne	r1,r1,r1,LSL #1		//if not equal r1=r1+(r1<<1)<=>r1=r1+2r1
	addne	r1,r1,#1
end_loop:
	add	r0,r0,#1
	b	loop
end:	
	bx	lr
	
	.global main
main:
	push	{lr}			//save lr on stack

	ldr	r0,addr_message		//load first param of printf
	bl	printf

	ldr	r0,addr_format		//load	format
	ldr	r1,addr_number		//load address of number
	bl	scanf

	ldr	r0,addr_number		//load address of number
	ldr	r0,[r0]			//load in r0, the value
	bl	collatz			//call collatz

	mov	r2,r0			//move value to r2
	ldr	r1,addr_number	
	ldr	r1,[r1]
	ldr	r0,addr_output
	bl	printf

	pop	{lr}
	bx	lr
addr_message:		.word	message
addr_format:		.word	format
addr_number:		.word	number
addr_output:		.word	output