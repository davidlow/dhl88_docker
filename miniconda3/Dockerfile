FROM continuumio/miniconda3


# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \ #                        && \

# Install LaTeX
RUN \
    echo "deb  http://deb.debian.org/debian stretch main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        texlive-full \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/texmf/tex/latex/commonstuff/ 

# Install conda and conda extensions
RUN \
    apt-get update && \
    apt-get install -yq gcc nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    conda update -y -n root conda && \
    conda update -y --all &&\
    conda install -y -c conda-forge \
                        jupyterlab \
                        ipympl \
                        nb_conda_kernels \
                        jupyter_conda \
                        && \
    conda install -y nodejs && \
    pip install jupyterlab_latex black nbresuse && \
    jupyter labextension install jupyterlab-drawio \
                                 jupyter-matplotlib \
                                 jupyterlab_bokeh  \
                                 @jupyter-widgets/jupyterlab-manager \
                                 @jupyterlab/latex \
                                 @jupyterlab/statusbar \
                                 @jupyterlab/toc \
                                 @jupyterlab/celltags \
                                 @ryantam626/jupyterlab_code_formatter \
                                 jupyterlab_filetree \
                                 jupyterlab-topbar-extension  \
                                 jupyterlab-system-monitor  \
                                 jupyterlab-topbar-text \
                                 @lckr/jupyterlab_variableinspector \
                                 jupyterlab_toastify \
                                 @pyviz/jupyterlab_pyviz \
                                 jupyterlab_conda && \
    pip install jupyterlab_code_formatter && \
    jupyter serverextension enable --py jupyterlab_code_formatter --system &&\
    conda clean -y --all 

# Use conda environment
SHELL ["/bin/bash", "-c"]
RUN \
    conda update -y -n root conda && \
    conda update -y --all &&\
    conda create -n droot && \
    export PATH="/opt/conda/bin:$PATH" && \
    source "/opt/conda/bin/activate" && \
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
                        networkx \
                        graphviz \
                        && \
    conda install -y \
                    -c conda-forge \
                        jsonpickle \
                        h5netcdf \
                        h5py \
                        dask \
                        statsmodels \
                        && \
    conda install -y -c plotly plotly && \
    conda install -c pyviz holoviews \
    conda install -y ipykernel && \
    jupyter lab build && \
    conda update -y --all && \
    conda clean -y --all && \
    python -m ipykernel install --user --name droot \
                --display-name "david_root"

ARG USERID=1000
ARG GID=1000
ARG USERNAME=david

# Make user instead of root so library works better
RUN \
    apt-get update && \
    echo ${USERID} ${GID} ${USERNAME} && \
    apt-get install -yq sudo vim && \
    mkdir /home/${USERNAME} && \
    groupadd -g $GID ${USERNAME} || echo "groupd add failed" && \
    useradd -d /home/${USERNAME} -s /bin/bash -g ${GID} -u ${USERID} ${USERNAME} && \
    echo "${USERNAME}:${USERNAME}" | chpasswd && \
    adduser ${USERNAME} sudo && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown -R ${USERID}:${GID} /home/${USERNAME}/ && \
    mkdir -p /home/${USERNAME}/texmf/tex/latex/commonstuff && \
    mkdir -p /home/${USERNAME}/.config/matplotlib/stylelib && \
    chown -R ${USERNAME}:${USERNAME} /opt/conda/share && \
    chmod 777 -R /opt/conda/share && \
    find /opt/conda -type d -exec chmod 777 {} + && \
    chown -R ${USERID}:${GID} /home/${USERNAME}/.config/
    
USER ${USERNAME}

RUN \
    touch /home/${USERNAME}/.bashrc && \
    conda init bash 

CMD ["bash"]
