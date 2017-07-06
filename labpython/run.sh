docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY  \
    -e PYTHONPATH="/code:/labnotebook" \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /mnt/labshare:/labshare \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/code:/code  \
    dhl88/labpython
