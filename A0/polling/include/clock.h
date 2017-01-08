#pragma once
#include <baseIO.h>

struct Clock {
	int left, top;
	struct BaseIO *baseIO;
	int lastTime;
};

void initClock(struct Clock *clock, struct BaseIO *baseIO, int left, int top);

int clockHeartBeat(struct Clock *clock);


