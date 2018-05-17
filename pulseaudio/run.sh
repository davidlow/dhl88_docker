docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    --device /dev/snd \
    -v /etc/machine-id:/etc/machine-id \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    --name pulseaudio \
    dhl88/pulseaudio

#    -v /dev/snd:/dev/snd \ # for alsa audio
#    -v /dev/shm:/dev/shm \
#    -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
