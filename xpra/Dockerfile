from debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update \
    && apt-get install -yq gnupg curl \
    && curl http://xpra.org/gpg.asc | apt-key add - \
    && echo "deb http://xpra.org/ buster main" >> \
        /etc/apt/sources.list.d/xpra.list\
    && apt-get update \
    && printf "1\n1\n" | apt-get install -yq  \
        xpra \
    && echo "Gypsies, Tramps, and Thieves!" \
    && apt-get install -yq \
        software-properties-common \
        python3-xpra \
        xauth \
        xpra-html5  \
        websockify \
        python-xdg \
    && apt-get install -yq \
        gstreamer1.0-pulseaudio \
        gstreamer1.0-alsa \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly \
        python-gst-1.0\
    && apt-get clean -yq \
    && rm -rf /var/lib/apt/lists/*

RUN \
    printf "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 3650 \
                -nodes -out cert.pem -keyout key.pem -sha256\
    && cat key.pem cert.pem > ssl-cert.pem \
    && chmod 644 ssl-cert.pem \
    && cp ssl-cert.pem /etc/xpra/ \
    && mkdir -p /usr/share/xpra/www \
    && chmod 777 /usr/share/xpra/www

ARG USERID=1000
ARG GID=1000
ARG USERNAME=david

RUN \
    apt-get update \
    && apt-get install -yq sudo vim xterm\
    && mkdir -p /run/user/${USERID}/xpra \
    && chown -R $USERID /run/user/${USERID} \
    && echo ${USERID} ${GID} ${USERNAME} \
    && mkdir /home/${USERNAME} \ 
    && groupadd -g $GID ${USERNAME} || echo "groupd add failed" \
    && useradd -d /home/${USERNAME} \
                           -s /bin/bash  \
                           -g ${GID} \
                           -u ${USERID} \
                            ${USERNAME} \
    && echo "${USERNAME}:${USERNAME}" | chpasswd \
    && adduser ${USERNAME} sudo \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && chown -R ${USERID}:${GID} /home/${USERNAME}/  \
    && chmod 644 /etc/xpra/ssl-cert.pem \
    && touch /home/${USERNAME}/.bashrc \
    && echo "alias exit='echo no_exit_please!'" \
                        >> /home/${USERNAME}/.bashrc \
    && echo "alias xterm='xterm -bg black -fg white'" \
                        >> /home/${USERNAME}/.bashrc 

USER ${USERNAME}
#CMD ["/usr/bin/xpra", "start"]
