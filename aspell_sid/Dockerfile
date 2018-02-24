FROM debian:sid

RUN \
    apt-get update \
    && apt-get install -yq \
        aspell \
        aspell-en\
    && rm -rf /var/lib/apt/lists/* \

CMD ["bash"]
