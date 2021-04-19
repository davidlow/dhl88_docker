FROM debian:buster

# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \ #                        && \

# Install LaTeX
RUN \
    echo "deb  http://deb.debian.org/debian buster main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        openssh-server \
        git \
        rclone \
        sudo \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    && service ssh start 

ARG USERID=1000
ARG GID=1000
ARG USERNAME=david

# Make user instead of root so library works better
RUN \
    echo ${USERID} ${GID} ${USERNAME} \
    && mkdir /home/${USERNAME} \
    && groupadd -g $GID ${USERNAME} \ 
        || echo "[warning] groupd add failed"  \
    && useradd -d /home/${USERNAME} -s /bin/bash \
               -g ${GID} -u ${USERID} ${USERNAME}  \
    && echo "${USERNAME}:${USERNAME}" | chpasswd \
    && adduser ${USERNAME} sudo \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && chown -R ${USERID}:${GID} /home/${USERNAME}/ 
    
USER ${USERNAME}

RUN \
    touch /home/${USERNAME}/.bashrc \
    && echo "alias exit='echo no_exit_please!'" \
        >> /home/${USERNAME}/.bashrc 

CMD ["bash"]
