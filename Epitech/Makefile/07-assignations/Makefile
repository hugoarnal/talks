# Running make will show two different dates here
DATA	=	$(shell date)

# Using the simple assignment operator := (also known walrus operator)
# DATA	:=	$(shell date)

all: data1 data2

data1:
	@echo $(DATA)
	@sleep 2

data2:
	@echo $(DATA)

OTHER_DATA	:=	"Hello,"
# There's also the appending operator += that we have seen just before
OTHER_DATA	+=	"world!"

data3:
	@echo $(OTHER_DATA)

# And finally the conditional assignment operator ?=
# Can be used with the CC variable for example
LAST_DATA	?=	"I'm new!"

data4:
	@echo $(LAST_DATA)

# This stackoverflow post has more about this issue:
# https://stackoverflow.com/questions/4879592/whats-the-difference-between-and-in-makefile

# Make manual about all of this:
# https://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors
