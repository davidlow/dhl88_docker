all: miniconda
	
miniconda_orig: Dockerfile 
	docker build . -t dhl88/miniconda_${USER}
					  
miniconda: Dockerfile 
	docker build . -t dhl88/miniconda_${USER} \
		       --build-arg USERNAME=${USER} \
		       --build-arg GID=$(shell id -g) \
		       --build-arg USERID=$(shell id -u) 

clean: Dockerfile 
	docker build . --no-cache -t dhl88/miniconda
