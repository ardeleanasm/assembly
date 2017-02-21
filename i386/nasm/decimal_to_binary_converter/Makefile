NASM=nasm -felf
GCC=gcc
FILE=decbin
all:	clean compile link
compile:
	$(NASM) $(FILE).asm
link:
	$(GCC) $(FILE).o -o $(FILE)
clean:
	rm -f $(FILE) $(FILE).o