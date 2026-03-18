# You can include other Makefiles in your Makefile, however it will override
# the order that your rules are executed in.
#
# In other words: foo.mk's foo becomes the default goal.
FOO_MK	:=	foo.mk

include $(FOO_MK)

# If you wish to include a makefile that does not exist yet (not recommended):
#
# -include b.mk

# You cannot have two rules called the same, it will simply ignore the baz.mk's all rule.
#
# include baz.mk

all:
	echo "Yo"

bar:
	echo $(BAR)
