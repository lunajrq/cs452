
#include <baseIO.h>
#include <clock.h>
#include <commandPrompt.h>

struct UI {
	struct BaseIO *baseIO;
	int currentCursorLeft, currentCursorTop;
	// UI elements
	struct CommandPrompt commandPrompt;
	struct Clock clock;
};

void initUI(struct UI *ui, struct BaseIO *baseIO);
void UIHeartBeat(struct UI *ui);

