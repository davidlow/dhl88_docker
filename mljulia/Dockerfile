from julia:latest


# Install this to avoid error on matplotlib.pyplot import
RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt && \
#    mkdir /code

CMD ["bash"]
