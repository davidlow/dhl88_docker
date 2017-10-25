FROM debian:jessie

RUN \
    echo "deb  http://deb.debian.org/debian jessie main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        firefox-esr \
        # Flash 
        flashplugin-nonfree \
        # H.264 support for youtube (HTML5)
        gstreamer1.0-libav \
        gstreamer1.0-plugins-good \
        pulseaudio \
	alsa-base \
	alsa-utils \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /home/firefox \
    && echo "firefox:x:${uid}:${gid}:firefox,,,:/home/firefox:/bin/bash" >> /etc/passwd \
    && echo "firefox:x:${uid}:" >> /etc/group \
    # mkdir -p /etc/sudoers.d && \
    # echo "firefox ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/firefox && \
    # chmod 0440 /etc/sudoers.d/firefox && \
    && chown ${uid}:${gid} -R /home/firefox \
    && groupadd -r firefox \
    && useradd -r -g firefox -G audio,video firefox \
    && mkdir -p /home/firefox/Downloads \
    && chown -R firefox:firefox /home/firefox \
    && usermod -u 1001 firefox \
    && groupmod -g 996 firefox \
    && groupmod -g 92 audio \
    && mkdir -p /run/user/${uid}

#RUN update-flashplugin-nonfree --install 

WORKDIR /root
COPY flash_player_npapi_linux.x86_64.tar.gz ./
RUN  \
        tar zxvvf flash_player_npapi_linux.x86_64.tar.gz \
    &&  cp libflashplayer.so /usr/lib/flashplugin-nonfree/ \
    && chmod 644 /usr/lib/flashplugin-nonfree/libflashplayer.so \
    && chown root:root /usr/lib/flashplugin-nonfree/libflashplayer.so \
    && update-alternatives --quiet --install \
        /usr/lib/mozilla/plugins/flash-mozilla.so \
        flash-mozilla.so /usr/lib/flashplugin-nonfree/libflashplayer.so \
        50 

#RUN \
#    wget -P ublock_origin \
#        https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi \
#    unzip ublock_origin/addon-607454-latest.xpi -d ublock_origin/ \
#    rm ublock_origin/addon-607454-latest.xpi \

USER firefox
WORKDIR /home/firefox
RUN \
	   wget https://addons.mozilla.org/firefox/downloads/latest/umatrix/addon-613250-latest.xpi \
	&& wget https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi


COPY .asoundrc /home/firefox/.asoundrc

#ENTRYPOINT ["/usr/bin/firefox", "--new-window", "about:blank"]
CMD ["bash"]
