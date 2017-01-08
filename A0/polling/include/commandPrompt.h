#pragma once


#include <baseIO.h>


#define COMMAND_LINE_LIMIT 20
#define COMMAND_HISTORY_SIZE 10

struct CommandStr {
	int currentCursor;
	int length;
	char str[COMMAND_LINE_LIMIT + 1];
};

struct CommandPrompt {
	int left, top;
	struct CommandStr commandHistory[COMMAND_HISTORY_SIZE];
	struct CommandStr *currentCommand;
	struct CommandStr *currentDisplayCommand;

	struct BaseIO *baseIO;
};

void initCommandPrompt(struct CommandPrompt *cp, struct BaseIO *baseIO, int left, int top);
int commandPromptHeartBeat(struct CommandPrompt *cp);
void repositionCursor(struct CommandPrompt *cp);
