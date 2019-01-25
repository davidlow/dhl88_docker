FROM debian:sid

RUN \
    apt-get update && \
    apt-get install -y \
        xsane \
        gscan2pdf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  
CMD ["bash"]
