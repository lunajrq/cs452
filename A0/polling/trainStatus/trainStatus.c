#include <trainStatus.h>
#include <baseIO.h>

#define TRAIN_NUM_MAX 80
#define SINGLE_SWITCH_NUM_MAX 18
#define DOUBLE_SWITCH_NUM_MAX 4

struct TrainSpeed *_trainSpeed = 0;
struct TrainSwitchStatus *_trainSwitchStatus = 0;

void trainSpeedBootstrap(struct TrainSpeed *trainSpeed) {
	int i = 0;
	for(;i <= TRAIN_NUM_MAX; i++) trainSpeed->trainSpeed[i] = 0;
	_trainSpeed = trainSpeed;
}

void TrainSwitchStatusBootstrap(struct TrainSwitchStatus *trainSwitchStatus) {
	int i = 0;
	for(;i <= SINGLE_SWITCH_NUM_MAX; i++) trainSwitchStatus->singleSwitchStatus[i] = 0;
	for(;i <= DOUBLE_SWITCH_NUM_MAX; i++) trainSwitchStatus->doubleSwitchStatus[i] = 0;
	trainSwitchStatus->dirty = 1;

	_trainSwitchStatus = trainSwitchStatus;
}

void setTrainSpeed(struct TrainSpeed *tSpeed, int trainID, int speed) {
	tSpeed->trainSpeed[trainID] = speed;
}

int readTrainSpeed(struct TrainSpeed *tSpeed, int trainID) {
	int temp = * (tSpeed->trainSpeed + trainID);
	return temp;
}

void setSwitchStatus(struct TrainSwitchStatus *trainSwitchStatus, int switchID, int status) {
	trainSwitchStatus->dirty = 1;
	if(switchID >= 100) {
		trainSwitchStatus->doubleSwitchStatus[switchID - 152] = status;
	} else {
		trainSwitchStatus->singleSwitchStatus[switchID] = status;
	}
}

int readSwitchStatus(struct TrainSwitchStatus *trainSwitchStatus, int switchID) {
	if(switchID >= 100) {
		return trainSwitchStatus->doubleSwitchStatus[switchID - 152];
	} else {
		return trainSwitchStatus->singleSwitchStatus[switchID];
	}
}

struct TrainSpeed *getTrainSpeed() {
	return _trainSpeed;
}

struct TrainSwitchStatus *getTrainSwitchStatus() {
	return _trainSwitchStatus;
}
