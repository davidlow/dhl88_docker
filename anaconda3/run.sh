# # - once in, run: 
# jupyter lab --port=38888 --no-browser --allow-root --ip=0.0.0.0
#
# # - from the host machine, localhost:38888 is sufficient
# # - from a docker container webbrowser, use the IP address of 
# #   this docker container which you can find from the host by 
# docker inspect anaconda0 | grep IP
#
# # All jupyter settings are stored in jupyterconfigs, which is on
# # the host machine, so they are persistant

DOCKERNAME=anaconda0
PORT=38888

docker run \
    --rm  \
    -it \
    -d \
    --privileged \
    -p $PORT:$PORT \
    -e DISPLAY=$DISPLAY  \
    -e PYTHONPATH="/code:/labnotebook" \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    \
    -v /home/david/cornell/nowack_lab/labnotebook/jupyter:/jupyterconfigs \
    -e JUPYTER_CONFIG_DIR="/jupyterconfigs" \
    \
    -v /mnt/labshare:/labshare \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/code:/code  \
    \
    --name $DOCKERNAME \
    dhl88/anaconda
docker cp ./sty/davidnotes.sty  $DOCKERNAME:/root/texmf/tex/latex/commonstuff/
docker cp ./sty/davidphys.sty   $DOCKERNAME:/root/texmf/tex/latex/commonstuff/
docker cp ./sty/tikzfeynman.sty $DOCKERNAME:/root/texmf/tex/latex/commonstuff/
docker exec -it $DOCKERNAME /bin/bash
docker stop $DOCKERNAME
