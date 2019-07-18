FROM continuumio/miniconda3


# If pip cannot upgrade, try again
#    conda install -y -c dsdale24 pyqt5 \ #                        && \

# Install LaTeX
RUN \
    echo "deb  http://deb.debian.org/debian stretch main contrib non-free"> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -yq \
        texlive-full \
        openssh-server \
        geany \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/texmf/tex/latex/commonstuff/  \
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
        nodejs \
        spyder3 \
    && rm -rf /var/lib/apt/lists/*  \
    && conda update -y -n root conda \
    && conda update -y --all \
    && conda install -y -c conda-forge \
                        jupyterlab \
                        ipympl \
                        nb_conda_kernels \
                        jupyter_conda \
    && conda install -y nodejs \
    && pip install jupyterlab_latex black nbresuse \
    && conda clean -y --all \
    && jupyter labextension install \
            jupyterlab-drawio \
            @jupyter-widgets/jupyterlab-manager \
            jupyter-matplotlib \
            jupyterlab_bokeh  \
            @pyviz/jupyterlab_pyviz \
            @jupyterlab/toc \
            @jupyterlab/latex \
            @ryantam626/jupyterlab_code_formatter \
    && jupyter labextension install \
            jupyterlab_toastify \
            @jupyterlab/celltags \
            jupyterlab-topbar-extension  \
            jupyterlab-system-monitor  \
            jupyterlab-topbar-text \
    && pip install jupyterlab_code_formatter \
    && jupyter serverextension enable --py jupyterlab_code_formatter --system \
    && conda clean -y --all 

# Use conda environment --override-channels conda-forge for first set, anaconda for second\
# there's a temporary bug where the latest version of jupyterlab has not propagated through
# the network of dependicies.  Manually upgrading it.
SHELL ["/bin/bash", "-c"]
RUN \
    conda config --append channels conda-forge \
    && conda config --append channels plotly \
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
                        pyqtgraph \
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
                        plotly  \
                        \
                        holoviews \
                        \
                        ipykernel  \
    && conda update -y --all  \
    && conda install -y -c conda-forge jupyterlab=1 \
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
    chown -R ${USERNAME}:${USERNAME} /opt/conda/share && \
    chmod 777 -R /opt/conda/share && \
    find /opt/conda -type d -exec chmod 777 {} + && \
    chown -R ${USERID}:${GID} /home/${USERNAME}/.config/
    
USER ${USERNAME}

RUN \
    touch /home/${USERNAME}/.bashrc && \
    conda init bash 

CMD ["bash"]
