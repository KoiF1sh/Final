BareMetal:
	as -o esbn5.o esbn5.s
	ld -e 0 -Ttext=0x8000 -o esbn5.elf esbn5.o
	objcopy esbn5.elf -O binary kernel.img

clean:
	rm esbn5.o esbn5.elf kernel.img
