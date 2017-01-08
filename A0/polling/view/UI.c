#include <UI.h>
#include <baseIO.h>
#include <clock.h>
#include <commandPrompt.h>

void initUI(struct UI *ui, struct BaseIO *baseIO) {
	ui->baseIO = baseIO;
	initCommandPrompt(&(ui->commandPrompt), baseIO, 1, 3);
	initClock(&(ui->clock), baseIO, 1, 1);
}

void UIHeartBeat(struct UI *ui) {
	int cmdResult = commandPromptHeartBeat(&ui->commandPrompt);
	int clockResult = clockHeartBeat(&ui->clock);
	if(cmdResult == 1 || clockResult == 1) {
		repositionCursor(&ui->commandPrompt);
	}
}
