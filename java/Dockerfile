FROM debian:buster

RUN \
    echo "deb  http://deb.debian.org/debian buster main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        sudo \
        vim \
        openssh-server \
        wget \
        geany \
    && rm -rf /var/lib/apt/lists/* 

RUN \
    apt-get update \
    && apt-get install -yq \
        default-jdk \
    && wget -P /eclipse/ http://ftp.fau.de/eclipse/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz 

RUN \
    tar xfz /eclipse/eclipse-jee-photon-R-linux* -C /opt/ \
    && ln -s /opt/eclipse/eclipse /usr/local/sbin/eclipse 

ARG USERID=1000
ARG GID=1000
ARG USERNAME=david

# Make user instead of root so library works better
RUN \
    mkdir /home/${USERNAME} && \
    groupadd -g $GID ${USERNAME} || echo "groupd add failed" && \
    useradd -d /home/${USERNAME} \
            -s /bin/bash  \
            -g ${GID} \
            -u ${USERID} \
            ${USERNAME} && \
    echo "${USERNAME}:${USERNAME}" | chpasswd && \
    adduser ${USERNAME} sudo && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown -R ${USERID}:${GID} /home/${USERNAME}/ && \
    touch /home/${USERNAME}/.bashrc && \
    service ssh start 
    
USER ${USERNAME}

CMD ["bash"]
