#include <commandPrompt.h>
#include <baseIO.h>
#include <cursorAddressing.h>

void initCommandStr(struct CommandStr *commandStr) {
	commandStr->currentCursor = 0;
	commandStr->length = 0;
	commandStr->str[0] = '\0';
}

void commandStrPush(struct CommandStr *commandStr, char c) {
	if(commandStr->length == COMMAND_LINE_LIMIT) return;
	commandStr->str[commandStr->length] = c;
	commandStr->length++;
	commandStr->str[commandStr->length] = '\0';
}

void commandStrPop(struct CommandStr *commandStr) {
	if(commandStr->length == 0) return;
	commandStr->length--;
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
		// copy string out
		initCommandStr(cp->currentCommand);
		return 1;
	} else if(c == '\b') {
		commandStrPop(cp->currentCommand);
		IO_POS(cp->baseIO, cp->top, cp->left + cp->currentCommand->length);
		writeChar(cp->baseIO, ' ');
		return 1;
	} else {
		commandStrPush(cp->currentCommand, c);

		IO_POS(cp->baseIO, cp->top, cp->left + cp->currentCommand->length - 1);
		writeChar(cp->baseIO, cp->currentCommand->str[cp->currentCommand->length - 1]);

		return 1;
	}

	return 0;

}

void repositionCursor(struct CommandPrompt *cp) {
	IO_POS(cp->baseIO, cp->top, cp->left + 2 + cp->currentCommand->length);
}
