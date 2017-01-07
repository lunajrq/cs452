
/*
 * Using Timer3
 * 2kHz, periodic mode
 */
#define CLOCK_FREQUENCY 2000



void timerBootstrap();
// for user get time in second
int getTime();
// for loop get time from register
int getTimerTick();
