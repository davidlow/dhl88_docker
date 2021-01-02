FROM debian:buster

# Standard header: Install general tools
RUN \
    echo "deb  http://deb.debian.org/debian buster main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        openssh-server \
        sudo \
        vim \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && service ssh start 

RUN \
        apt-get update \
    &&  apt-get install -yq \
        gnupg \
        evince \
     && wget -qO- https://github.com/retorquere/zotero-deb/releases/download/apt-get/install.sh | bash \
    &&  apt update \
    && apt install -yq zotero

# Standard footer: Create user and make exit not work in bash

ARG USERID=1000
ARG GID=1000
ARG USERNAME=david

RUN \
        mkdir /home/${USERNAME} \
    &&  groupadd -g $GID ${USERNAME} || echo "groupd add failed" \
    &&  useradd -d /home/${USERNAME} \
            -s /bin/bash  \
            -g ${GID} \
            -u ${USERID} \
            ${USERNAME} \
    &&  echo "${USERNAME}:${USERNAME}" | chpasswd \
    &&  adduser ${USERNAME} sudo \
    &&  echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    &&  chown -R ${USERID}:${GID} /home/${USERNAME}/ \
    &&  echo "alias exit='echo no_exit_please!'" >> /home/${USERNAME}/.bashrc

USER ${USERNAME}

CMD ["bash"]
