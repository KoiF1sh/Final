#include <stdio.h>

/* Problema tipos6.c
	Escribir el programa de la suma de un vector de enteros largos
*/

//@Autor    KoiF1sh    
//@Fecha    6 Dic 2021

void main (void)
{
int i;
long long suma ;
int vector [5]= {1600000000 , -100 , 800000000 , -50 , 200};

for ( suma = i = 0; i <5; i ++ )
{
suma += vector [i];
}
printf (" La suma es %d \n" , suma );
}
