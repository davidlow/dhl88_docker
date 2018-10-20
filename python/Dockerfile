from python:3.7-slim-stretch

WORKDIR /usr/src/app

# Install this to avoid error on matplotlib.pyplot import
RUN apt-get update && \
    apt-get install -y \
        libtk8.6 \
        sudo \
        python3-pyqt5 \
        imagemagick \
        gcc \
        ffmpeg \
        python3-dev \
        python3-pip \
        libxml2-dev \
        libxslt1-dev \
        zlib1g-dev \
        g++ \
        libhdf5-serial-dev \
        netcdf-bin \
        libnetcdf-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# If pip cannot upgrade, try again
RUN pip install --upgrade pip || \
    pip install --upgrade pip && \
    pip install --no-cache-dir \
                numpy \
                scipy \
                ipython \
                qtconsole \
                h5py \
                pandas \
                matplotlib \
                seaborn \
                pyqt5 \
                jsonpickle \
                scikit-learn \
                pyqtgraph \
                astropy \
                xarray \
                netCDF4 \
                h5netcdf \
                dask \
                toolz \
                pillow \
                colorcet && \
    pip install --no-cache-dir \
                statsmodels \
                "holoviews[recommended]" \
                bokeh \
                cvxopt \
                colorcet && \
    pip install --no-cache-dir \
                cvxpy
COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

CMD ["bash"]
