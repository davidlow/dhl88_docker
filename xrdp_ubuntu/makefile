all: xrdp

xrdp: Dockerfile 
	docker build . -t dhl88/xrdp_ubuntu

clean: Dockerfile 
	docker build . --no-cache -t dhl88/xrdp_ubuntu
