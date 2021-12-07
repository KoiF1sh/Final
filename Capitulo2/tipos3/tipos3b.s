/* Problema tipos3a.s
	Escribir el código del programa tipos3a.c
*/

//@Autor    KoiF1sh    
//@Fecha    6 Dic 2021

.data
var1 : .asciz " %d\ 012 "
.text
.global main
main :  push { r4, lr }
  mov r1, # 0
  ldr r4, = var1
  mov r0, r4
  bl printf
  mov r0, r4
  mov r1, # 1
  bl printf
  mov r0, r4
  mov r1, # 2
  bl printf
  mov r0, r4
  mov r1, # 3
  bl printf
  mov r0, r4
  mov r1, # 4
  pop { r4, lr }
  b printf
  mov r0, r4
  mov r1, # 4
  bl printf
  pop { r4, lr }
  bx lr
