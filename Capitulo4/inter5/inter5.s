/* Problema 5.6: inter5.s
	Escribir el programa inter5.s que trata sobre el Manejo de FIQs y sonidos distintos para cada LED
*/
//Instituto tecnológico de Tijuana
//Lenguaje de interfaz
//@Nombre	Ismael Chavez Perez
//@Autor	KoiF1sh    
//@Fecha	12 Dic 2021

	.include "inter.inc"
.text
/* Agrego vectores de interrupción */
	ADDEXC 0x18, irq_handler
	ADDEXC 0x1c, fiq_handler
	
/* Inicializo la pila en modos FIQ, IRQ y SVC */
	mov r0, #0b11010001 					@ Modo FIQ, FIQ & IRQ desact
	msr cpsr_c, r0
	mov sp, #0x4000
	mov r0, #0b11010010 					@ Modo IRQ, FIQ & IRQ desact
	msr cpsr_c, r0
	mov sp, #0x8000
	mov r0, #0b11010011 					@ Modo SVC, FIQ & IRQ desact
	msr cpsr_c, r0
	mov sp, #0x8000000

/* Configuro GPIOs 4, 9, 10, 11, 17, 22 y 27 como salida */
	ldr r0, =GPBASE
	ldr r1, =0b00001000000000000001000000000000
	str r1, [r0, #GPFSEL0]
/* guia bits xx999888777666555444333222111000 */
	ldr r1, =0b00000000001000000000000000001001
	str r1, [r0, #GPFSEL1]
	ldr r1, =0b00000000001000000000000001000000
	str r1, [r0, #GPFSEL2]

/* Programo C1 y C3 para dentro de 2 microsegundos */
	ldr r0, =STBASE
	ldr r1, [r0, #STCLO]
	add r1, #2
	str r1, [r0, #STC1]
	str r1, [r0, #STC3]

/* Habilito C1 para IRQ */
	ldr r0, =INTBASE
	mov r1, #0b0010
	str r1, [r0, #INTENIRQ1]

/* Habilito C3 para FIQ */
	mov r1, #0b10000011
	str r1, [r0, #INTFIQCON]

/* Habilito interrupciones globalmente */
	mov r0, #0b00010011 					@ Modo SVC, FIQ & IRQ activo
	msr cpsr_c, r0

/* Repetir para siempre */
bucle: b bucle

/* Rutina de tratamiento de interrupción IRQ */
irq_handler:
	push {r0, r1, r2}
	ldr r0, =GPBASE
	ldr r1, =cuenta
/* Apago todos LEDs 10987654321098765432109876543210 */
	ldr r2, =0b00001000010000100000111000000000
	str r2, [r0, #GPCLR0]
	ldr r2, [r1] 						@ Leo variable cuenta
	subs r2, #1 						@ Decremento
	moveq r2, #6 						@ Si es 0, volver a 6
	str r2, [r1] , #-4 					@ Escribo cuenta
	ldr r2, [r1, + r2, LSL #3] 				@ Leo secuencia
	str r2, [r0, #GPSET0] 					@ Escribo secuencia en LEDs
/* Reseteo estado interrupción de C1 */
	ldr r0, =STBASE
	mov r2, #0b0010
	str r2, [r0, #STCS]
/* Programo siguiente interrupción en 500ms */
	ldr r2, [r0, #STCLO]
	ldr r1, =500000 					@ 2 Hz
	add r2, r1
	str r2, [r0, #STC1]
/* Recupero registros y salgo */
	pop {r0, r1, r2}
	subs pc, lr, #4

bitson: .word 0 						@ Bit 0 = Estado del altavoz
cuenta: .word 1 						@ Entre 1 y 6, LED a encender
secuen: .word 0b1000000000000000000000000000
	.word 716 						@ Retardo para nota 6
	.word 0b0000010000000000000000000000
	.word 758 						@ Retardo para nota 5
/* guia bits 7654321098765432109876543210 */
	.word 0b0000000000100000000000000000
	.word 851 						@ Retardo para nota 4
	.word 0b0000000000000000100000000000
	.word 956 						@ Retardo para nota 3
/* guia bits 7654321098765432109876543210 */
	.word 0b0000000000000000010000000000
	.word 1012 						@ Retardo para nota 2
	.word 0b0000000000000000001000000000
	.word 1136 						@ Retardo para nota 1
