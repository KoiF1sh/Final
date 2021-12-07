#include <stdio.h>

/* Problema tipos4.c
	Escribir el programa de la suma de elementos de un vector en c
*/

//@Autor    KoiF1sh    
//@Fecha    6 Dic 2021

void main ( void )
{
int i, suma;
int vector [5]= {128 , 32 , 100 , -30 , 124};

  for ( suma = i = 0; i <5; i ++ )
  {
    suma += vector [i ];
  }
  
printf (" La suma es %d \n" , suma );
}
