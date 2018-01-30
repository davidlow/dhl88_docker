FROM debian:stretch

RUN echo "deb  http://deb.debian.org/debian stretch main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        mplayer \
    && rm -rf /var/lib/apt/lists/* 

        # Flash 
#        pulseaudio \
#	alsa-base \
#	alsa-utils \
#COPY .asoundrc /home/firefox/.asoundrc

#ENTRYPOINT ["/usr/bin/firefox", "--new-window", "about:blank"]
CMD ["bash"]
