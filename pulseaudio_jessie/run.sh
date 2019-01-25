docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0:ro \
    -v /run/user/$(id -u)/pulse:/run/pulse:ro \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    --name pulseaudio_jessie \
    dhl88/pulseaudio_jessie

#    -v /dev/snd:/dev/snd \ # for alsa audio
#    -v /dev/shm:/dev/shm \
#    -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
#    -v /etc/machine-id:/etc/machine-id \
