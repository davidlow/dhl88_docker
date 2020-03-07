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

#ENV NOMACHINE_PACKAGE_NAME nomachine_6.4.6_1_amd64.deb
#ENV NOMACHINE_MD5 6623e37e88b4f5ab7c39fa4a6533abf4
#ENV NOMACHINE_BUILD 6.4
ENV NOMACHINE_PACKAGE_NAME nomachine_6.7.6_11_amd64.deb
ENV NOMACHINE_MD5 4d94be64f52b4b5d726da7d2610feeaa
ENV NOMACHINE_BUILD 6.7

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
&& echo 'nomachine:nomachine' | chpasswd 

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

RUN \
       sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/X11/startxfce4"' $NX_NODE_CFG \
    && sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/X11/startxfce4"' $NX_SRV_CFG \
    && sed -i '/CreateDisplay/c\CreateDisplay 1' $NX_SRV_CFG 

#RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes "unix-remote,unix-default,unix-xsession-default,unix-gnome,unix-xdm"' $NX_NODE_CFG
#RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes "unix-remote,unix-default,unix-xsession-default,unix-gnome,unix-xdm"' $NX_SRV_CFG
#RUN sed -i '/AvailableSessionTypes/c\AvailableSessionTypes "unix-xsession-default"' $NX_SRV_CFG

# libxtst-dev, libssl-dev, libjpeg-dev ... is for x11vnc from source
# with help from 
# https://gist.github.com/mangoliou/407d6a39a60d128610c20c4143f39f0d
RUN \
    apt-get update \
    && apt-get install -yq \
        vim \
        iputils-ping \
        net-tools \
        sudo \
        libxtst-dev \
        libssl-dev \
        libjpeg-dev \
        autoconf \
        automake \
        gcc \
        openssl \
        libssl-dev \
        #libssl1.0-dev \
        libvncserver-dev \
        xorg-dev \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && wget -P /x11vnc \
        https://github.com/LibVNC/x11vnc/archive/0.9.16.tar.gz \
    && tar zxvf /x11vnc/*.gz -C /opt/ \
    && cd /opt/x11*/ \
    && sh autogen.sh \
    && ./configure --prefix=/usr/local  \
        CFLAGS='-g -O2 -fno-stack-protector -Wall' \
    && make \
    && cp src/x11vnc /usr/bin/ 

ARG USERNAME=david
ARG USERID=1000
ARG GID=1000

RUN \
    useradd -d /home/${USERNAME} -s /bin/bash -g ${GID} -u ${USERID} ${USERNAME} \
    && echo "${USERNAME}:${USERNAME}" | chpasswd  \
    && adduser ${USERNAME} sudo \
    && sed -i '/DisplayOwner/c\DisplayOwner '"${USERNAME}" $NX_SRV_CFG 

RUN \
    touch /home/${USERNAME}/.bashrc \
    && echo "alias exit='echo no_exit_please!'" >> /home/${USERNAME}/.bashrc 

ADD nxserver.sh /

#ENTRYPOINT ["./nxserver.sh"]

CMD ["bash"]
