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
	int timePassed = getTime();
	if(timePassed == clock->lastTime) {
		return 0;
	}
	IO_POS(clock->baseIO, clock->top, clock->left);
	baseIOprintf(clock->baseIO, "%ds elapsed", timePassed);
	clock->lastTime = timePassed;
	return 1;
}
