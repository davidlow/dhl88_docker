# Dockerfile to install NoMachine free v. 6 with MATE interface
FROM ubuntu:18.04


ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -yq \
        apt-utils  \
        vim \
        xterm \ 
        pulseaudio \
        cups \
        curl \
        && \
    echo "1" | apt-get install -yq xfce4 && \
    apt-get install -yq \
        xfce4-power-manager \
        && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV NOMACHINE_PACKAGE_NAME nomachine_6.4.6_1_amd64.deb
ENV NOMACHINE_MD5 6623e37e88b4f5ab7c39fa4a6533abf4
ENV NOMACHINE_BUILD 6.4

# RUN apt-get update apt-get install -y mate-desktop-environment-core

# Installation of ssh is required if you want to connect to NoMachine server using SSH protocol when supported.
# Comment it out if you don't need it or if you use NoMachine free.
#RUN apt-get install -y ssh \
#&& service ssh start

RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_BUILD}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
&& echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - \
&& dpkg -i nomachine.deb \
&& groupadd -r nomachine -g 433 \
&& useradd -u 431 -r -g nomachine -d /home/nomachine -s /bin/bash -c "NoMachine" nomachine \
&& echo 'nomachine:nomachine' | chpasswd \
&& useradd -d /home/david -s /bin/bash -g 1000 -u 1000 david \
&& echo 'david:david' | chpasswd 

RUN \
    apt-get update && \
    apt-get install -yq \
        evince \
        okular \ 
        firefox \
        && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV NX_NODE_CFG /usr/NX/etc/node.cfg
ENV NX_SRV_CFG /usr/NX/etc/server.cfg

RUN sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/X11/startxfce4"' $NX_NODE_CFG
RUN sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/X11/startxfce4"' $NX_SRV_CFG
#RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes "unix-remote,unix-default,unix-xsession-default,unix-gnome,unix-xdm"' $NX_NODE_CFG
#RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes "unix-remote,unix-default,unix-xsession-default,unix-gnome,unix-xdm"' $NX_SRV_CFG
RUN sed -i '/CreateDisplay/c\CreateDisplay 1' $NX_SRV_CFG
RUN sed -i '/DisplayOwner/c\DisplayOwner david' $NX_SRV_CFG
#RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes "unix-xsession-default"' $NX_SRV_CFG


ADD nxserver.sh /

#ENTRYPOINT ["./nxserver.sh"]

CMD ["bash"]
