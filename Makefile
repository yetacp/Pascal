# This is the makefile for Linux to build pdpclib using
# the gcc compiler.
#

CC=gcc
COPTS=-c -O2 -I ./include

C_SOURCE:=$(wildcard \
	src/*.c \
)

OBJ:=$(subst .c,.o,$(C_SOURCE))

all: pcint

pcint: $(OBJ)
	$(CC) $(OBJ) -lm -o bin/pcint

.c.o:
	$(CC) $< $(COPTS) -o $@

clean:
	@rm -f ./src/*.o bin/pcint

