#pragma once


#define COMMAND_HANDLER_BUFFER_SIZE 30


struct CommandHandler {
	int handled;
	char buffer[COMMAND_HANDLER_BUFFER_SIZE + 1];
};

void commandHandlerBootstrap(struct CommandHandler *cHandler);
int commandHandlerHeartBeat(struct CommandHandler *cHandler);
void commandHandlerSetCommand(struct CommandHandler *cHandler, char *command);
struct CommandHandler *getCommandHandler();


