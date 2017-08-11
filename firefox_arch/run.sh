docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -e uid=$(id -u) \
    -e gid=$(id -g) \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /mnt/labshare:/labshare \
    --device /dev/snd \
    -v /dev/shm:/dev/shm \
    -v ~/.pulse:/root/.pulse \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v /etc/machine-id:/etc/machine-id \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    --name firefox_arch \
    dhl88/firefox_arch

#    -v /dev/snd:/dev/snd \ # for alsa audio
