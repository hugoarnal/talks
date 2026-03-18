SRC	=	say.c main.c

# Using implicit rule to create our object files.
# We're essentially saying that our .c should match our .o (.c file == .o file)
OBJ	=	$(SRC:.c=.o)

all: main

main: $(OBJ)
	$(CC) -o main $(OBJ)

# You can override an implicit rule like this
#	$@ = %.o part
#	$< = First element in the %.c part
#	$^ = All elements in the %.c part

# Uncomment right below:
#
# %.o: %.c
# 	echo "This is an overriden implicit rule!"
# 	$(CC) -c -o $@ $^

clean:
	$(RM) $(OBJ)
	$(RM) main
