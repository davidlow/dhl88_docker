FROM dhl88/pulseaudio

RUN \
    echo "deb  http://deb.debian.org/debian sid main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        firefox \
        # Flash 
        flashplugin-nonfree \
        # H.264 support for youtube (HTML5)
        gstreamer1.0-libav \
        gstreamer1.0-plugins-good \
    && rm -rf /var/lib/apt/lists/* \

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

USER user
WORKDIR /home/user
RUN \
wget https://addons.mozilla.org/firefox/downloads/latest/umatrix/addon-613250-latest.xpi \
&& wget https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi 
#&& wget https://addons.mozilla.org/firefox/downloads/file/850412/ghostery-8.0.4.4-an+fx.xpi?src=dp-btn-primary \
#&& wget https://addons.mozilla.org/firefox/downloads/file/855336/privacy_badger-2018.2.5-an+fx.xpi?src=dp-btn-primary

#ENTRYPOINT ["/usr/bin/firefox", "--new-window", "about:blank"]

CMD ["bash"]
