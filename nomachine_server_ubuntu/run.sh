docker run \
    -it \
    --rm \
    --privileged \
    -p 4000:4000\
    -v /home/david/cornell/nowack_lab/labnotebook/docker/home:/home  \
    -v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
    -v /home/david/library:/library \
    --name nomachine_server_ubuntu \
    dhl88/nomachine_server_ubuntu
