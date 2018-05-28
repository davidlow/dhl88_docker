FROM debian:jessie

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine wine32 wine64 libwine libwine:i386 &&\
    apt-get install -y wget &&\
    apt-get install -y x11-apps &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN \
    wget http://ltspice.analog.com/software/LTspiceXVII.exe

CMD ["bash"]
