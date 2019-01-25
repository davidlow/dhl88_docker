from python:3.7-slim-stretch

WORKDIR /usr/src/app

# Install this to avoid error on matplotlib.pyplot import
RUN apt-get update && \
    apt-get install -y libtk8.6 sudo imagemagick gcc ffmpeg python3-dev &&\
    apt-get install -y libhdf5-serial-dev netcdf-bin libnetcdf-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
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
                colorcet 

COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

CMD ["bash"]
