docker run \
        --rm \
        -it \
        -p 3389:3389 \
        --shm-size 1g \
        -v /home/david/library:/library \
        -v /home/david/cornell/nowack_lab/labnotebook/docker/home:/home \
        --name xrdp_ubuntu \
        dhl88/xrdp_ubuntu
