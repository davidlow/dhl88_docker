docker run \
    -it \
    --rm \
    --privileged \
    -p 4000:4000\
    -p 4443:4443\
    -p 4080:4080\
    -v /home/david/cornell/nowack_lab/labnotebook/docker/home:/home  \
    --name nomachine_server \
    dhl88/nomachine_server
