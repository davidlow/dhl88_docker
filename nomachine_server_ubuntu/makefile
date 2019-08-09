all: nomachine

nomachine: Dockerfile nxserver.sh
	docker build . -t dhl88/nomachine_server_ubuntu_${USER}  \
					--build-arg USERNAME=${USER} \
					--build-arg GID=$(shell id -g) \
					--build-arg USERID=$(shell id -u) > build.log \
					& less +F build.log
