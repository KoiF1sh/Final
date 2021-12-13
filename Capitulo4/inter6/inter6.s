/* Problema 5.7: inter6.s
	Escribir el programa inter6.s que trata sobre el control de luces/sonido con pulsadores en lugar temporizadores
*/
//Instituto tecnológico de Tijuana
//Lenguaje de interfaz
//@Nombre	Ismael Chavez Perez
//@Autor	KoiF1sh    
//@Fecha	12 Dic 2021

	.include "inter.inc"
.text

/* Agrego vectores de interrupci ón */
  ADDEXC 0x18, irq_handler
ADDEXC 0x1c, fiq_handler
/* Inicializo la pila en modos FIQ, IRQ y SVC */
mov r0, # 0b11010001 @ Modo FIQ, FIQ & IRQ desact
msr cpsr_c, r0
mov sp, # 0x4000
mov r0, # 0b11010010 @ Modo IRQ, FIQ & IRQ desact
msr cpsr_c, r0
mov sp, # 0x8000
mov r0, # 0b11010011 @ Modo SVC, FIQ & IRQ desact
msr cpsr_c, r0
mov sp, # 0x8000000
/* Configuro GPIOs 4, 9, 10, 11, 17, 22 y 27 como salida */
ldr r0, = GPBASE
ldr r1, = 0b00001000000000000001000000000000
str r1, [ r0, # GPFSEL0 ]
/* guia bits xx999888777666555444333222111000 */
ldr r1, = 0b00000000001000000000000000001001
str r1, [ r0, # GPFSEL1 ]
ldr r1, = 0b00000000001000000000000001000000
str r1, [ r0, # GPFSEL2 ]
/* Enciendo LEDs 10987654321098765432109876543210 */
mov r1, # 0b00000000000000000000001000000000
str r1, [ r0, # GPSET0 ]
/* Habilito pines GPIO 2 y 3 ( botones ) para interrupciones */
mov r1, # 0b00000000000000000000000000001100
str r1, [ r0, # GPFEN0 ]
/* Programo C1 para dentro de 2 microsegundos */
ldr r0, = STBASE
ldr r1, [ r0, # STCLO ]
add r1, # 2
str r1, [ r0, # STC1 ]
/* Habilito GPIO para IRQ */
ldr r0, = INTBASE
/* guia bits 10987654321098765432109876543210 */
mov r1, # 0b00000000000100000000000000000000
str r1, [ r0, # INTENIRQ2 ]
/* Habilito C1 para FIQ */
mov r1, # 0b10000001
str r1, [ r0, # INTFIQCON ]
/* Habilito interrupciones globalmente */
mov r0, # 0b00010011 @ modo SVC, FIQ & IRQ activo
msr cpsr_c, r0
/* Repetir para siempre */
bucle : b bucle
irq_handler :
push { r0, r1, r2 }
ldr r0, = GPBASE
ldr r1, = cuenta
/* Apago todos LEDs 10987654321098765432109876543210 */
ldr r2, = 0b00001000010000100000111000000000
str r2, [ r0, # GPCLR0 ]
/* Leo bot ón pulsado */
ldr r2, [ r0, # GPEDS0 ]
ands r2, # 0b00000000000000000000000000001000
beq incre
/* Si es bot ón izquierdo, decrementar */
str r2, [ r0, # GPEDS0 ] @ Reseteo flag b. izq
ldr r2, [ r1 ] @ Leo variable cuenta
subs r2, # 1 @ Decremento
moveq r2, # 6 @ Si es 0, volver a 6
b conti @ Salto a conti
/* Si es bot ón derecho, incrementar */
incre : mov r2, # 0b00000000000000000000000000000100
str r2, [ r0, # GPEDS0 ] @ Reseteo flag b. der
ldr r2, [ r1 ] @ Leo variable cuenta
add r2, # 1 @ Incremento
cmp r2, # 7 @ Comparo si llego a 7
moveq r2, # 1 @ Si es 7, volver a 1
/* Actualizo variable, enciendo LED y salgo */
conti : str r2, [ r1 ] , # -4 @ Escribo variable cuenta
ldr r2, [ r1, + r2, LSL #3 ] @ Leo secuencia
str r2, [ r0, # GPSET0 ] @ Escribo secuencia en LEDs
pop { r0, r1, r2 } @ Recupero registros
subs pc, lr, #4 @ Salgo RTI
