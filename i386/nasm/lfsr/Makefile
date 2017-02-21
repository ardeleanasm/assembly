NASM=nasm -felf
GCC=gcc
FILE=lfsr
all:	clean compile link
compile:
	$(NASM) $(FILE).asm
link:
	$(GCC) $(FILE).o -o $(FILE)
clean:
	rm -f $(FILE) $(FILE).o
