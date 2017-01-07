 /*
 * pollingCycle.c
 */

#include <baseIO.h>
#include <timer.h>
#include <ts7200.h>

#define FOREVER	for(;;)

int main( int argc, char* argv[] ) {
	struct BaseIO COM1IO;
	struct BaseIO COM2IO;
	baseIOBootstrap(&COM1IO, &COM2IO);
	timerBootstrap();

	writeStr(&COM2IO, "Hello, world!");
	char c;
	int timer;

	FOREVER {
		if(getTimerTick() == 1) {
			timer = getTime();
			writeChar(&COM2IO, '0' + timer);
		}

		buffer2port(&COM2IO);
		port2buffer(&COM2IO);
		if(readChar(&COM2IO, &c) != -1) {
			writeChar(&COM2IO, c);
		}
	}

	return 0;
}

