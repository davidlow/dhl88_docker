FROM debian:buster

RUN \
    echo "deb  http://deb.debian.org/debian buster main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        texlive-full \
        openssh-server \
		sudo \
		vim \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/texmf/tex/latex/commonstuff/  \
    && service ssh start

ARG USERID=1000
ARG GID=1000
ARG USERNAME=david

RUN \
    echo ${USERID} ${GID} ${USERNAME} && \
    mkdir /home/${USERNAME} && \
    groupadd -g $GID ${USERNAME} || echo "groupd add failed" && \
    useradd -d /home/${USERNAME} -s /bin/bash -g ${GID} -u ${USERID} ${USERNAME} && \
    echo "${USERNAME}:${USERNAME}" | chpasswd && \
    adduser ${USERNAME} sudo && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown -R ${USERID}:${GID} /home/${USERNAME}/ && \
    mkdir -p /home/${USERNAME}/texmf/tex/latex/commonstuff 
    
    #chown -R ${USERID}:${GID} /home/${USERNAME}/.config/
    
USER ${USERNAME}

RUN \
    touch /home/${USERNAME}/.bashrc && \
    echo "alias exit='echo no_exit_please!'" >> /home/${USERNAME}/.bashrc 

CMD ["bash"]


