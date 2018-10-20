# Intro

Python docker complete

# How to run:

~~~~
docker run --rm -it --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v /mnt/labshare:/labshare 
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/code:/code  \
    gmf57/python

~~~~


# requirements

Do not need xhost + on dhl88's computer because I'm running docker as me, not root.

