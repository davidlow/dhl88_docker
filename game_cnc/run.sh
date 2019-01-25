docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY  \
    --device /dev/snd \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0:ro  \
    -v /run/user/$(id -u)/pulse:/run/pulse:ro \
    -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
    -v /home/david/gaming:/gaming \
    --name game_cnc \
    dhl88/game_cnc
