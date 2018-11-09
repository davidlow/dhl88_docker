#FROM debian:stretch
FROM ubuntu:latest


RUN \
    #echo "deb http://deb.debian.org/debian stretch main contrib non-free"> /etc/apt/sources.list &&\
    apt-get update && \
    apt-get install -y \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libnss3 \
        libfontconfig1 \
        libxrandr2 \
        libasound2 \
        dbus \
        locales \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen && \
    export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb 

COPY Autodesk_EAGLE_9.2.2_English_Linux_64bit.tar.gz /root/

RUN \
    tar xvvf /root/Autodesk_EAGLE_9.2.2_English_Linux_64bit.tar.gz && \
    rm /root/Autodesk* && \
    chmod 777 -R /eagle*

RUN \ 
    echo "export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb && ./eagle*/eagle run" > eagle.sh && \
    chmod 777 eagle.sh

CMD ["bash"]
