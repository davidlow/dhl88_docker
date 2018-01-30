all: firefox 

firefox: Dockerfile flash_player_npapi_linux.x86_64.tar.gz 
	docker build -t dhl88/firefox-sid \
	    --build-arg gid=999 \
	    --build-arg uid=`id -u` \
	    --build-arg audioid=29 \
	    . 

firefox2: Dockerfile flash_player_npapi_linux.x86_64.tar.gz 
	docker build -t dhl88/firefox-sid \
	    --build-arg gid=`getent group docker | awk -F: '{printf $3}'` \
	    --build-arg uid=`id -u` \
	    --build-arg audioid=`getent group audio | awk -F: '{printf $3}'` \
	    . 
