FROM debian:jessie

RUN apt-get update && \
    apt-get install -y blender && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
