# Starting off, I would like to say that there are many reasons as to not use wildcards.
# GNU automake (A Makefile generator) doesn't recommend using wildcards for your projects.
# https://www.gnu.org/software/automake/manual/html_node/Wildcards.html
#
# TL;DR:
# - Wildcards make it easy to forget files
# - Wildcards can get files by mistake
# - They might not be portable to non GNU Make software
#
# Yet if you still want to do wildcards, here's how.

# This is discouraged and unsupported, do not use raw wildcards like this.
SRC	:=	src/*.c

# This is better, it uses the wildcard function from GNU Make
# However it doesn't take into account sub-folders.
# SRC	:=	$(wildcard src/*.c)

# This is the best, it uses the find binary which should be available in most distros.
# It also takes into account sub-folders. And the `-type f` assures that it's not anything else than a file.
# SRC	:=	$(shell find src -name *.c -type f)

all:
	@echo $(SRC)
