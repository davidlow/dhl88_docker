from dhl88/xpra_${USER}

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN \
    apt-get update \
    && apt-get install -yq wget ngspice\
    && wget -c \
    http://download.opensuse.org/repositories/home:/ra3xdh/Debian_10/Release.key \
    && echo "deb http://download.opensuse.org/repositories/home:/ra3xdh/Debian_10/ ./" >> /etc/apt/sources.list \
    && apt-key add Release.key \
    && apt-get update \
    && apt-get install -yq \
        qucs-s \
    && apt-get clean -yq \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=david
USER ${USERNAME}
