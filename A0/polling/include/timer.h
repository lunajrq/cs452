#pragma once

/*
 * Using Timer3
 * 2kHz, periodic mode
 */
#define CLOCK_FREQUENCY 508000/1000



void timerBootstrap();
// for user get time in second
unsigned int getTime();
// for loop get time from register
int getTimerTick();
