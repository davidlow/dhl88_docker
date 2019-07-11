all: java
	
java: Dockerfile 
	docker build . -t dhl88/java_${USER} \
					  --build-arg USERNAME=${USER} \
					  --build-arg GID=$(shell id -g) \
					  --build-arg USERID=$(shell id -u)  | less
