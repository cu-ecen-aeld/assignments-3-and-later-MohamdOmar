CROSS_COMPILE=
CC=$(CROSS_COMPILE)gcc

CFLAGS=-g -Wall

default:
	$(CC) $(CFLAGS) -o writer writer.c

CROSS_COMPILE_X: 
	${CROSS_COMPILE}gcc $(CFLAGS) -o writer writer.c 

clean:
	rm -f *.o writer *.elf *.map
