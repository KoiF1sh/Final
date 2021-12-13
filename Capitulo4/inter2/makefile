BareMetal:
	as -o inter2.o inter2.s
	ld -e 0 -Ttext=0x8000 -o inter2.elf inter2.o
	objcopy inter2.elf -O binary kernel.img

clean:
	rm inter2.o inter2.elf kernel.img
