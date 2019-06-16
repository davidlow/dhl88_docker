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
JUPYTERCONFIGDIR=/home/alice/jupyter
#JUPYTERCONFIGDIR=home/home/david/cornell/nowack_lab/labnotebook/jupyter

DOCKERNAME=dhl88/miniconda_${USER}
#DOCKERNAME=dhl88/miniconda_alice
THISDOCKERNAME=miniconda_${USER}_0
#THISDOCKERNAME=miniconda0
PORT=$((38888 + $(id -u)))
#PORT=38888
#HOME=/home/${USER}

echo "jupyter lab --port=${PORT} --no-browser --ip=0.0.0.0 &" > startjupyter
chmod 777 startjupyter

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
    -v ${JUPYTERCONFIGDIR}:/jupyterconfigs \
    -e JUPYTER_CONFIG_DIR="/jupyterconfigs" \
    \
    -v /home/alice/data:/data \
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
