 /*
 * pollingCycle.c
 */

#include <baseIO.h>
#include <timer.h>
#include <ts7200.h>
#include <cursorAddressing.h>
#include <UI.h>

#define FOREVER	for(;;)

int main( int argc, char* argv[] ) {
	struct BaseIO COM1IO;
	struct BaseIO COM2IO;
	baseIOBootstrap(&COM1IO, &COM2IO);
	timerBootstrap();
	baseIOprintf(&COM2IO, "%c[2J",IO_ESC);

	struct UI ui;
	initUI(&ui, &COM2IO);


	FOREVER {
		if(getTimerTick() == 1) {
			continue;
		}

		if(buffer2port(&COM2IO) == 1) continue;
		if(port2buffer(&COM2IO) == 1) continue;

		UIHeartBeat(&ui);
	}

	return 0;
}

