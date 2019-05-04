all: miniconda
	
miniconda_orig: Dockerfile 
	docker build . -t dhl88/miniconda 
					  
miniconda: Dockerfile 
	docker build . -t dhl88/miniconda --build-arg USERNAME=${USER} \
					  --build-arg GID=$(shell id -g) \
					  --build-arg USERID=$(shell id -u) 

clean: Dockerfile 
	docker build . --no-cache -t dhl88/miniconda
