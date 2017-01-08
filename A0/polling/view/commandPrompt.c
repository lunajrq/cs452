#include <commandPrompt.h>
#include <baseIO.h>
#include <cursorAddressing.h>

void initCommandStr(struct CommandStr *commandStr) {
	commandStr->currentCursor = 0;
	commandStr->length = 0;
	commandStr->str[0] = '\0';
}

void commandStrPush(struct CommandStr *commandStr, char c) {
	commandStr->str[commandStr->length] = c;
	commandStr->length++;
	commandStr->str[commandStr->length] = '\0';
}

void initCommandPrompt(struct CommandPrompt *cp, struct BaseIO *baseIO, int left, int top) {
	cp->left = left;
	cp->top = top;
	cp->currentCommand = cp->commandHistory;
	cp->currentDisplayCommand = cp->commandHistory;
	cp->baseIO = baseIO;
	initCommandStr(cp->currentCommand);

	IO_POS(cp->baseIO, cp->top, cp->left);
	baseIOprintf(cp->baseIO, "$ ");
}

int commandPromptHeartBeat(struct CommandPrompt *cp) {
	char c;
	if(readChar(cp->baseIO, &c) == -1) {
		return 0;
	}

	if(c == '\n') {

		return 1;
	}


	commandStrPush(cp->currentCommand, c);

	IO_POS(cp->baseIO, cp->top, cp->left + 2);
	writeStr(cp->baseIO, cp->currentCommand->str);

	return 1;
}

void repositionCursor(struct CommandPrompt *cp) {
	IO_POS(cp->baseIO, cp->top, cp->left + 2 + cp->currentCommand->length);
}
