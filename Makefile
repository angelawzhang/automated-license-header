all: shell

path = /Users/awzhang/Documents/Makefiles
file = $(wildcard *.txt, *.sh)
variable = $(shell cat tester.sh)

say_hello:
	echo "Hello World"

lol:
ifneq (,$(findstring Apache License, Apache License Hello))
	echo "Found"
endif

test:
	$(foreach filename, $(wildcard $(path)/*), \
	$(if $(findstring Apache License, $(shell cat $(filename))), \
	echo 'test' | cat - $(filename) > temp && mv temp $(filename), \
	echo $(filename)))

test2:
	$(if $(findstring Apache License, $(shell cat $(path))), \
	echo 'test' | cat - $(path) > temp && mv temp $(path), \
	echo $(path))

shell:
	script
