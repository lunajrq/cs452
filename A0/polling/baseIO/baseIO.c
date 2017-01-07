#include <baseIO.h>
#include <ts7200.h>


struct BaseIO *COM1IO = 0, *COM2IO = 0;

/*
 * The UARTs are initialized by RedBoot to the following state
 * 	115,200 bps
 * 	8 bits
 * 	no parity
 * 	fifos enabled
 */
int baseIOsetfifo( int channel, int state ) {
	int *line, buf;
	switch( channel ) {
	case COM1:
		line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
	        break;
	case COM2:
	        line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
	        break;
	default:
	        return -1;
	        break;
	}
	buf = *line;
	buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
	*line = buf;
	return 0;
}

void baseIOBootstrap(struct BaseIO *com1, struct BaseIO *com2) {
	COM1IO = com1;
	COM2IO = com2;

	// bootstrap COM1IO
	COM1IO->channel = COM1;

	COM1IO->writeBufferStart = COM1IO->writeBuffer;
	COM1IO->writeBufferEnd = COM1IO->writeBufferStart;
	COM1IO->writeBufferSize = 0;

	COM1IO->readBufferStart = COM1IO->readBuffer;
	COM1IO->readBufferEnd = COM1IO->readBufferStart;
	COM1IO->readBufferSize = 0;

	COM1IO->flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
	COM1IO->data = (int *)( UART1_BASE + UART_DATA_OFFSET );

	// bootstrap COM2IO
	baseIOsetfifo(COM2, OFF);
	COM2IO->channel = COM2;

	COM2IO->writeBufferStart = COM2IO->writeBuffer;
	COM2IO->writeBufferEnd = COM2IO->writeBufferStart;
	COM2IO->writeBufferSize = 0;

	COM2IO->readBufferStart = COM2IO->readBuffer;
	COM2IO->readBufferEnd = COM2IO->readBufferStart;
	COM2IO->readBufferSize = 0;

	COM2IO->flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
	COM2IO->data = (int *)( UART2_BASE + UART_DATA_OFFSET );
}

struct BaseIO* getBaseIO(int channel) {
	if(channel == COM1) {
		return COM1IO;
	}

	if(channel == COM2) {
		return COM2IO;
	}

	return 0;
}

int writeChar(struct BaseIO *baseIO, char c) {
	if(baseIO->writeBufferSize == WRITE_BUFFER_SIZE) {
		// buffer is full
		return -1;
	}

	*(baseIO->writeBufferEnd) = c;
	baseIO->writeBufferEnd++;
	baseIO->writeBufferSize++;
	if(baseIO->writeBufferEnd > baseIO->writeBuffer + WRITE_BUFFER_SIZE) {
		baseIO->writeBufferEnd = baseIO->writeBuffer;
	}

	return 0;
}

int writeStr(struct BaseIO *baseIO, char *str) {
	int i = 0;
	while(str[i] != '\0') {
		int result = writeChar(baseIO, str[i]);
		if(result == -1) return -1;
		i++;
	}
	return 0;
}

int readChar(struct BaseIO *baseIO, char *c) {
	if(baseIO->readBufferSize == 0) {
		return -1;
	}

	*c = *(baseIO->readBufferStart);
	baseIO->readBufferStart++;
	baseIO->readBufferSize--;
	if(baseIO->readBufferStart > baseIO->readBuffer + READ_BUFFER_SIZE) {
		baseIO->readBufferStart = baseIO->readBuffer;
	}

	return 0;
}

int buffer2port(struct BaseIO *baseIO) {
	if( baseIO->writeBufferSize != 0 && !( *(baseIO->flags) & TXFF_MASK ) ) {
		*(baseIO->data) = *baseIO->writeBufferStart;
		baseIO->writeBufferStart++;
		baseIO->writeBufferSize--;
		if(baseIO->writeBufferStart > baseIO->writeBuffer + WRITE_BUFFER_SIZE) {
			baseIO->writeBufferStart = baseIO->writeBuffer;
		}
		return 1;
	}
	
	return 0;
}

int port2buffer(struct BaseIO *baseIO) {
	if( baseIO->readBufferSize != READ_BUFFER_SIZE && ( *(baseIO->flags) & RXFF_MASK ) ) {
		*baseIO->readBufferEnd = *(baseIO->data);
		baseIO->readBufferEnd++;
		baseIO->readBufferSize++;
		if(baseIO->readBufferEnd > baseIO->readBuffer + READ_BUFFER_SIZE) {
			baseIO->readBufferEnd = baseIO->readBuffer;
		}
		return 1;
	}
	
	return 0;
}
