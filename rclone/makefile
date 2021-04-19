all: rclone
	
rclone: Dockerfile 
	docker build . -t dhl88/rclone_${USER} \
		       --build-arg USERNAME=${USER} \
		       --build-arg GID=$(shell id -g) \
		       --build-arg USERID=$(shell id -u)  > build.log \
			   & less +F build.log

clean: Dockerfile 
	docker build . --no-cache -t dhl88/rclone_${USER}
