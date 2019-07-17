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
#
# If you want to adjust the mount options, display options, etc, 
# go to or make the directory structure run_options/${HOSTNAME}/${USER}/
# and add your desired options. 

OFFSET=0
DOCKERNAME=dhl88/miniconda_${USER}
THISDOCKERNAME=miniconda_${USER}_${OFFSET}
PORT=$((38888 + $(id -u) + ${OFFSET}))
PORT_DASH=$((8787 + ${OFFSET}))
HOME=/home/${USER}

# Get display, mount options for docker run
# Folder structure so you can save them between different computers
OPTS_DIR=run_options
if [ -d "run_options/${HOSTNAME}/${USER}" ]; then
    OPTS_DIR=run_options/${HOSTNAME}/${USER}
fi
MOUNT_OPTS=`grep -o '^[^#]*' ${OPTS_DIR}/mount_opts`
DISPLAY_OPTS=`grep -o '^[^#]*' ${OPTS_DIR}/display_opts`
JUPYTER_OPTS=`grep -o '^[^#]*' ${OPTS_DIR}/jupyter_opts`

NC='\\033[0m'
RED='\\033[0;31m'
GREEN='\\033[0;32m'
NC_='\033[0m'
RED_='\033[0;31m'
GREEN_='\033[0;32m'
echo -e "Starting ${GREEN_} ${THISDOCKERNAME} ${NC_} from ${RED_} ${HOSTNAME} ${NC_}"
echo -e "Docker container name: ${GREEN_} ${THISDOCKERNAME} ${NC_}"
echo -e "Dash Port: ${RED_} ${PORT_DASH} ${NC_} <- ${GREEN_} 8787 ${NC_}"
echo -e "Jupyter HTML Port: ${RED_} ${PORT} ${NC_} <- ${GREEN_} ${PORT} ${NC_}"
echo -e "To start Jupyterlab, run the command ${GREEN_} startjupyter ${NC_} in docker commandline"
echo -e "To load environment, run command ${GREEN_} conda env create -f myenvironmentfile.yml ${NC_} in docker commandline"
echo ""

TMP=`sed "s/-v/${NC}Folder at ${HOSTNAME} ${RED}/g; s/:/${NC} is mounted in docker as ${GREEN}/g; s/$/${NC}/" ${OPTS_DIR}/mount_opts | grep Folder`
echo -e "${TMP}"
echo ""

echo "jupyter lab --port=${PORT} --no-browser --ip=0.0.0.0 &" > startjupyter
chmod 777 startjupyter

docker run \
    --rm  \
    -it \
    -d \
    --privileged \
    -p $PORT:$PORT \
    -p ${PORT_DASH}:8787 \
    \
    ${MOUNT_OPTS} \
    ${DISPLAY_OPTS} \
    ${JUPYTER_OPTS} \
    \
    -m 25g \
    \
    --name $THISDOCKERNAME \
    $DOCKERNAME \
&& docker cp ./sty/davidnotes.sty  \
	$THISDOCKERNAME:$HOME/texmf/tex/latex/commonstuff/ \
&& docker cp ./sty/davidphys.sty   \
	$THISDOCKERNAME:$HOME/texmf/tex/latex/commonstuff/ \
&& docker cp ./sty/tikzfeynman.sty \
	$THISDOCKERNAME:$HOME/texmf/tex/latex/commonstuff/ \
&& docker cp daviddarkcolors.mplstyle \
	$THISDOCKERNAME:$HOME/.config/matplotlib/stylelib/ \
    \
&& docker cp startjupyter $THISDOCKERNAME:/usr/bin/ \
    \
&& docker exec -it $THISDOCKERNAME /bin/bash 
