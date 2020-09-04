from dhl88/xpra_${USER}

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN \
    apt-get update \
    && apt-get install -yq \
        wget \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
    && apt-get update \
    && apt-get install -yq \
        postgresql-12\
    && apt-get clean -yq \
    && rm -rf /var/lib/apt/lists/*

RUN \
    service postgresql enable \
    && service postgresql start

ARG USERNAME=david
USER ${USERNAME}
