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

# Parameters to change
JUPYTERCONFIGDIR=/home/david/jupyter
#JUPYTERCONFIGDIR=home/home/david/cornell/nowack_lab/labnotebook/jupyter

DOCKERNAME=dhl88/miniconda_${USER}
THISDOCKERNAME=miniconda_${USER}_0
PORT=$((38888 + $(id -u)))
HOME=/home/${USER}

echo "jupyter lab --port=${PORT} --no-browser --ip=0.0.0.0 &" > startjupyter
chmod 777 startjupyter

docker run \
    --rm  \
    -it \
    -d \
    --privileged \
    -p $PORT:$PORT \
    -p 8787:8787 \
    -e DISPLAY=$DISPLAY  \
    -e PYTHONPATH="/code:/labnotebook" \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v ${JUPYTERCONFIG}:/jupyterconfigs \
    -e JUPYTER_CONFIG_DIR="/jupyterconfigs" \
    \
    -v /mnt/labshare:/labshare \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/code:/code  \
    -v /home/david/library:/library\
    \
    --name $THISDOCKERNAME \
    $DOCKERNAME

docker cp ./sty/davidnotes.sty  \
	$THISDOCKERNAME:$HOME/texmf/tex/latex/commonstuff/
docker cp ./sty/davidphys.sty   \
	$THISDOCKERNAME:$HOME/texmf/tex/latex/commonstuff/
docker cp ./sty/tikzfeynman.sty \
	$THISDOCKERNAME:$HOME/texmf/tex/latex/commonstuff/
docker cp daviddarkcolors.mplstyle \
	$THISDOCKERNAME:$HOME/.config/matplotlib/stylelib/

docker cp startjupyter $DOCKERNAME:/usr/bin/

docker exec -it $DOCKERNAME /bin/bash
docker stop $DOCKERNAME
