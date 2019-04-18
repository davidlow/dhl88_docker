FROM continuumio/miniconda3

# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \ #                        && \
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
    jupyter labextension install jupyterlab-drawio && \
    pip install black && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    pip install jupyterlab_code_formatter && \
    jupyter serverextension enable --py jupyterlab_code_formatter &&\
    conda clean -y --all 

#conda install -c conda-forge jupyter_contrib_nbextensions && \
RUN \
    pip install jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator && \
    jupyter contrib nbextension install --system 
    

SHELL ["/bin/bash", "-c"]
RUN \
    conda update -y -n root conda && \
    conda update -y --all &&\
    conda create -n droot && \
    export PATH="/opt/conda/bin:$PATH" && \
    source "/opt/conda/bin/activate" && \
    echo $0 && \
    echo $SHELL && \
    conda activate droot && \
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
                        h5py \
                        dask \
                        statsmodels \
                        && \
    conda install -y ipykernel && \
    jupyter lab build && \
    conda update -y --all && \
    conda clean -y --all && \
    python -m ipykernel install --user --name droot \
                --display-name "david's root"

ENV USERID 1000
ENV GID 1000
RUN \
    apt-get update && \
    apt-get install -yq sudo vim && \
    mkdir /home/david && \
    groupadd -g $GID david && \
    useradd -d /home/david -s /bin/bash -g ${GID} -u ${USERID} david && \
    echo 'david:david' | chpasswd && \
    adduser david sudo && \
    echo "david ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers &&\ 
    chown -R 1000:1000 /home/david/ && \
    mkdir -p /home/david/texmf/tex/latex/commonstuff && \  
    mkdir -p /home/david/.config/matplotlib/stylelib
    
#COPY daviddarkcolors.mplstyle /root/.config/matplotlib/stylelib/

USER david

RUN \
    touch /home/david/.bashrc && \
    conda init bash 

CMD ["bash"]
