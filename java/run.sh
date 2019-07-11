# # - once in, run: 
# jupyter lab --port=38888 --no-browser --allow-root --ip=0.0.0.0
#
# # - from the host machine, localhost:38888 is sufficient
# # - from a docker container webbrowser, use the IP address of 
# #   this docker container which you can find from the host by 
# docker inspect anaconda0 | grep IP
# # # All jupyter settings are stored in jupyterconfigs, which is on
# # the host machine, so they are persistant

DOCKERNAME=java_${USER}_0
DOCKERCONTAINER=dhl88/java_${USER}
#PORT=$((38888+$(id -u)))
ECLIPSE_WORKSPACE=/home/david/cornell/nowack_lab/labnotebook/eclipse


# Change these

    #-p $PORT:$PORT \
    #-p 8787:8787 \
docker run \
    --rm  \
    -it \
    --privileged \
    -e DISPLAY=$DISPLAY  \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    \
    -v /mnt/labshare:/labshare \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/code:/code  \
    -v /home/david/library:/library\
    -v $ECLIPSE_WORKSPACE:/home/${USER}/eclipse-workspace \
    \
    --name $DOCKERNAME \
    $DOCKERCONTAINER

