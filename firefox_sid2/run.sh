docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /home/david/Downloads:/home/user/Downloads \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0:ro  \
    -v /run/user/$(id -u)/pulse:/run/pulse:ro \
    --name firefox-sid2 \
    dhl88/firefox-sid2

#    -v /dev/snd:/dev/snd \ # for alsa audio
#    --device /dev/snd \
#    -v /dev/shm:/dev/shm \
#    -v ~/.pulse:/root/.pulse \
#    -v /etc/machine-id:/etc/machine-id \
#    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \

# firefox, about:config, browser.tabs.remote.autostart to false