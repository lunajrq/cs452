#include <switchTable.h>
#include <trainStatus.h>
#include <baseIO.h>
#include <cursorAddressing.h>

void initSwitchTable(struct SwitchTable *sTable, struct BaseIO *baseIO, int left, int top) {
	sTable->baseIO = baseIO;
	sTable->left = left;
	sTable->top = top;
}

int switchTableHeartBeat(struct SwitchTable *sTable) {
	struct TrainSwitchStatus *tsStatus= getTrainSwitchStatus();
	if(tsStatus->dirty) {
		tsStatus->dirty = 0;
		int i = 1;
		IO_POS(sTable->baseIO, sTable->top, sTable->left);
		baseIOprintf(sTable->baseIO, "SWITCHID|  STATUS\n\r", i);
		for(; i <= SINGLE_SWITCH_NUM_MAX; i++) {
			baseIOprintf(sTable->baseIO, "   %d\t|", i);
			if(readSwitchStatus(getTrainSwitchStatus(), i)) {
				baseIOprintf(sTable->baseIO, "  Curved \n\r");
			} else {
				baseIOprintf(sTable->baseIO, " Straight\n\r");
			}
			
		}
		i = 1;
		for(; i <= DOUBLE_SWITCH_NUM_MAX; i++) {
			baseIOprintf(sTable->baseIO, "  %d\t|", 152 + i);
			if(readSwitchStatus(getTrainSwitchStatus(), 152 + i)) {
				baseIOprintf(sTable->baseIO, "  Curved \n\r");
			} else {
				baseIOprintf(sTable->baseIO, " Straight\n\r");
			}
			
		}
		return 1;
	}

	return 0;
}

