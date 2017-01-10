#
# Makefile for busy-wait IO library
#
XCC     = gcc
AS	= as
AR	= ar
CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings
# -msoft-float: use software for floating point

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs-32: always create a complete stack frame

ARFLAGS = rcs

all:  commandHandler.a 

commandHandler.s: commandHandler.c 
	$(XCC) -S $(CFLAGS) commandHandler.c

commandHandler.o: commandHandler.s
	$(AS) $(ASFLAGS) -o commandHandler.o commandHandler.s

commandHandler.a: commandHandler.o
	$(AR) $(ARFLAGS) $@ commandHandler.o
	-cp ./commandHandler.a ../lib/libcommandHandler.a


clean:
	-rm -f *.s *.a *.o
