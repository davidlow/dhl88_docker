OFFSET=0
DOCKERNAME=dhl88/latex_${USER}
THISDOCKERNAME=latex_${USER}_${OFFSET}
HOME=/home/${USER}

OPTS_DIR=run_options
if [ -d "run_options/${HOSTNAME}/${USER}" ]; then
        OPTS_DIR=run_options/${HOSTNAME}/${USER}
fi
MOUNT_OPTS=`grep -o '^[^#]*' ${OPTS_DIR}/mount_opts`

NC='\\033[0m'
RED='\\033[0;31m'
GREEN='\\033[0;32m'
NC_='\033[0m'
RED_='\033[0;31m'
GREEN_='\033[0;32m'
echo -e "Starting ${GREEN_} ${THISDOCKERNAME} ${NC_} from ${RED_} ${HOSTNAME} ${NC_}"
echo -e "Docker container name: ${GREEN_} ${THISDOCKERNAME} ${NC_}"
echo ""

TMP=`sed "s/-v/${NC}Folder at ${HOSTNAME} ${RED}/g; s/:/${NC} is mounted in docker as ${GREEN}/g; s/$/${NC}/" ${OPTS_DIR}/mount_opts | grep Folder`
echo -e "${TMP}"
echo ""


docker run \
    --rm  \
    -it  \
    -d   \
    ${MOUNT_OPTS}
    --name ${THISDOCKERNAME} \
    ${DOCKERNAME} \
&& docker cp scripts/embeddfonts ${THISDOCKERNAME}:/usr/bin/ \
&& docker exec -it ${THISDOCKERNAME} /bin/bash
