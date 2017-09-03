docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -e uid=$(id -u) \
    -e gid=996 \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /mnt/labshare:/labshare \
    --device /dev/snd \
    -v /dev/shm:/dev/shm \
    -v /run/user/1001/pulse:/run/user/1001/pulse \
    -v ~/.pulse:/root/.pulse \
    -v /etc/machine-id:/etc/machine-id \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    --name firefox \
    dhl88/firefox

#    -v /dev/snd:/dev/snd \ # for alsa audio
