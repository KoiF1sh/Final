#include <stdio.h>
#include <stdlib.h>

/* Problema tipos1.c
	Escribir el programa de la estructura del for y while en C del libro de practicas y modificarlo
*/

//@Autor    KoiF1sh    
//@Fecha    6 Dic 2021

int main()
{
	int vi = 0, vf = 5, i;
	for (i = vi; i <= vf; i++) {
		/* Cuerpo del bucle */
		printf("for ");
	}
	i = vi;
	while (i <= vf) {
		/* Cuerpo del bucle */
		printf("while ");
		i++;
	}
	return 0;
}
