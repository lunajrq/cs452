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

all:  trainIO.a 

trainIO.s: trainIO.c 
	$(XCC) -S $(CFLAGS) trainIO.c

trainIO.o: trainIO.s
	$(AS) $(ASFLAGS) -o trainIO.o trainIO.s

trainIO.a: trainIO.o
	$(AR) $(ARFLAGS) $@ trainIO.o
	-cp ./trainIO.a ../lib/libtrainIO.a


clean:
	-rm -f *.s *.a *.o
