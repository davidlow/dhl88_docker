# # All jupyter settings are stored in jupyterconfigs, which is on # # the host machine, so they are persistant #
# If you want to adjust the mount options, display options, etc, 
# go to or make the directory structure run_options/${HOSTNAME}/${USER}/
# and add your desired options. 

OFFSET=0
DOCKERNAME=dhl88/zotero_${USER}
THISDOCKERNAME=zotero_${USER}_${OFFSET}
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
echo -e "To start Zotero, run the command ${GREEN_} zotero ${NC_} in docker commandline"
echo -e "Make sure to change zotero's data folder to /zotero"
echo ""

TMP=`sed "s/-v/${NC}Folder at ${HOSTNAME} ${RED}/g; s/:/${NC} is mounted in docker as ${GREEN}/g; s/$/${NC}/" ${OPTS_DIR}/mount_opts | grep Folder`
echo -e "${TMP}"
echo ""

RUNNER="docker run \
    --rm  \
    -it \
    -d \
    --privileged \
    \
    ${MOUNT_OPTS} \
    ${DISPLAY_OPTS} \
    -e DISPLAY=$DISPLAY \
    \
    --name $THISDOCKERNAME \
    $DOCKERNAME "

echo ${RUNNER}

$RUNNER && docker exec -it $THISDOCKERNAME /bin/bash 
