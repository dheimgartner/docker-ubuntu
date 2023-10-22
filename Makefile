CONTAINER = sshubuntu

.PHONY: install start attach stop ssh-connect rm

install:
	bash ./scripts/install.sh

start:
	docker start $(CONTAINER)

attach:
	docker exec -u sshuser -it $(CONTAINER) /bin/bash

stop:
	docker stop $(CONTAINER)

ssh-connect:
	ssh sshuser@localhost -p 2022

rm:
	docker rm $(CONTAINER)