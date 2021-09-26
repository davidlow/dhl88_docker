docker run \
    --rm  \
    -it  \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /home/david/Downloads:/home/david/Downloads \
    -v /home/david/cornell:/cornell \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0:ro  \
    -v /run/user/$(id -u)/pulse:/run/pulse:ro \
    -v /home/david/library:/library \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    --shm-size 2g \
    --name firefox-sid3 \
    dhl88/firefox-sid3
#    dhl88/firefox-sid2:20210618

#    -v /dev/snd:/dev/snd \ # for alsa audio
#    --device /dev/snd \
#    -v /dev/shm:/dev/shm \
#    -v ~/.pulse:/root/.pulse \
#    -v /etc/machine-id:/etc/machine-id \
#    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \

# firefox, about:config, browser.tabs.remote.autostart to false
