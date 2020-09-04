all: postgreSQL
	
postgreSQL: Dockerfile 
	bash build_make.sh \
	& docker build \
		-f Dockerfile_${USER} \
		. \
		-t dhl88/postgresql_${USER} \
		--build-arg USERNAME=${USER} \
		--build-arg GID=$(shell id -g) \
		--build-arg USERID=$(shell id -u)  > build.log \
		& less +F build.log

