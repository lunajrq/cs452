#pragma once

#include <baseIO.h>
#include <trainCmd.h>

#define TRAIN_CMD_BUFFER_SIZE 30

#define TRAIN_IO_INTERVAL 50


struct TrainIO {
	struct BaseIO *baseIO;

	struct TrainCmd trainCmdBuffer[TRAIN_CMD_BUFFER_SIZE];
	int trainCmdBufferStart, trainCmdBufferEnd;
	int trainCmdBufferLength;

	struct TrainCmd defferedTrainCmd;
	unsigned int defferedTime;
	int defferedHandled;

	unsigned int lastSendTime;

	int packageLeft;
	unsigned int *sensorBuffer;
	
	unsigned int baseIOFinishTime;
};

void trainIOBootstrap(struct TrainIO *trainIO, struct BaseIO *baseIO);
//struct TrainIO *getTrainIO();
int pushTrainCmd(struct TrainIO *trainIO, struct TrainCmd *trainCmd);
int trainIOHeartBeat(struct TrainIO *trainIO);
struct TrainIO *getTrainIO();
