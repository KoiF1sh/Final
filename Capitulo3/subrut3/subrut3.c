#include <stdio.h>

/* Problema subrut3.c
	Escribir el programa del Código del programa subrut3 en c
*/

//@Autor    KoiF1sh    
//@Fecha    9 Dic 2021

#include <stdio.h>

int fibonacci (int n )
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
