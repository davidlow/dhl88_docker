FROM continuumio/miniconda3

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
    conda update -y --all &&\
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
    conda clean -y --all 

SHELL ["/bin/bash", "-c"]
RUN \
    conda update -y -n root conda && \
    conda update -y --all &&\
    conda create -n david && \
    export PATH="/opt/conda/bin:$PATH" && \
    source "/opt/conda/bin/activate" && \
    echo $0 && \
    echo $SHELL && \
    conda activate david && \
    conda install -y -c conda-forge \
                        scipy \
                        matplotlib \
                        numpy \
                        pandas \
                        scikit-learn \
                        && \
    conda install -y --override-channels \
                     -c anaconda \
                        pyqtgraph \
                        xarray \
                        netcdf4 \
                        pillow \
                        bokeh \
                        && \
    conda install -y \
                    -c conda-forge \
                        jsonpickle \
                        h5netcdf \
                        && \
    conda update -y --all && \                       
    conda clean -y --all

COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

CMD ["bash"]
