#include <sensorHistory.h>
#include <baseIO.h>
#include <cursorAddressing.h>
#include <timer.h>
#include <trainIO.h>

#define SENSOR_HISTORY_MAX 10

void initSensorHistory(struct SensorHistory *sHistory, struct BaseIO *baseIO, int left, int top) {
	sHistory->baseIO = baseIO;
	sHistory->left = left;
	sHistory->top = top;
	sHistory->last = 1;
	sHistory->current = 0;
	sHistory->triggerHistoryStart = 0;
	sHistory->triggerHistoryEnd = 0;
	sHistory->nextUpdateTime = 0;

	sHistory->isIdle = 1;

}

int sensorHistoryBootstrap(struct SensorHistory *sHistory) {
	if(sHistory->isIdle) {
		if(getTime() > sHistory->nextUpdateTime) {
			sHistory->isIdle = 0;
			struct TrainCmd trainCmd;
			trainCmd.type = CHECK_SENSOR;
			trainCmd.arg1 = (int)(sHistory->data + sHistory->current);
			((unsigned int *)(sHistory->data + sHistory->current))[5] = 0x0;
			pushTrainCmd(getTrainIO(), &trainCmd);
			return 2;
		} else {
			return 0;
		}
	} else {
		if(((unsigned int *)(sHistory->data + sHistory->current))[5] == 0x1) {
			baseIOprintf(sHistory->baseIO, "12321321");


			return 1;
		} else {
			return 0;
		}
	}
}