# Docs:
# https://www.gnu.org/software/make/manual/html_node/Parallel.html
# https://www.gnu.org/software/make/manual/html_node/Parallel-Disable.html

all: base notparallel

base: one two three
notparallel: one two three

one two three:
	@sleep 1
	@echo $@

# Uncommenting this out will cause all targets to not be parallel
# .NOTPARALLEL:

# Uncommenting this out will cause only notparallel to not be parallel
# .NOTPARALLEL: notparallel

# The .WAIT before the three will wait for one and two to complete before doing three.
wait: one two .WAIT three
