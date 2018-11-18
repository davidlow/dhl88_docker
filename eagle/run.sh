docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /mnt/labshare:/labshare \
    -v /mnt/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/eagle:/root/EAGLE \
    -v /home/david/docker/dhl88/eagle/eaglelib/eagle-cad-libraries:/root/EAGLE/libraries/eagle-cad-libraries \
    dhl88/eagle
