from python:3.7-slim-stretch

WORKDIR /usr/src/app

# Install this to avoid error on matplotlib.pyplot import
RUN apt-get update && \
    apt-get install -y libtk8.6 sudo imagemagick gcc ffmpeg python3-dev &&\
    apt-get install -y libhdf5-serial-dev netcdf-bin libnetcdf-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
COPY requirements2.txt ./
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir -r requirements2.txt && \
    mkdir /code
#COPY mpl-test.py ./
COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

## Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer

CMD ["bash"]
