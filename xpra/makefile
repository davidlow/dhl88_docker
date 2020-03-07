all: xpra
	
xpra: Dockerfile 
	docker build . -t dhl88/xpra_${USER} \
		       --build-arg USERNAME=${USER} \
		       --build-arg GID=$(shell id -g) \
		       --build-arg USERID=$(shell id -u)  > build.log \
			   & less +F build.log

