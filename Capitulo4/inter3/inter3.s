/* Problema 5.3: inter2.s
	Escribir el programa inter2.s que trata sobre Interrupciones
*/
//Instituto tecnológico de Tijuana
//Lenguaje de interfaz
//@Nombre	Ismael Chavez Perez
//@Autor	KoiF1sh    
//@Fecha	12 Dic 2021

	.include "inter.inc"
.text
/* Agrego vector interrupci ón */
ADDEXC 0x18, irq_handler
/* Inicializo la pila en modos IRQ y SVC */
mov r0, # 0b11010010 @ Modo IRQ, FIQ & IRQ desact
msr cpsr_c, r0
mov sp, # 0x8000
mov r0, # 0b11010011 @ Modo SVC, FIQ & IRQ desact
msr cpsr_c, r0
mov sp, # 0x8000000
/* Configuro GPIOs 9 y 10 como salida */
ldr r0, = GPBASE
mov r1, # 0b00001000000000000000000000000000
str r1, [ r0, # GPFSEL0 ]
/* guia bits xx999888777666555444333222111000 */
mov r1, # 0b00000000000000000000000000000001
str r1, [ r0, # GPFSEL1 ]
/* Enciendo LEDs 10987654321098765432109876543210 */
mov r1, # 0b00000000000000000000011000000000
str r1, [ r0, # GPSET0 ]
/* Habilito pines GPIO 2 y 3 ( botones ) para interrupciones */
mov r1, # 0b00000000000000000000000000001100
str r1, [ r0, # GPFEN0 ]
ldr r0, = INTBASE
/* Habilito interrupciones, local y globalmente */
mov r1, # 0b00000000000100000000000000000000
/* guia bits 10987654321098765432109876543210 */
str r1, [ r0, # INTENIRQ2 ]
mov r0, # 0b01010011 @ Modo SVC, IRQ activo
msr cpsr_c, r0
/* Repetir para siempre */
bucle : b bucle
/* Rutina de tratamiento de interrupci ón */
irq_handler :
push { r0, r1 }
ldr r0, = GPBASE
/* Apago los dos LEDs rojos 54321098765432109876543210 */
mov r1, # 0b00000000000000000000011000000000
str r1, [ r0, # GPCLR0 ]
/* Consulto si se ha pulsado el bot ón GPIO2 */
ldr r1, [ r0, # GPEDS0 ]
ands r1, # 0b00000000000000000000000000000100
/* Sí: Activo GPIO 9; No: Activo GPIO 10 */
movne r1, # 0b00000000000000000000001000000000
moveq r1, # 0b00000000000000000000010000000000
str r1, [ r0, # GPSET0 ]
/* Desactivo los dos flags GPIO pendientes de atenci ón
guia bits 54321098765432109876543210 */
mov r1, # 0b00000000000000000000000000001100
str r1, [ r0, # GPEDS0 ]
pop { r0, r1 }
subs pc, lr, #4