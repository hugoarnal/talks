# This can get ugly really fast. Especially if you're limited to 80 columns ;)
SRC	:=	code.c main.c x0.c x1.c x2.c x3.c x4.c x5.c x6.c x7.c x8.c x9.c x10.c x11.c x12.c x13.c x14.c x15.c x16.c x17.c x18.c x19.c x20.c x21.c

# Much better!
#
# SRC :=  code.c \
# 		main.c \
# 		x0.c \
# 		x1.c \
# 		x2.c \
# 		x3.c \
# 		x4.c \
# 		x5.c \
# 		x6.c \
# 		x7.c \
# 		x8.c \
# 		x9.c \
# 		x10.c \
# 		x11.c \
# 		x12.c \
# 		x13.c \
# 		x14.c \
# 		x15.c \
# 		x16.c \
# 		x17.c \
# 		x18.c \
# 		x19.c \
# 		x20.c \
# 		x21.c

all:
	@echo $(SRC)

# Multiline statements can also apply to rules!

rule1:
	@echo "Nothing to look at here!"

rule2:
	@echo "Nothing to look at here!"

rule3:
	@echo "Nothing to look at here!"

.PHONY: run-rules
run-rules:	rule1 \
			rule2 \
			rule3
	@echo "Ran all rules!"
