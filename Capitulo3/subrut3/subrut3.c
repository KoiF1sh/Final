#include <stdio.h>

/* Problema 3.6: subrut3.c
	Escribir el programa del Código del programa subrut3 en c
*/
// Instituto tecnológico de Tijuana
// Lenguaje de interfaz
//@Autor    KoiF1sh    
//@Fecha    9 Dic 2021

int fibonacci (int n)
{
	if( n < 2 )
	return 1;
	else
	return fibonacci (n -1) + fibonacci (n -2);
}

void main(void)
{
	int i;

	for ( i= 0; i <10; i ++ )
	printf ( " %d\n " , fibonacci ( i ));
}
