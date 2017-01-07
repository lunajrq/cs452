 /*
 * iotest.c
 */

#include <baseIO.h>
#include <ts7200.h>

#define FOREVER	for(;;)

int main( int argc, char* argv[] ) {
	bootstrap();

	BaseIO *COM1IO = getBaseIO(COM1);
	BaseIO *COM2IO = getBaseIO(COM2);

	FOREVER {

	}

	return 0;
}

