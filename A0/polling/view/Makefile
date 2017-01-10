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

all:  commandPrompt.a clock.a UI.a switchTable.a sensorHistory.a

commandPrompt.s: commandPrompt.c 
	$(XCC) -S $(CFLAGS) commandPrompt.c

commandPrompt.o: commandPrompt.s
	$(AS) $(ASFLAGS) -o commandPrompt.o commandPrompt.s

commandPrompt.a: commandPrompt.o
	$(AR) $(ARFLAGS) $@ commandPrompt.o
	-cp ./commandPrompt.a ../lib/libcommandPrompt.a


clock.s: clock.c 
	$(XCC) -S $(CFLAGS) clock.c

clock.o: clock.s
	$(AS) $(ASFLAGS) -o clock.o clock.s

clock.a: clock.o
	$(AR) $(ARFLAGS) $@ clock.o
	-cp ./clock.a ../lib/libclock.a


UI.s: UI.c 
	$(XCC) -S $(CFLAGS) UI.c

UI.o: UI.s
	$(AS) $(ASFLAGS) -o UI.o UI.s

UI.a: UI.o
	$(AR) $(ARFLAGS) $@ UI.o
	-cp ./UI.a ../lib/libUI.a


switchTable.s: switchTable.c 
	$(XCC) -S $(CFLAGS) switchTable.c

switchTable.o: switchTable.s
	$(AS) $(ASFLAGS) -o switchTable.o switchTable.s

switchTable.a: switchTable.o
	$(AR) $(ARFLAGS) $@ switchTable.o
	-cp ./switchTable.a ../lib/libswitchTable.a


sensorHistory.s: sensorHistory.c 
	$(XCC) -S $(CFLAGS) sensorHistory.c

sensorHistory.o: sensorHistory.s
	$(AS) $(ASFLAGS) -o sensorHistory.o sensorHistory.s

sensorHistory.a: sensorHistory.o
	$(AR) $(ARFLAGS) $@ sensorHistory.o
	-cp ./sensorHistory.a ../lib/libsensorHistory.a

clean:
	-rm -f *.s *.a *.o
