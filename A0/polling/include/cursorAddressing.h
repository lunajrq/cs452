

#define IO_ESC 27

#define IO_POS(channel,row,col) baseIOprintf(channel,"%c[%d;%dH",IO_ESC,row,col)
