
CC := $(CROSS_COMPILE)gcc
CFLAGS ?= -g -Wall -Werror
# TARGET ?= aesdsocket
# LDFLAGS ?= -lpthread -lrt
all : aesdsocket
# aesdsocket : aesdsocket.c
	$(CC) $(CFLAGS) -o aesdsocket aesdsocket.c $(LDFLAGS)
.PHONY : clean
clean:
	-rm aesdsocket