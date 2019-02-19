from danielguerra/ubuntu-xrdp

RUN \
    apt-get update && \
    apt-get install -yq  \
        okular evince

RUN \
    groupadd -g 1000 david && \
    mkdir /home/david && \
    chown -R 1000:1000 /home/david &&\
    useradd -d /home/david -s /bin/bash -g 1000 -u 1000 david && \
    echo david:david | chpasswd &&\ 
    ls -alt /home/ 

#CMD ["supervisord"]
CMD ["bash"]
