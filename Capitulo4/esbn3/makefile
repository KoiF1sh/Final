BareMetal:
	as -o esbn3.o esbn3.s
	ld -e 0 -Ttext=0x8000 -o esbn3.elf esbn3.o
	objcopy esbn3.elf -O binary kernel.img

clean:
	rm esbn3.o esbn3.elf kernel.img
