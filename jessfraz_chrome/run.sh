docker run -it \
	--net host \
	--memory 512mb \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	-v $HOME/Downloads:/home/chrome/Downloads \
	-v $HOME/.config/google-chrome/:/data \
	--security-opt seccomp=$HOME/chrome.json \
	--device /dev/snd \
   	--device /dev/dri \
	-v /dev/shm:/dev/shm \
	--name chrome2 \
	dhl88/jess/chrome
