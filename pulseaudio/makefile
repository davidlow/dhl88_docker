all: pulseaudio 

pulseaudio: Dockerfile
	docker build -t dhl88/pulseaudio \
	    --build-arg gid=999 \
	    --build-arg uid=`id -u` \
	    --build-arg audioid=29 \
	    . 

