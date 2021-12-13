BareMetal:
	as -o inter1.o inter1.s
	ld -e 0 -Ttext=0x8000 -o inter1.elf inter1.o
	objcopy inter1.elf -O binary kernel.img

clean:
	rm inter1.o inter1.elf kernel.img
