docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /home/david/cornell:/cornell \
    dhl88/ltspice
