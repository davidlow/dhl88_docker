FROM base/archlinux

RUN \
       pacman -Syy \
    && pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        firefox \
        pulseaudio \
        ffmpeg \
        flashplugin \
        alsa-utils \
    && pacman -Sc --noconfirm \
    && mkdir -p /home/firefox \
    && groupadd -r firefox \
    && useradd -r -g firefox -G audio,video firefox \
    && mkdir -p /home/firefox/Downloads \
    && chown -R firefox:firefox /home/firefox \
    && usermod -u 1000 firefox \
    && groupmod -g 1000 firefox \
    && mkdir -p /run/user/1000/

#RUN \
#    wget -P ublock_origin \
#        https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi \
#    unzip ublock_origin/addon-607454-latest.xpi -d ublock_origin/ \
#    rm ublock_origin/addon-607454-latest.xpi \


COPY .asoundrc /home/firefox/.asoundrc

USER firefox

CMD ["bash"]

#ENTRYPOINT ["/usr/bin/firefox", "--new-window", "about:blank"]
