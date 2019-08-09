OFFSET=0
DOCKERNAME=dhl88/nomachine_server_ubuntu_${USER}
THISDOCKERNAME=nomachine_server_ubuntu_${USER}_${OFFSET}
PORT=$((40000 + $(id -u) + ${OFFSET}))

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

echo -e "Starting ${GREEN_}${THISDOCKERNAME}${NC_} from ${RED_}${HOSTNAME}${NC_}"
echo ""
echo -e "NoMachine Port: ${RED_} ${PORT} ${NC_} <- ${GREEN_} ${PORT} ${NC_}"
echo ""
echo -e "To start NoMachine, run the command ${GREEN_} ./nxserver.sh & ${NC_} in docker commandline"
echo ""
echo -e "To connect to NoMachine from a remote computer, remember to VPN into the network"
echo -e "   and connect to ${RED_}${HOSTNAME}${NC_} ip address and use the above port."
echo -e "   Docker handles port forwarding automatically"
echo ""
echo -e "To connect via x11vnc from ${RED_}${HOSTNAME}${NC_}"
echo -e "     1) Start NoMachine"
echo -e "     2) Log in to NoMachine via another computer.  "
echo -e "        This starts x11 window manager & display"
echo -e "     3) Find the x11 process ID number on the docker container by running"
echo -e "        ${GREEN_} ps aux | grep xfce4-session ${NC_}"
echo -e "        You want the first number after the username (PID), lets say it is ${GREEN_} 123 ${NC_}"
echo -e "     4) Find the display ID number of the docker container by running"
echo -e "        ${GREEN_} cat /proc/123/environ | tr '\\\0' '\\\n' | grep DISPLAY ${NC_}"
echo -e "        The number should be something like ${GREEN_} :1001 ${NC_}"
echo -e "     5) Activate x11vnc with "
echo -e "        ${GREEN_} x11vnc -nap -wait 50 -noxdamage -display :1001 -forever -rfbport 5980 & ${NC_}"
echo -e "        where ${GREEN_} 5980 ${NC_} is the port to connect onto locally.  "
echo -e "        This must be done as the user logged into NoMachine (david)"
echo -e "     6) To connect from ${RED_} ${HOSTNAME} ${NC_} local host:"
echo -e "        run ${GREEN_} vncviewer 172.17.0.6::5980 ${NC_}" 
echo -e "        where 172.17.0.6 is the IP address of ${GREEN_}${THISDOCKERNAME}${NC_} "
echo -e "        and can be found with ${RED_} docker inspect ${THISDOCKERNAME} | grep IPaddress ${NC_}"
echo ""
echo -e "WARNING! x11vnc is not the most stable if you are doing lots of GUI interactions."
echo -e "         You might need to restart the x11vnc server with (5)."
echo ""

TMP=`sed "s/-v/${NC}Folder at ${HOSTNAME} ${RED}/g; s/:/${NC} is mounted in docker as ${GREEN}/g; s/$/${NC}/" ${OPTS_DIR}/mount_opts | grep Folder`
echo -e "${TMP}"
echo ""


docker run \
    -it \
    --rm \
    -d \
    --privileged \
    -p ${PORT}:${PORT}\
    ${MOUNT_OPTS} \
    --name ${THISDOCKERNAME} \
    ${DOCKERNAME} \
&& docker exec -it ${THISDOCKERNAME} /bin/bash -c "echo 'NXPort ${PORT}' >> /usr/NX/etc/server.cfg" \
&& docker exec -it ${THISDOCKERNAME} /bin/bash
