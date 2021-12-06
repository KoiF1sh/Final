 /* Problema tipos1.s
	Realizar la traduccion del programa en c a ensamblador de la estructura del for y while del libro de practicas
*/

//@Autor    KoiF1sh    
//@Fecha    6 Dic 2021

.text
.global main
main:
	push    {r4, r5, r6, lr}
	mov     r4, #6
	ldr     r5, .L7
.L2:
	mov     r0, r5
	bl      printf
	subs    r4, r4, #1
	bne     .L2
	ldr     r5, .L7+4
	mov     r4, #6
.L3:
	mov     r0, r5
	bl      printf
	subs    r4, r4, #1
	bne     .L3
	mov     r0, r4
	pop     {r4, r5, r6, pc}
.L7:
	.word   .LC0
	.word   .LC1
.LC0:
	.ascii  "for \000"
.LC1:
	.ascii  "while \000"
