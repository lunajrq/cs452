#include <trainIO.h>
#include <baseIO.h>
#include <ts7200.h>
#include <timer.h>

struct TrainIO *_trainIO = 0;

void trainIOBootstrap(struct TrainIO *trainIO, struct BaseIO *baseIO) {
	trainIO->baseIO = baseIO;
	trainIO->trainCmdBufferStart = 0;
	trainIO->trainCmdBufferEnd = 0;
	trainIO->trainCmdBufferLength = 0;
	_trainIO = trainIO;
	trainIO->defferedHandled = 1;

	trainIO->lastSendTime = 0;
}

//struct TrainIO *getTrainIO();
int pushTrainCmd(struct TrainIO *trainIO, struct TrainCmd *trainCmd) {
	if(trainIO->trainCmdBufferLength == TRAIN_CMD_BUFFER_SIZE) {
		return -1;
	}

	trainIO->trainCmdBuffer[trainIO->trainCmdBufferEnd].type = trainCmd->type;
	trainIO->trainCmdBuffer[trainIO->trainCmdBufferEnd].arg1 = trainCmd->arg1;
	trainIO->trainCmdBuffer[trainIO->trainCmdBufferEnd].arg2 = trainCmd->arg2;
	trainIO->trainCmdBufferLength++;
	trainIO->trainCmdBufferEnd++;
	if(trainIO->trainCmdBufferEnd >= TRAIN_CMD_BUFFER_SIZE) {
		trainIO->trainCmdBufferEnd = 0;
	}

	return 1;
}

int sendSetTrainSpeed(struct TrainIO *trainIO, int trainID, int speed) {
	baseIOprintf(trainIO->baseIO, "%c%c", speed, trainID);
	return 1;
}

int sendSetTrainReverse(struct TrainIO *trainIO, int trainID, int speed) {
	baseIOprintf(trainIO->baseIO, "%c%c", 0x0, trainID);
	trainIO->defferedHandled = 0;
	trainIO->defferedTrainCmd.type = TRAIN_REVERSE_DIRECTION;
	trainIO->defferedTrainCmd.arg1 = trainID;
	trainIO->defferedTrainCmd.arg2 = speed;
	trainIO->defferedTime = getTime() + 3000;
	return 1;
}

int sendSetTrainReverseDirection(struct TrainIO *trainIO, int trainID, int speed) {
	baseIOprintf(trainIO->baseIO, "%c%c", 0xF, trainID);
	trainIO->defferedTrainCmd.type = TRAIN_SPEED;
	trainIO->defferedTrainCmd.arg1 = trainID;
	trainIO->defferedTrainCmd.arg2 = speed;
	pushTrainCmd(trainIO, &(trainIO->defferedTrainCmd));
	return 1;
}

int sendSetSwitch(struct TrainIO *trainIO, int switchID, int switchStatus) {
	if(switchStatus == 0) {
		// set Stright
		baseIOprintf(trainIO->baseIO, "%c%c", 0x21, switchID);
	} else {
		// set Curve
		baseIOprintf(trainIO->baseIO, "%c%c", 0x22, switchID);
	}
	return 1;
}

int sendReadSensor(struct TrainIO *trainIO, unsigned int *buffer) {
	// always read first 5 modules (Too Lazy!!!)
	// Signal it NOT done
	int i = 0;
	for(;i < 6; i++) buffer[5] = 0x0;
	trainIO->sensorBuffer = buffer;
	trainIO->packageLeft = 10;
	// send request
	baseIOprintf(trainIO->baseIO, "%c%c", 0xC, 0x85);

	return 1;
}

int sendTrainCmd(struct TrainIO *trainIO, struct TrainCmd *trainCmd) {
	switch(trainCmd->type) {
		case TRAIN_SPEED:
			return sendSetTrainSpeed(trainIO, trainCmd->arg1, trainCmd->arg2);
		case TRAIN_REVERSE:
			return sendSetTrainReverse(trainIO, trainCmd->arg1, trainCmd->arg2);
		case TRAIN_REVERSE_DIRECTION:
			return sendSetTrainReverseDirection(trainIO, trainCmd->arg1, trainCmd->arg2);
		case SET_SWITCH:
			return sendSetSwitch(trainIO, trainCmd->arg1, trainCmd->arg2);
		case CHECK_SENSOR:
			return sendReadSensor(trainIO, (unsigned int *)trainCmd->arg1);
		default:
			return -1;
	}

	return -1;
}




int trainIOHeartBeat(struct TrainIO *trainIO) {
	
	if(trainIO->packageLeft > 0) {
		// reading from com1
		char c;
		if(readChar(trainIO->baseIO, &c) != -1) {
			trainIO->packageLeft--;
			trainIO->sensorBuffer[(10 - trainIO->packageLeft)/2] <<= 8;
			trainIO->sensorBuffer[(10 - trainIO->packageLeft)/2] |= c;

			if(trainIO->packageLeft == 0) {
				// signal finish
				trainIO->sensorBuffer[5] = 1;
			}
		}
	}



	unsigned int currentTime = getTime();
	if(currentTime < trainIO->lastSendTime + TRAIN_IO_INTERVAL) return 0;
	if(!trainIO->defferedHandled && currentTime > trainIO->defferedTime) {
		sendTrainCmd(trainIO, &(trainIO->defferedTrainCmd));
		trainIO->defferedHandled = 1;
		trainIO->lastSendTime = getTime();
		return 1;
	}

	if(trainIO->trainCmdBufferLength == 0) return 0;

	sendTrainCmd(trainIO, trainIO->trainCmdBuffer + trainIO->trainCmdBufferStart);
	trainIO->lastSendTime = getTime();
	trainIO->trainCmdBufferLength--;
	trainIO->trainCmdBufferStart++;
	if(trainIO->trainCmdBufferStart >= TRAIN_CMD_BUFFER_SIZE) {
		trainIO->trainCmdBufferStart = 0;
	}

	return 1;
}

struct TrainIO *getTrainIO() {
	return _trainIO;
}

