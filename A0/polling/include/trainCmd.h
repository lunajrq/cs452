#pragma once

enum TrainCmdType { 
	TRAIN_SPEED,
	TRAIN_REVERSE,
	TRAIN_REVERSE_DIRECTION,
	SET_SWITCH,
	CHECK_SENSOR
};

struct TrainCmd {
	enum TrainCmdType type;
	int arg1, arg2;
};
