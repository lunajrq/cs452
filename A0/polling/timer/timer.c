#include <timer.h>
#include <ts7200.h>


unsigned int _timerTick = 0;
unsigned int _then = 0;
unsigned int _now = 0;

/*
 * Using Timer3
 * 2kHz, periodic mode
 */
void timerBootstrap() {
	// Setting Load value to 2k
	*((unsigned int *)(TIMER3_BASE + LDR_OFFSET)) = CLOCK_FREQUENCY;
	// Using periodic mode
	*((unsigned int *)(TIMER3_BASE + CRTL_OFFSET)) = *((unsigned int *)(TIMER3_BASE + CRTL_OFFSET)) | MODE_MASK;
	// Using  2kHz
	*((unsigned int *)(TIMER3_BASE + CRTL_OFFSET)) = *((unsigned int *)(TIMER3_BASE + CRTL_OFFSET)) | CLKSEL_MASK;
	// Start the timer
	*((unsigned int *)(TIMER3_BASE + CRTL_OFFSET)) = *((unsigned int *)(TIMER3_BASE + CRTL_OFFSET)) | ENABLE_MASK;

	_timerTick = 0;
}

// for loop get time from register
int getTimerTick() {
	_now = *((unsigned int *)(TIMER3_BASE + VAL_OFFSET));
	if(_now > _then) {
		_timerTick++;
		_then = _now;
		return 1;
	}
	_then = _now;

	return 0;
}

// for user get time in second
unsigned int getTime() {
	return _timerTick;
}
