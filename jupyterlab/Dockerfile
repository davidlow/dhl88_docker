FROM continuumio/miniconda3


# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \ #                        && \

# Install LaTeX
RUN \
    echo "deb  http://deb.debian.org/debian stretch main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        openssh-server \
        geany \
    && rm -rf /var/lib/apt/lists/* \
    && service ssh start 

# Install conda and conda extensions
# Removed extensions:
#                                 @jupyterlab/statusbar \
#                                  jupyterlab_toastify \
#            @lckr/jupyterlab_variableinspector \
#            jupyterlab_filetree \ # does not work at 20190712
#            jupyterlab_conda \
RUN \
    apt-get update \
    && apt-get install -yq \
        gcc \
        spyder3 \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash -  \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*  \
    && conda update -y -n root conda \
    && conda update -y --all \
    && conda install -y -c conda-forge \
                        jupyterlab \
                        ipympl \
                        nb_conda_kernels \
                        jupyter_conda \
    && pip install black nbresuse \
    && conda clean -y --all 

    #        jupyterlab-topbar-extension  \
    #        jupyterlab-system-monitor  \
    #        jupyterlab-topbar-text \
    #        jupyterlab_bokeh  \

RUN \
    conda update -y -n root conda \
    && conda update -y --all \
    && jupyter labextension install \
            jupyterlab-drawio \
            @jupyter-widgets/jupyterlab-manager \
            @pyviz/jupyterlab_pyviz \
    && jupyter labextension install \
            jupyterlab_toastify \
            @aquirdturtle/collapsible_headings \
            @ryantam626/jupyterlab_code_formatter \
            @jupyterlab/hdf5 \
    && pip install \ 
        lckr-jupyterlab-variableinspector \
        aquirdturtle_collapsible_headings \
        jupyterlab_hdf \
    && conda clean -y --all 

# Use conda environment --override-channels conda-forge for first set, anaconda for second\
# there's a temporary bug where the latest version of jupyterlab has not propagated through
# the network of dependicies.  Manually upgrading it.
            #@jupyterlab/celltags \
SHELL ["/bin/bash", "-c"]
RUN \
    conda config --append channels conda-forge \
    && conda config --append channels pyviz \
    && conda update -y -n root conda  \
    && conda update -y --all \
    && conda create -n droot  \
    && export PATH="/opt/conda/bin:$PATH"  \
    && source "/opt/conda/bin/activate"  \
    && conda activate droot \
    && conda install -y \
                        scipy \
                        matplotlib \
                        numpy \
                        pandas \
                        scikit-learn  \
    \
                        xarray \
                        netcdf4 \
                        pillow \
                        bokeh \
                        networkx \
                        graphviz \
    \
                        jsonpickle \
                        h5netcdf \
                        h5py \
                        dask \
                        statsmodels \
                        \
                        holoviews \
                        \
                        ipykernel  \
                        \
                        xeus-python\
                        tqdm\
    && conda install -y -c pytorch pytorch torchvision torchaudio cpuonly \
    && conda update -y --all  \
    && conda install -y -c conda-forge jupyterlab=3 \
    && jupyter lab build  \
    && conda clean -y --all  \
    && python -m ipykernel install --user --name droot \
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
    chown -R ${USERNAME}:${GID} /opt/conda/share && \
    chmod 777 -R /opt/conda/share && \
    find /opt/conda -type d -exec chmod 777 {} + && \
    chown -R ${USERID}:${GID} /home/${USERNAME}/.config/
    
USER ${USERNAME}

RUN \
    touch /home/${USERNAME}/.bashrc && \
    echo "alias exit='echo no_exit_please!'" >> /home/${USERNAME}/.bashrc && \
    conda init bash 

CMD ["bash"]
