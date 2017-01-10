#
# Makefile for busy-wait IO tests
#
XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map pollingCycle.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all:  pollingCycle.s pollingCycle.elf

pollingCycle.s: pollingCycle.c pollingCycle.h
	$(XCC) -S $(CFLAGS) pollingCycle.c

pollingCycle.o: pollingCycle.s
	$(AS) $(ASFLAGS) -o pollingCycle.o pollingCycle.s

pollingCycle.elf: pollingCycle.o
	$(LD) $(LDFLAGS) -o $@ pollingCycle.o -lUI -lsensorHistory -lcommandPrompt -lclock -lswitchTable -ltrainIO -lcommandHandler -ltrainStatus -lbaseIO -ltimer -lgcc
	-cp ./pollingCycle.elf /u/cs452/tftp/ARM/r4jin/pollingCycle.elf

clean:
	-rm -f pollingCycle.elf *.s *.o pollingCycle.map
