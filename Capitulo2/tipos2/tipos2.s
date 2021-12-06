/* Problema tipos2.s
	Traducir el programa de la estructura del if de C a ensamblador del libro de practicas
*/

//@Autor    KoiF1sh    
//@Fecha    6 Dic 2021

.text
.global main
main:
	push    {r4, lr}
	ldr     r0, .L3
	bl      puts
	mov     r0, #0
	pop     {r4, pc}
.L3:
	.word   .LC0
.LC0:
	.ascii  "Se cumple\000"
