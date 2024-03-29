/* Problema 5.2: inter.inc
	Escribir el programa inter.inc donde se guardan las constantes asociadas a los puertos y también la macro ADDEXC
*/
//Instituto tecnológico de Tijuana
//Lenguaje de interfaz
//@Nombre	Ismael Chavez Perez
//@Autor	KoiF1sh    
//@Fecha	12 Dic 2021

	.macro ADDEXC vector, dirRTI
	ldr r1, =(\dirRTI -\vector + 0xa7fffffb)
	ROR r1, #2
	str r1, [r0, #\vector]
	.endm
	.set GPBASE, 0x20200000
	.set GPFSEL0, 0x00
	.set GPFSEL1, 0x04
	.set GPFSEL2, 0x08
	.set GPSET0, 0x1c
	.set GPCLR0, 0x28
	.set GPEDS0, 0x40
	.set GPFEN0, 0x58
	.set GPPUD, 0x94
	.set GPPUDCLK0, 0x98
	.set STBASE, 0x20003000
	.set STCS, 0x00
	.set STCLO, 0x04
	.set STC1, 0x10
	.set STC3, 0x18
	.set INTBASE, 0x2000b000
	.set INTFIQCON, 0x20c
	.set INTENIRQ1, 0x210
	.set INTENIRQ2, 0x214
