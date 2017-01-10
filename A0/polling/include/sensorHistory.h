#pragma once

#include <baseIO.h>

#define SENSOR_HISTORY_MAX 10

struct SensorData {
	unsigned int buffer[6];
};

struct SensorHistoryData {
	char module;
	int id;
};

struct SensorHistory {
	struct BaseIO *baseIO;

	int left, top;

	struct SensorData data[2];
	int last, current;

	struct SensorHistoryData triggerHistory[SENSOR_HISTORY_MAX];
	int triggerHistoryStart, triggerHistoryEnd;

	unsigned int nextUpdateTime;
	int isIdle;

	int startTime;
	unsigned int timeResult;
	unsigned int tempTime;
};


void initSensorHistory(struct SensorHistory *sHistory, struct BaseIO *baseIO, int left, int top);
int sensorHistoryHeartBeat(struct SensorHistory *sHistory);
