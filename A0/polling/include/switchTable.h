#include <baseIO.h>

struct SwitchTable {
	struct BaseIO *baseIO;
	int left, top;
};

void initSwitchTable(struct SwitchTable *sTable, struct BaseIO *baseIO, int left, int top);
int switchTableHeartBeat(struct SwitchTable *sTable);
