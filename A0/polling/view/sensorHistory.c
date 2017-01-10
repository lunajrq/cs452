#include <sensorHistory.h>
#include <baseIO.h>
#include <cursorAddressing.h>
#include <timer.h>
#include <trainIO.h>

#define SENSOR_HISTORY_MAX 10

unsigned int tmpTime = 0;
int result = 0;

void initSensorHistory(struct SensorHistory *sHistory, struct BaseIO *baseIO, int left, int top) {
	sHistory->baseIO = baseIO;
	sHistory->left = left;
	sHistory->top = top;
	sHistory->last = 1;
	sHistory->current = 0;
	sHistory->triggerHistoryStart = 0;
	sHistory->triggerHistoryEnd = 0;
	sHistory->nextUpdateTime = 0;
	int i = 0;
	for(; i < 6; i++) (sHistory->data)[sHistory->last].buffer[i] = 0x0;
	for(i = 0; i < 6; i++) (sHistory->data)[sHistory->current].buffer[i] = 0x0;
	sHistory->isIdle = 1;

}

int sensorHistoryPushHistory(struct SensorHistory *sHistory, char module, unsigned int id) {

	sHistory->triggerHistory[sHistory->triggerHistoryEnd].module = module;
	sHistory->triggerHistory[sHistory->triggerHistoryEnd].id = id;
	sHistory->triggerHistoryEnd++;
	if(sHistory->triggerHistoryEnd >= SENSOR_HISTORY_MAX) {
		sHistory->triggerHistoryEnd = 0;
	}
	if(sHistory->triggerHistoryEnd == sHistory->triggerHistoryStart) {
		sHistory->triggerHistoryStart++;
	}
	if(sHistory->triggerHistoryStart >= SENSOR_HISTORY_MAX) {
		sHistory->triggerHistoryStart = 0;
	}
	return 0;
}


void sensorHistoryPrint(struct SensorHistory *sHistory) {
	//baseIOprintf(sHistory->baseIO, "123");
	IO_POS(sHistory->baseIO, sHistory->top, sHistory->left);
	int i = sHistory->triggerHistoryStart;
	for(; i != sHistory->triggerHistoryEnd; i++) {

		baseIOprintf(sHistory->baseIO, "%c%d ", sHistory->triggerHistory[i].module, sHistory->triggerHistory[i].id);
		if(i >= SENSOR_HISTORY_MAX - 1) i = -1;
	}
}

int sensorHistoryHeartBeat(struct SensorHistory *sHistory) {
	if(sHistory->isIdle) {
		if(getTime() > sHistory->nextUpdateTime) {
			tmpTime = getTime();;
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
		if(((sHistory->data[sHistory->current]).buffer)[5] == 0x1) {

				baseIOprintf(sHistory->baseIO, "\n\rsensor: %d  ", getTime() - tmpTime);


			int dirty = 0;
			//baseIOprintf(sHistory->baseIO, "%x\n\r", 10);
			/*baseIOprintf(sHistory->baseIO, "\n\r%d,\n\r%d,\n\r%d,\n\r%d,\n\r%d\n\r", 
				((unsigned int *)(sHistory->data + sHistory->current))[0],
				((unsigned int *)(sHistory->data + sHistory->current))[1],
				((unsigned int *)(sHistory->data + sHistory->current))[2],
				((unsigned int *)(sHistory->data + sHistory->current))[3],
				((unsigned int *)(sHistory->data + sHistory->current))[4]);*/

			int i = 0;

			for(; i < 5; i++) {
				unsigned int temp = ((sHistory->data)[sHistory->last]).buffer[i] ^ ((sHistory->data)[sHistory->current]).buffer[i];
				//baseIOprintf(sHistory->baseIO, "ppp\n\r");
				if(temp != 0) {
					unsigned int j = 0;
					unsigned int mask = 0x8000;
					for(; j < 16; j++) {
						if((temp & mask) != 0) {
							//
							if((sHistory->data)[sHistory->current].buffer[i] & (0x8000 >> j)) {
								sensorHistoryPushHistory(sHistory, 'A' + i, j + 1);
								dirty = 1;
								//baseIOprintf(sHistory->baseIO, "%c%d\n\r", 'A' + i, j + 1);
							}
							
						}
						mask >>= 1;
					}
				}
			}

			if(dirty) {
				sensorHistoryPrint(sHistory);
			}


			sHistory->nextUpdateTime = getTime() + 200;
			sHistory->isIdle = 1;
			((unsigned int *)(sHistory->data + sHistory->current))[5] = 0x0;

			int t = sHistory->current;
			sHistory->current = sHistory->last;
			sHistory->last = t;

			return dirty;
		} else {
			return 0;
		}
	}
}
