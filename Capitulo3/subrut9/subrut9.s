.text
.global ordena, main, vect
.arch armv6

ordena:
	sub	r2, r1, #1
	sub	r3, r1, r2
	cmp	r1, r3
	bxle	lr
	push	{r4, lr}
.L5:
	mov	r3, r0
	mov	ip, #0
.L4:
	ldr	lr, [r3]
	ldr	r4, [r3, #4]!
	add	ip, ip, #1
	cmp	lr, r4
	stmdagt	r3, {r4, lr}
	cmp	ip, r2
	blt	.L4
	sub	r2, r2, #1
	sub	r3, r1, r2
	cmp	r1, r3
	bgt	.L5
	pop	{r4, pc}

main:
	push	{r4, r5, r6, lr}
	mov	r1, #8
	ldr	r0, .L17
	bl	ordena
	ldr	r5, .L17
	ldr	r6, .L17+4
	mov	r4, #0
.L13:
	ldr	r1, [r5], #4
	mov	r0, r6
	add	r4, r4, #1
	bl	printf
	cmp	r4, #8
	bne	.L13
	pop	{r4, r5, r6, pc}
	
.L17:
	.word	.LANCHOR0
	.word	.LC0
vect:
	.word	8
	.word	10
	.word	-3
	.word	4
	.word	-5
	.word	50
	.word	2
	.word	3
.LC0:
	.ascii  "%d\012\000"
