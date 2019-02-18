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
    && mkdir -p /root/texmf/tex/latex/commonstuff/ 
RUN \
    conda update -y -n root conda && \
    conda install -y -c conda-forge \
                        jupyterlab \
                        ipympl \
                        nb_conda_kernels \
                        && \
    conda install nodejs && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyter-matplotlib && \
    pip install jupyterlab_latex && \
    jupyter labextension install @jupyterlab/latex && \
    jupyter labextension install @jupyterlab/statusbar && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install @jupyterlab/celltags && \
    jupyter labextension install jupyterlab-drawio && \
    conda clean -y --all 
RUN \
    conda update -y -n root conda && \
    conda install -y --override-channels \
                     -c anaconda \
                        pyqtgraph \
                        xarray \
                        netcdf4 \
                        pillow \
                        bokeh \
                        && \
    conda clean -y --all
RUN \
    conda update --all &&\
    conda install -y \
                    -c conda-forge \
                        jsonpickle \
                        h5netcdf \
                        colorcet \
                        cvxopt \
                        lapack \
                        && \
    conda clean -y --all 
RUN \
    conda update --all &&\
    conda install -y -c ioam holoviews && \
    conda install -y -c bokeh bokeh && \
    conda install -y -c cvxgrp cvxpy && \
    conda clean -y --all

COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

CMD ["bash"]
