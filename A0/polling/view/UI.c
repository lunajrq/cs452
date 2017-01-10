#include <UI.h>
#include <baseIO.h>
#include <clock.h>
#include <commandPrompt.h>
#include <sensorHistory.h>

void initUI(struct UI *ui, struct BaseIO *baseIO) {
	ui->baseIO = baseIO;
	initCommandPrompt(&(ui->commandPrompt), baseIO, 1, 27);
	initClock(&(ui->clock), baseIO, 1, 1);
	initSwitchTable(&(ui->sTable), baseIO, 1, 3);
	initSensorHistory(&(ui->sHistory), baseIO, 1, 30);
}

void UIHeartBeat(struct UI *ui) {
	int clockResult = clockHeartBeat(&ui->clock);
	int commandResult = commandPromptHeartBeat(&ui->commandPrompt);
	int sTableResult = switchTableHeartBeat(&ui->sTable);
	sensorHistoryBootstrap(&ui->sHistory);
	if(clockResult == 1 || commandResult == 1 || sTableResult == 1) {
		repositionCursor(&ui->commandPrompt);
	}
}
