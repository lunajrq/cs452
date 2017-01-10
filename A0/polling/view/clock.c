#include <timer.h>
#include <clock.h>
#include <baseIO.h>

#include <cursorAddressing.h>

void initClock(struct Clock *clock, struct BaseIO *baseIO, int left, int top) {
	clock->left = left;
	clock->top = top;
	clock->baseIO = baseIO;
	clock->lastTime = 0;
}

int clockHeartBeat(struct Clock *clock) {
	unsigned int timePassed = getTime()/1000;
	if(timePassed == clock->lastTime) {
		return 0;
	}
	IO_POS(clock->baseIO, clock->top, clock->left);
	int hours = timePassed / 3600;
	int minutes = (timePassed % 3600) / 60;
	int seconds = timePassed % 60;

	baseIOprintf(clock->baseIO, "%dh %dmin %ds elapsed", hours, minutes, seconds);
	clock->lastTime = timePassed;
	return 1;
}
