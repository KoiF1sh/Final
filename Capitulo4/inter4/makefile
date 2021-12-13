BareMetal:
	as -o inter4.o inter4.s
	ld -e 0 -Ttext=0x8000 -o inter4.elf inter4.o
	objcopy inter4.elf -O binary kernel.img

clean:
	rm inter4.o inter4.elf kernel.img
