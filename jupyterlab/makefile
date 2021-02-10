all: miniconda
	
miniconda_orig: Dockerfile 
	docker build . -t dhl88/jupyterlab_${USER}
					  
miniconda: Dockerfile 
	docker build . -t dhl88/jupyterlab_${USER} \
		       --build-arg USERNAME=${USER} \
		       --build-arg GID=$(shell id -g) \
		       --build-arg USERID=$(shell id -u)  > build.log \
			   & less +F build.log

clean: Dockerfile 
	docker build . --no-cache -t dhl88/jupyterlab_${USER}
