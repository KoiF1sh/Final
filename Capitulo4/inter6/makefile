BareMetal:
	as -o inter6.o inter6.s
	ld -e 0 -Ttext=0x8000 -o inter6.elf inter6.o
	objcopy inter6.elf -O binary kernel.img

clean:
	rm inter6.o inter6.elf kernel.img
