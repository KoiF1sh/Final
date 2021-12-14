/* Problema greet.s
	programa corto que obtiene la entrada del teclado y luego lo imprime de nuevo en la pantalla.
*/
//@ Instituto tecnológico de Tijuana
//@ Depto de Sistemas y Computación
//@ Ingenieria en Sistemas Computacionales
//@ Lenguajes de interfaz
//@ Nombre	Ismael Chavez Perez
//@ Autor	KoiF1sh    
//@ Fecha	13 Dic 2021 2021

@ greet.s - a little asm greeter.
@ programa corto que obtiene la entrada del teclado y luego lo imprime de nuevo en la pantalla.


.section	.bss
.comm buffer, 48	     @ reserve 48 byte buffer

.section	.data
msg:
	.ascii	"** Greeter **\nPlease enter your name: "
msgLen = . - msg
msg2:
	.ascii	"Hello "
msg2Len = . - msg2

.section	.text
.globl	_start
_start:

mov r0, $1		    @ print program's opening message	
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

mov r7, $3		    @ read syscall
mov r0, $1		
ldr r1, =buffer
mov r2, $0x30
svc $0

mov r0, $1		    @ print msg2
ldr r1, =msg2
ldr r2, =msg2Len
mov r7, $4
svc $0

mov r0, $1		    @ now print the user input
ldr r1, =buffer
mov r2, $0x30
mov r7, $4
svc $0

mov r7, $1	            @ exit syscall
svc $0		            @ wake kernel
.end
