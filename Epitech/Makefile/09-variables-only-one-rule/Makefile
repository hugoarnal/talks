DATA	:=	"Hello"

all:	DATA	+=	"world!"
all:	rule1
	@echo "All:"
	@echo $(DATA)

rule1:
	@echo "rule1:"
	@echo $(DATA)

rule2:
	@echo $(DATA)
	@echo $(TEST)

rule3:	TEST	:=	"This is a test"
rule3:
	@echo $(TEST)
