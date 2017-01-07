#include <baseIO.h>
#include <ts7200.h>


BaseIO *COM1IO = 0, *COM2IO = 0;

BaseIO* getBaseIO(int channel) {
	if(channel == COM1) {
		if(COM1IO == 0) {
			COM1IO = malloc(sizeof(BaseIO));
			COM1IO->channel = COM1;

			COM1IO->writeBufferStart = &(COM1IO->writeBuffer);
			COM1IO->writeBufferEnd = COM1IO->writeBufferStart;

			COM1IO->readBufferStart = &(COM1IO->readBuffer);
			COM1IO->readBufferEnd = COM1IO->readBufferStart;
		}
		return COM1IO;
	}

	if(channel == COM2) {
		if(COM2IO == 0) {
			COM2IO = malloc(sizeof(BaseIO));
			COM2IO->channel = COM2;

			COM2IO->writeBufferStart = &(COM2IO->writeBuffer);
			COM2IO->writeBufferEnd = COM2IO->writeBufferStart;

			COM2IO->readBufferStart = &(COM2IO->readBuffer);
			COM2IO->readBufferEnd = COM2IO->readBufferStart;
		}
		return COM2IO;
	}
}

int writeChar(BaseIO *baseIO, char c) {
	if(BaseIO->writeBufferStart == BaseIO->writeBufferEnd) {
		// buffer is full
		return -1;
	}

	*(BaseIO->writeBufferEnd) = c;
	BaseIO->writeBufferEnd++;
	if(BaseIO->writeBufferEnd > &(BaseIO->writeBuffer) + WRITE_BUFFER_SIZE) {
		BaseIO->writeBufferEnd = &(BaseIO->writeBuffer);
	}

	return 0;
}

char readChar(BaseIO *baseIO) {
	return 'c';
}

int buffer2port(BaseIO *baseIO) {
	int *flags, *data;
	switch( baseIO->channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	if( ( *flags & TXFF_MASK ) ) {
		*data = *(baseIO->writeBufferStart);
		baseIO->writeBufferStart++;
		if(BaseIO->writeBufferStart > &(BaseIO->writeBuffer) + WRITE_BUFFER_SIZE) {
			BaseIO->writeBufferStart = &(BaseIO->writeBuffer);
		}
		return 1;
	}
	
	return 0;
}

void cleanUpBaseIO() {
	if(COM1IO) {
		free(COM1IO);
		COM1IO = 0;
	}
	if(COM2IO) {
		free(COM2IO);
		COM2IO = 0;
	}
}

