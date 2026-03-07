# You don't want to use -g3 every time!
# -g3 can slow down compilation time and make your final binary bigger.
# Also it leaks all of your source code (especially when using in gdb)
#
CFLAGS	=	-g3

# The code below checks if the shell variable ENV is set to DEV which then adds the -g3 flag.
#
# ifeq ($(ENV), dev)
# 	CFLAGS	+=	-g3
# endif

SRC	=	main.c
OBJ	=	$(SRC:.c=.o)

main:	$(OBJ)
	$(CC) -o main $(OBJ)

clean:
	$(RM) $(OBJ)
	$(RM) main
