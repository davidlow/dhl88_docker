FROM debian:buster

RUN \
    echo "deb  http://deb.debian.org/debian buster main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        texlive-full \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/texmf/tex/latex/commonstuff/ 


COPY ./sty/* /root/texmf/tex/latex/commonstuff/

#ENTRYPOINT ["/usr/bin/firefox", "--new-window", "about:blank"]
CMD ["bash"]
