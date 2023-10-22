CONTAINER = sshubuntu

default: help

.PHONY: help install rm

help:
	bash ./scripts/help.sh

install:
	bash ./scripts/install.sh

rm:
	docker rm $(CONTAINER)