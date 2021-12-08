/* Problema 3.4: subrut1.s
	Escribir la traduccion del programa del Código del programa subrut1 en s
*/

//@Autor    KoiF1sh    
//@Fecha    9 Dic 2021

.text
.global	myrand, mysrand
.arch	armv6

myrand:
	ldr	r2, .L2
	ldr	r3, .L2+4
	ldr	r0, [r2]
	mul	r3, r3, r0
	ldr	r0, .L2+8
	add	r3, r3, #12288
	add	r3, r3, #57
	str	r3, [r2]
	and	r0, r0, r3, asr #16
	bx	lr
.L2:
	.word	.LANCHOR0
	.word	1103515245
	.word	32767
	
mysrand:
	ldr	r3, .L5
	str	r0, [r3]
	bx	lr
.L6:
	.align  2
.L5:
	.word   .LANCHOR0
	.size   mysrand, .-mysrand
	.section        .text.startup,"ax",%progbits
	.align  2
	.global main
	.syntax unified
	.arm
	.fpu vfp
	.type   main, %function
main:
	push	{r4, r5, r6, lr}
	mov	r4, #5
	ldr	r3, .L12
	ldr	r5, .L12+4
	mov	r2, #42
	str	r2, [r3]
.L8:
	bl	myrand
	mov	r1, r0
	mov	r0, r5
	bl	printf
	subs	r4, r4, #1
	bne	.L8
	pop	{r4, r5, r6, pc}
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LC0
	.size	main, .-main
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	seed, %object
	.size	seed, 4
seed:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	" %d\012 \000"
