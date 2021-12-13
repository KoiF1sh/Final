BareMetal:
	as -o inter5.o inter5.s
	ld -e 0 -Ttext=0x8000 -o inter5.elf inter5.o
	objcopy inter5.elf -O binary kernel.img

clean:
	rm inter5.o inter5.elf kernel.img
