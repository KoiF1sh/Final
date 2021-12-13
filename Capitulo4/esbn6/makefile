BareMetal:
	as -o esbn6.o esbn6.s
	ld -e 0 -Ttext=0x8000 -o esbn6.elf esbn6.o
	objcopy esbn6.elf -O binary kernel.img

clean:
	rm esbn6.o esbn6.elf kernel.img
