#
# This file is part of Pencil
# Licensed under the MIT License,
#                http://www.opensource.org/licenses/mit-license
# Copyright 2005 James Bursa <james@semichrome.net>
#

SOURCE = pencil_build.c pencil_save.c

CC = /home/riscos/cross/bin/gcc
CFLAGS = -std=c99 -O3 -W -Wall -Wundef -Wpointer-arith -Wcast-qual \
	-Wcast-align -Wwrite-strings -Wstrict-prototypes \
	-Wmissing-prototypes -Wmissing-declarations \
	-Wnested-externs -Winline -Wno-cast-align \
	-mpoke-function-name -I/home/riscos/env/include
LIBS = -L/home/riscos/env/lib -loslib -lrufl

all: pencil.o pencil_test,ff8

pencil.o: $(SOURCE) pencil.h pencil_internal.h
	$(CC) $(CFLAGS) -c -o $@ $(SOURCE)

pencil_test,ff8: pencil_test.c pencil.o
	$(CC) $(CFLAGS) $(LIBS) -o $@ $^

clean:
	-rm pencil.o pencil_test,ff8
