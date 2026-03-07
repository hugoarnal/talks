# Implicit rules use their own variables to define flags inside.
# CFLAGS for warnings & other
# CPPFLAGS for include flags (-I, -iquote)
# LDFLAGS for linker flags (-L ./lib)
# LDLIBS for linker libraries (-lmy)
#
# Fix this by uncommenting here
# CFLAGS	=	-Wall

SRC	=	say.c main.c
OBJ	=	$(SRC:.c=.o)

all: main

main: $(OBJ)
#	-Wall here has no effect, it's not computed during linking
# 	Changing the arguments order has no impact ;-)
	$(CC) -Wall -o main $(OBJ)

clean:
	$(RM) $(OBJ)
	$(RM) main
