docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /mnt/labshare:/labshare \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    dhl88/hdfview
