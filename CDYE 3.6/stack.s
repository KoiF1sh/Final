/* Problema stack.s
	Ejemplo muy sencillo del uso del stack de la cpu.
*/
//@ Instituto tecnológico de Tijuana
//@ Depto de Sistemas y Computación
//@ Ingenieria en Sistemas Computacionales
//@ Lenguajes de interfaz
//@ Nombre	Ismael Chavez Perez
//@ Autor	KoiF1sh    
//@ Fecha	13 Dic 2021

.global main

main:
     mov   r0, #2  /* set up r0 */
     push  {r0}    /* save r0 onto the stack */
     mov   r0, #3  /* overwrite r0 */
     pop   {r0}    /* restore r0 to it's initial state */
     bx    lr      /* finish the program */
