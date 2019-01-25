from continuumio/anaconda3

# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \
#                        && \
RUN conda update -y -n root conda && \
    conda install -y -c conda-forge \
                        jupyterlab \
                        jsonpickle \
                        h5netcdf \
                        colorcet \
                        && \
    conda install -y -c anaconda \
                        pyqtgraph \
                        xarray \
                        netcdf4 \
                        pillow \
                        && \
    conda install -y -c ioam holoviews && \
    conda install -c bokeh bokeh && \
    conda install -y -c conda-forge cvxopt && \
    conda install -y -c conda-forge lapack && \
    conda install -y -c cvxgrp cvxpy && \
    conda install -y -c conda-forge colorcet && \
    conda clean -y --all

COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

CMD ["bash"]
