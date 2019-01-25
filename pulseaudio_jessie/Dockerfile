FROM debian:jessie

ARG uid=1000
ARG gid=1000

# for arch linux
#ARG audioid=92

# for debian
ARG audioid=29 

ENV uid=${uid}
ENV gid=${gid}
ENV audioid=${audioid}

RUN \
    echo "${uid}:${gid}:${audioid}" \ 
    && echo "deb  http://deb.debian.org/debian sid main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        vim \
        pulseaudio \
	    alsa-utils \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /home/user \
    && chown ${uid}:${gid} -R /home/user \
    && groupadd -r user \
    && useradd -r -g user -G audio,video user \
    && mkdir -p /home/user/Downloads \
    && chown -R user:user /home/user \
    && usermod -u ${uid} user \
    && groupmod -g ${gid} user \
    && groupmod -g ${audioid} audio \
    && mkdir -p /run/user/${uid}

COPY default.pa /etc/pulse/default.pa
COPY pulse-client.conf /etc/pulse/client.conf
COPY .asoundrc /home/user/.asoundrc-

ENV PULSE_SERVER /run/pulse/native

CMD ["bash"]
