BareMetal:
	as -o esbn2.o esbn2.s
	ld -e 0 -Ttext=0x8000 -o esbn2.elf esbn1.o
	objcopy esbn2.elf -O binary kernel.img

clean:
	rm esbn2.o esbn2.elf kernel.img
