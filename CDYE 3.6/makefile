teclado: teclado.o
	ld -o teclado teclado.o

teclado.o: teclado.s
	as -g -o teclado.o teclado.s

greet: greet.o
	ld -o greet greet.o

greet.o: greet.s
	as -g -o greet.o greet.s

stack: stack.o
	ld -o stack stack.o

stack.o: stack.s
	as -g -o stack.o stack.s

hanoi1: hanoi1.o
	gcc -o hanoi1 hanoi1.o

hanoi1.o: hanoi1.s
	as -g -o hanoi1.o hanoi1.s

hanoi2: hanoi2.o
	gcc -o hanoi2 hanoi2.o

hanoi2.o: hanoi2.s
	as -g -o hanoi2.o hanoi2.s

delayExample: delayExample.o
	gcc -o delayExample delayExample.o

delayExample.o: delayExample.s
	as -g -o delayExample.o delayExample.s

primos: primos.o
	ld -o primos primos.o

primos.o: primos.s
	as -g -o primos.o primos.s

clean:
	rm teclado teclado.o greet greet.o stack stack.o hanoi1 hanoi1.o hanoi2 hanoi2.o delayExample delayExample.o primos primos.o
