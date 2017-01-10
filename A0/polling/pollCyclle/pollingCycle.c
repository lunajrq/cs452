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

	struct TrainCmd cmd;
	cmd.type = SET_SWITCH;
	cmd.arg1 = 153;
	cmd.arg2 = 1;
	pushTrainCmd(&trainIO, &cmd);


	cmd.type = SET_SWITCH;
	cmd.arg1 = 154;
	cmd.arg2 = 0;
	pushTrainCmd(&trainIO, &cmd);


	cmd.type = SET_SWITCH;
	cmd.arg1 = 155;
	cmd.arg2 = 1;
	pushTrainCmd(&trainIO, &cmd);

	cmd.type = SET_SWITCH;
	cmd.arg1 = 156;
	cmd.arg2 = 0;
	pushTrainCmd(&trainIO, &cmd);

	unsigned int currentTIme = 0;
	int timeInterval = 0;
	unsigned int maxInterval = 0;
	unsigned int minInterval = 0xFFFF;
	unsigned int refresh = 0;

	FOREVER {
		if(getTimerTick() == 1) {
			//continue;
		}
		if(refresh != getTime()/1000) currentTIme = *((unsigned int *)(TIMER3_BASE + VAL_OFFSET));
		


		if(buffer2port(&COM2IO) == 1) ;//continue;
		if(port2buffer(&COM2IO) == 1) ;//continue;

		if(buffer2port(&COM1IO) == -3) baseIOprintf(&COM2IO, "1");//continue;
		if(port2buffer(&COM1IO) == 1) ;//continue;

		UIHeartBeat(&ui);
		trainIOHeartBeat(&trainIO);
		int commandResult = commandHandlerHeartBeat(&cHandler);
		if(refresh != getTime()/1000) timeInterval = currentTIme - *((unsigned int *)(TIMER3_BASE + VAL_OFFSET));
		if(refresh != getTime()/1000) if(timeInterval < 0) timeInterval += 508;
		if(refresh != getTime()/1000) if(timeInterval >  maxInterval) maxInterval = timeInterval;
		if(refresh != getTime()/1000) if(timeInterval <  minInterval) minInterval = timeInterval;
		if(refresh != getTime()/1000) baseIOprintf(&COM2IO, "\n\r%d\n\r%d \n\r%d", timeInterval, maxInterval, minInterval);
if(refresh != getTime()/1000) refresh = getTime() / 1000;
		if(commandResult == -2) break;
	}

	return 0;
}

