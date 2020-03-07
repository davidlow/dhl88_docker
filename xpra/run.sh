# # - once in, run: 
# # All jupyter settings are stored in jupyterconfigs, which is on # 
# # the host machine, so they are persistant #
# If you want to adjust the mount options, display options, etc, 
# go to or make the directory structure run_options/${HOSTNAME}/${USER}/
# and add your desired options. 

OFFSET=0
DOCKERNAME=dhl88/xpra_${USER}
THISDOCKERNAME=xpra_${USER}_${OFFSET}
PORT=$((14500 + $(id -u) + ${OFFSET}))
HOME=/home/${USER}

# Get display, mount options for docker run
# Folder structure so you can save them between different computers
OPTS_DIR=run_options
if [ -d "run_options/${HOSTNAME}/${USER}" ]; then
    OPTS_DIR=run_options/${HOSTNAME}/${USER}
fi
MOUNT_OPTS=`grep -o '^[^#]*' ${OPTS_DIR}/mount_opts`
DISPLAY_OPTS=`grep -o '^[^#]*' ${OPTS_DIR}/display_opts`

NC='\\033[0m'
RED='\\033[0;31m'
GREEN='\\033[0;32m'
NC_='\033[0m'
RED_='\033[0;31m'
GREEN_='\033[0;32m'
echo -e "Starting ${GREEN_} ${THISDOCKERNAME} ${NC_} from ${RED_} ${HOSTNAME} ${NC_}"
echo -e "Docker container name: ${GREEN_} ${THISDOCKERNAME} ${NC_}"
echo -e "xpra Port: ${RED_} ${PORT} ${NC_} <- ${GREEN_} 14500 ${NC_}"
echo -e "To start xpra, run the command ${GREEN_} xpra start --start-child=xterm ${NC_} in docker commandline"
echo ""

TMP=`sed "s/-v/${NC}Folder at ${HOSTNAME} ${RED}/g; s/:/${NC} is mounted in docker as ${GREEN}/g; s/$/${NC}/" ${OPTS_DIR}/mount_opts | grep Folder`
echo -e "${TMP}"
echo ""

cp ./xpra.conf.orig ./xpra.conf
echo "bind-wss=0.0.0.0:${PORT}" >> ./xpra.conf

docker run \
    --rm  \
    -it \
    -d \
    --privileged \
    -p $PORT:14500 \
    -e XPRA_PW=${USER}\
    \
    ${MOUNT_OPTS} \
    ${DISPLAY_OPTS} \
    ${JUPYTER_OPTS} \
    \
    --name $THISDOCKERNAME \
    $DOCKERNAME \
    \
&& docker cp ./xpra.conf $THISDOCKERNAME:/etc/xpra/xpra.conf \
&& docker exec -it $THISDOCKERNAME /bin/bash 
