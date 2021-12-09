#include <stdio.h>

/* Problema 3.11: subrut5.c
	Escribir el código del programa subrut5 en c
*/
// Instituto tecnológico de Tijuana
// Lenguaje de interfaz
//@Autor    KoiF1sh    
//@Fecha    9 Dic 2021

int poly3 ( int a , int b , int c , int d , int x ){
return a*x*x*x + b*x*x + c*x + d ;
}

void main (void)
{
printf("%d\n%d\n%d\n" ,
poly3 (1 , 2, 3, 4, 5) ,
poly3 (1 , -1 , 1 , -1 , 8) ,
poly3 (2 , 0, 0, 0, 8));
}
