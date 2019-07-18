OFFSET=0
DOCKERNAME=java_${USER}_${OFFSET}
DOCKERCONTAINER=dhl88/java_${USER}
ECLIPSE_WORKSPACE=/home/david/cornell/nowack_lab/labnotebook/eclipse

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

echo -e "Starting ${GREEN_}${THISDOCKERNAME}${NC_} from ${RED_}${HOSTNAME}${NC_}"

TMP=`sed "s/-v/${NC}Folder at ${HOSTNAME} ${RED}/g; s/:/${NC} is mounted in docker as ${GREEN}/g; s/$/${NC}/" ${OPTS_DIR}/mount_opts | grep Folder`
echo -e "${TMP}"
echo ""


docker run \
    --rm  \
    -it \
    --privileged \
    \
    ${MOUNT_OPTS} \
    ${DISPLAY_OPTS} \
    \
    --name $DOCKERNAME \
    $DOCKERCONTAINER
