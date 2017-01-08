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
	if(baseIO->writeBufferEnd >= baseIO->writeBuffer + WRITE_BUFFER_SIZE) {
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
	if(baseIO->readBufferStart >= baseIO->readBuffer + READ_BUFFER_SIZE) {
		baseIO->readBufferStart = baseIO->readBuffer;
	}

	return 0;
}

int buffer2port(struct BaseIO *baseIO) {
	if( baseIO->writeBufferSize != 0 && !( *(baseIO->flags) & TXFF_MASK ) ) {
		*(baseIO->data) = *baseIO->writeBufferStart;
		baseIO->writeBufferStart++;
		baseIO->writeBufferSize--;
		if(baseIO->writeBufferStart >= baseIO->writeBuffer + WRITE_BUFFER_SIZE) {
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
		if(baseIO->readBufferEnd >= baseIO->readBuffer + READ_BUFFER_SIZE) {
			baseIO->readBufferEnd = baseIO->readBuffer;
		}
		return 1;
	}
	
	return 0;
}





/////////////////////



char c2x( char ch ) {
	if ( (ch <= 9) ) return '0' + ch;
	return 'a' + ch - 10;
}

int baseIOputx( struct BaseIO *baseIO, char c ) {
	char chh, chl;

	chh = c2x( c / 16 );
	chl = c2x( c % 16 );
	writeChar( baseIO, chh );
	return writeChar( baseIO, chl );
}

int baseIOputr( struct BaseIO *baseIO, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) baseIOputx( baseIO, ch[byte] );
	return writeChar( baseIO, ' ' );
}

int baseIOputstr( struct BaseIO *baseIO, char *str ) {
	while( *str ) {
		if( writeChar( baseIO, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void baseIOputw( struct BaseIO *baseIO, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) writeChar( baseIO, fc );
	while( ( ch = *bf++ ) ) writeChar( baseIO, ch );
}

int baseIOa2d( char ch ) {
	if( ch >= '0' && ch <= '9' ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}

char baseIOa2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = baseIOa2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void baseIOui2a( unsigned int num, unsigned int base, char *bf ) {
	int n = 0;
	int dgt;
	unsigned int d = 1;
	
	while( (num / d) >= base ) d *= base;
	while( d != 0 ) {
		dgt = num / d;
		num %= d;
		d /= base;
		if( n || dgt > 0 || d == 0 ) {
			*bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
			++n;
		}
	}
	*bf = 0;
}

void baseIOi2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	baseIOui2a( num, 10, bf );
}

void baseIOformat ( struct BaseIO *baseIO, char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			writeChar( baseIO, ch );
		else {
			lz = 0; w = 0;
			ch = *(fmt++);
			switch ( ch ) {
			case '0':
				lz = 1; ch = *(fmt++);
				break;
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				ch = baseIOa2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				writeChar( baseIO, va_arg( va, char ) );
				break;
			case 's':
				baseIOputw( baseIO, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				baseIOui2a( va_arg( va, unsigned int ), 10, bf );
				baseIOputw( baseIO, w, lz, bf );
				break;
			case 'd':
				baseIOi2a( va_arg( va, int ), bf );
				baseIOputw( baseIO, w, lz, bf );
				break;
			case 'x':
				baseIOui2a( va_arg( va, unsigned int ), 16, bf );
				baseIOputw( baseIO, w, lz, bf );
				break;
			case '%':
				writeChar( baseIO, ch );
				break;
			}
		}
	}
}

void baseIOprintf( struct BaseIO *baseIO, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        baseIOformat( baseIO, fmt, va );
        va_end(va);
}
