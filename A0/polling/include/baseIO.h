#define WRITE_BUFFER_SIZE	512
#define READ_BUFFER_SIZE	512

#define COM1	0
#define COM2	1

#define ON	1
#define OFF	0

struct BaseIO {
	int channel;

	// write buffer
	char writeBuffer[WRITE_BUFFER_SIZE];
	char *writeBufferStart;
	char *writeBufferEnd;
	int writeBufferSize;

	// read buffer
	char readBuffer[READ_BUFFER_SIZE];
	char *readBufferStart;
	char *readBufferEnd;
	int readBufferSize;

	// caching constant
	int *flags;
	int *data;
};

void baseIOBootstrap(struct BaseIO *com1, struct BaseIO *com2);

struct BaseIO *getBaseIO(int channel);

// write char and read char is from user point of view
int writeChar(struct BaseIO *baseIO, char c);
int writeStr(struct BaseIO *baseIO, char *str);
int readChar(struct BaseIO *baseIO, char *c);

// 
int buffer2port(struct BaseIO *baseIO);
int port2buffer(struct BaseIO *baseIO);
