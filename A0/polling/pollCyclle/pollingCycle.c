 /*
 * pollingCycle.c
 */

#include <baseIO.h>
#include <timer.h>
#include <ts7200.h>
#include <cursorAddressing.h>
#include <UI.h>
#include <trainIO.h>
#include <commandHandler.h>
#include <trainStatus.h>

#define FOREVER	for(;;)

int main( int argc, char* argv[] ) {
	struct BaseIO COM1IO;
	struct BaseIO COM2IO;
	baseIOBootstrap(&COM1IO, &COM2IO);
	timerBootstrap();
	baseIOprintf(&COM2IO, "%c[2J",IO_ESC);

	struct UI ui;
	initUI(&ui, &COM2IO);

	struct TrainIO trainIO;
	trainIOBootstrap(&trainIO, &COM1IO);

	struct CommandHandler cHandler;
	commandHandlerBootstrap(&cHandler);

	struct TrainSpeed tSpeed;
	trainSpeedBootstrap(&tSpeed);

	struct TrainSwitchStatus trainSwitchStatus;
	TrainSwitchStatusBootstrap(&trainSwitchStatus);

	int i = 1;
	for(; i <= 18; i++) {
		struct TrainCmd cmd;
		cmd.type = SET_SWITCH;
		cmd.arg1 = i;
		cmd.arg2 = 1;
		pushTrainCmd(&trainIO, &cmd);
	}


	FOREVER {
		if(getTimerTick() == 1) {
			//continue;
		}

		if(buffer2port(&COM2IO) == 1) ;//continue;
		if(port2buffer(&COM2IO) == 1) ;//continue;

		if(buffer2port(&COM1IO) == -3) baseIOprintf(&COM2IO, "1");//continue;
		if(port2buffer(&COM1IO) == 1) ;//continue;

		UIHeartBeat(&ui);
		trainIOHeartBeat(&trainIO);
		int commandResult = commandHandlerHeartBeat(&cHandler);
		if(commandResult == -2) break;
	}

	return 0;
}

