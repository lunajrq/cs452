#define WRITE_BUFFER_SIZE	512
#define READ_BUFFER_SIZE	512

#define COM1	0
#define COM2	1

struct BaseIO {
	int channel,

	// write buffer
	char[WRITE_BUFFER_SIZE] writeBuffer;
	char *writeBufferStart;
	char *writeBufferEnd;

	// read buffer
	char[READ_BUFFER_SIZE] readBuffer;
	char *readBufferStart;
	char *readBufferEnd;


};


BaseIO* getBaseIO(int channel);

// write char and read char is from user point of view
int writeChar(BaseIO *baseIO, char c);
char readChar(BaseIO *baseIO);

// 
int buffer2port(BaseIO *baseIO);


void cleanUpBaseIO();
