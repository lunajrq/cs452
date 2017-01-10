#include <commandHandler.h>
#include <trainIO.h>

#include <trainStatus.h>
#include <trainIO.h>

struct CommandHandler *commandHandler = 0;

void strCpy(char *des, char *origin) {
	int i = 0;
	for(;origin[i] != '\0'; i++) des[i] = origin[i];
	des[i] = '\0';
}

void commandHandlerBootstrap(struct CommandHandler *cHandler) {
	cHandler->handled = 1;
	commandHandler = cHandler;
}

char *parseInt(char *str, int *result) {
	*result = 0;
	int i = 0;
	while(str[i] == ' ') i++;
	for(; str[i] >= '0' && str[i] <= '9'; i++) {
		*result *= 10;
		*result += (str[i] - '0');
	}
	return str + i;
}

int commandHandlerHeartBeat(struct CommandHandler *cHandler) {
	if(cHandler->handled) return 0;

	cHandler->handled = 1;

	switch(cHandler->buffer[0]) {
		case 'q':
			if(cHandler->buffer[1] == '\0') return -2;
			return -1;
		case 't':
			if(cHandler->buffer[1] == 'r') {
				int trainNum, trainSpeed;
				char *next = parseInt(cHandler->buffer + 2, &trainNum);
				parseInt(next, &trainSpeed);
				struct TrainCmd cmd;
				cmd.type = TRAIN_SPEED;
				cmd.arg1 = trainNum;
				cmd.arg2 = trainSpeed;
				pushTrainCmd(getTrainIO(), &cmd);
				setTrainSpeed(getTrainSpeed(), trainNum, trainSpeed);
				return 1;
			}
			return -1;
		case 'r':
			if(cHandler->buffer[1] == 'v') {
				int trainNum, trainSpeed;
				parseInt(cHandler->buffer + 2, &trainNum);
				struct TrainCmd cmd;

				trainSpeed = readTrainSpeed(getTrainSpeed(), trainNum);
				baseIOprintf(getBaseIO(COM2), "%d---PPP", trainSpeed);
				cmd.type = TRAIN_REVERSE;
				cmd.arg1 = trainNum;
				cmd.arg2 = trainSpeed;
				pushTrainCmd(getTrainIO(), &cmd);

				return 1;
			}
			return -1;
		case 's':
			if(cHandler->buffer[1] == 'w') {
				int switchNum;
				char *next = parseInt(cHandler->buffer + 2, &switchNum);
				struct TrainCmd cmd;
				cmd.type = SET_SWITCH;
				cmd.arg1 = switchNum;
				cmd.arg2 = next[1] == 'S' ? 0 : 1;
				pushTrainCmd(getTrainIO(), &cmd);
				setSwitchStatus(getTrainSwitchStatus(), switchNum, cmd.arg2);
				return 1;
			}
			return -1;
		case 'a':
			if(cHandler->buffer[1] == 'S') {
				int i = 1;
				for(; i <= 18; i++) {
					struct TrainCmd cmd;
					cmd.type = SET_SWITCH;
					cmd.arg1 = i;
					cmd.arg2 = 0;
					pushTrainCmd(getTrainIO(), &cmd);
				}
			} else {
				int i = 1;
				for(; i <= 18; i++) {
					struct TrainCmd cmd;
					cmd.type = SET_SWITCH;
					cmd.arg1 = i;
					cmd.arg2 = 1;
					pushTrainCmd(getTrainIO(), &cmd);
				}
			}
			return 1;
		default:
			return -1;
	}

	return 0;
}

void commandHandlerSetCommand(struct CommandHandler *cHandler, char *command) {
	strCpy(cHandler->buffer, command);
	cHandler->handled = 0;
}


struct CommandHandler *getCommandHandler() {
	return commandHandler;
}

