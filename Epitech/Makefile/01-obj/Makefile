# Gathering source files
SRC	=	say.c main.c

# Gathering our object files after compilation
OBJ	=	say.o main.o

all: main

# Calls for say.o and main.o individually then runs the rest of the rule
main: $(OBJ)
	$(CC) -o main $(OBJ)

# Putting the .c after the rule indicates that this .o is linked to this .c file
# -c creates object files
say.o: say.c
	$(CC) -c -o say.o say.c
main.o: main.c
	$(CC) -c -o main.o main.c

clean:
	$(RM) $(OBJ)
	$(RM) main
