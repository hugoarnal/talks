# Did you know that ar has implicit rules in Makefile? Me neither!
#
# archive(foo.o) expands to:
# ar -rv archive foo.o

all:	foo.o	archive(foo.o)

foo.o:	foo.c
