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
docker run \
    --rm  \
    -it \
    --privileged \
    -p 38888:38888 \
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
    --name anaconda0 \
    dhl88/anaconda
