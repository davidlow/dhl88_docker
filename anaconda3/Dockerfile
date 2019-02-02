from continuumio/anaconda3

# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \
#                        && \
RUN \
    echo "deb  http://deb.debian.org/debian stretch main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        texlive-full \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/texmf/tex/latex/commonstuff/ &&\
    conda update -y -n root conda && \
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
    conda install -c conda-forge ipympl && \
    conda install nodejs && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyter-matplotlib && \
    pip install jupyterlab_latex && \
    jupyter labextension install @jupyterlab/latex && \
    jupyter labextension install @jupyterlab/statusbar && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install @jupyterlab/celltags && \
    conda clean -y --all 

COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

CMD ["bash"]
