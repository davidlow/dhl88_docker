docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /home/david/Downloads:/home/user/Downloads \
    --device /dev/snd \
    -v /dev/shm:/dev/shm \
    -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
    -v ~/.pulse:/root/.pulse \
    -v /etc/machine-id:/etc/machine-id \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    --name firefox-sid \
    dhl88/firefox-sid

#    -v /dev/snd:/dev/snd \ # for alsa audio
