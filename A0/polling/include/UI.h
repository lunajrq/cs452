
#include <baseIO.h>
#include <clock.h>
#include <commandPrompt.h>
#include <switchTable.h>
#include <sensorHistory.h>

struct UI {
	struct BaseIO *baseIO;
	int currentCursorLeft, currentCursorTop;
	// UI elements
	struct CommandPrompt commandPrompt;
	struct Clock clock;
	struct SwitchTable sTable;
	struct SensorHistory sHistory;
};

void initUI(struct UI *ui, struct BaseIO *baseIO);
void UIHeartBeat(struct UI *ui);

