/* Problema 4.6: esbn6.s
	Escribir el programa esbn6.s que trata sobre un LED parpadeante con temporizador y sonido
*/
//Instituto tecnológico de Tijuana
//Lenguaje de interfaz
//@Nombre	Ismael Chavez Perez
//@Autor	KoiF1sh    
//@Fecha	12 Dic 2021

	.set GPBASE, 0x20200000
	.set GPFSEL0, 0x00
	.set GPSET0, 0x1c
	.set GPCLR0, 0x28
	.set STBASE, 0x20003000
	.set STCLO, 0x04
.text

	ldr r0, = GPBASE
/* guia bits xx999888777666555444333222111000 */
	mov r1, #0b00000000000000000001000000000000
	str r1, [r0, #GPFSEL0] 				@ Configura GPIO 4
/* guia bits 10987654321098765432109876543210 */
	mov r1, #0b00000000000000000000000000010000
	ldr r2, =STBASE
bucle: bl espera 					@ Salta a rutina de espera
	str r1, [r0, #GPSET0]
	bl espera 					@ Salta a rutina de espera
	str r1, [r0, #GPCLR0]
	b bucle
/* rutina que espera 1136 microsegundos */
espera: ldr r3, [r2, #STCLO] 				@ Lee contador en r3
	ldr r4, =1136
	add r4, r3 					@ r4= r3 + 1136
ret1: ldr r3, [r2, #STCLO]
	cmp r3, r4 					@ Leemos CLO hasta alcanzar
	bne ret1 					@ el valor de r4
	bx lr
