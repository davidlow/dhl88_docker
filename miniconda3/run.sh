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
#JUPYTERCONFIGDIR=/home/david/jupyter
JUPYTERCONFIGDIR=/home/david/cornell/nowack_lab/labnotebook/jupyter

OFFSET=0
DOCKERNAME=dhl88/miniconda_${USER}
THISDOCKERNAME=miniconda_${USER}_${OFFSET}
PORT=$((38888 + $(id -u) + ${OFFSET}))
PORT_DASH=$((8787 + ${OFFSET}))
HOME=/home/${USER}

echo "OFFSET: ${OFFSET}"
echo "Dash Port: ${PORT_DASH}"
echo "Jupyter HTML Port: ${PORT}"
echo "Docker container name: ${THISDOCKERNAME}"
echo "Location of Jupyter configs: ${JUPYTERCONFIGDIR}"

echo "jupyter lab --port=${PORT} --no-browser --ip=0.0.0.0 &" > startjupyter
chmod 777 startjupyter

docker run \
    --rm  \
    -it \
    -d \
    --privileged \
    -p $PORT:$PORT \
    -p ${PORT_DASH}:8787 \
    -e DISPLAY=$DISPLAY  \
    -e PYTHONPATH="/code:/labnotebook" \
    -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0  \
    -v ${JUPYTERCONFIGDIR}:/jupyterconfigs \
    -e JUPYTER_CONFIG_DIR="/jupyterconfigs" \
    \
    -v /mnt/labshare:/labshare \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/cornell/nowack_lab/code:/code  \
    -v /home/david/library:/library\
    \
    -m 25g \
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

docker cp startjupyter $THISDOCKERNAME:/usr/bin/

docker exec -it $THISDOCKERNAME /bin/bash
docker stop $THISDOCKERNAME
