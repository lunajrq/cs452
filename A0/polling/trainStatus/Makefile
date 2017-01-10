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

all:  trainStatus.a 

trainStatus.s: trainStatus.c 
	$(XCC) -S $(CFLAGS) trainStatus.c

trainStatus.o: trainStatus.s
	$(AS) $(ASFLAGS) -o trainStatus.o trainStatus.s

trainStatus.a: trainStatus.o
	$(AR) $(ARFLAGS) $@ trainStatus.o
	-cp ./trainStatus.a ../lib/libtrainStatus.a


clean:
	-rm -f *.s *.a *.o
