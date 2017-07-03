from python:3-slim

WORKDIR /usr/src/app

# Install this to avoid error on matplotlib.pyplot import
RUN apt-get update && \
    apt-get install -y libtk8.6 && \
    apt-get install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    mkdir /code && \
    export PYTHONPATH="${PYTHONPATH}:/code"
COPY mpl-test.py ./

## Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer

CMD ["bash"]
