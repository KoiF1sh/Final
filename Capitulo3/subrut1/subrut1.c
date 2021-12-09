#include <stdio.h>

/* Problema 3.3: subrut1.c
	Escribir el programa del Código del programa subrut1 en c
*/
// Instito tecnológico de Tijuana
// Lenguaje de interfaz
//@Autor    KoiF1sh    
//@Fecha    9 Dic 2021

static int seed;
short myrand(void)
{
seed = seed*1103515245 + 12345;
return seed>>16 & 0x7fff;
}
void mysrand ( int x ){
seed = x;
}

void main(void)
{
int i;
mysrand (42);
for ( i= 0; i <5; i ++ )
{
printf ( " %d\n " , myrand ());
}
}
