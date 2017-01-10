#pragma once


#define TRAIN_NUM_MAX 80
#define SINGLE_SWITCH_NUM_MAX 18
#define DOUBLE_SWITCH_NUM_MAX 4

struct TrainSpeed {
	int trainSpeed[TRAIN_NUM_MAX + 1];
};

struct TrainSwitchStatus {
	char singleSwitchStatus[SINGLE_SWITCH_NUM_MAX + 1];
	char doubleSwitchStatus[DOUBLE_SWITCH_NUM_MAX + 1];

	int dirty;
};

void trainSpeedBootstrap(struct TrainSpeed *trainSpeed);
void TrainSwitchStatusBootstrap(struct TrainSwitchStatus *trainSwitchStatus);
void setTrainSpeed(struct TrainSpeed *trainSpeed, int trainID, int speed);
int readTrainSpeed(struct TrainSpeed *trainSpeed, int trainID);
void setSwitchStatus(struct TrainSwitchStatus *trainSwitchStatus, int switchID, int status);
int readSwitchStatus(struct TrainSwitchStatus *trainSwitchStatus, int switchID);
struct TrainSpeed *getTrainSpeed();
struct TrainSwitchStatus *getTrainSwitchStatus();
