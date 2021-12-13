BareMetal:
	as -o inter3.o inter3.s
	ld -e 0 -Ttext=0x8000 -o inter3.elf inter3.o
	objcopy inter3.elf -O binary kernel.img

clean:
	rm inter3.o inter3.elf kernel.img
