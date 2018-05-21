FROM debian:sid

RUN \
    echo "deb  http://deb.debian.org/debian sid main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        screenruler \
    && rm -rf /var/lib/apt/lists/*

CMD ["screenruler"]
