all: nomachine

nomachine: Dockerfile 
	docker build . -t dhl88/nomachine_server_ubuntu  \
					--build-arg USERNAME=${USER} \
					--build-arg GID=$(shell id -g) \
					--build-arg USERID=$(shell id -u) | less
