all: xrdp

xrdp: Dockerfile 
	docker build . -t dhl88/nomachine_server_ubuntu

clean: Dockerfile 
	docker build . --no-cache -t dhl88/nomachine_server_ubuntu
