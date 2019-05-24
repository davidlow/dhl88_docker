# Miniconda 3 docker container

Run Miniconda 3 inside a docker container that 
can be accessed from the host or another docker 
container running a browser.

## Getting started
Copy all files

### Installing
Create the docker image with 
```
make
```

To start the docker container,
```
bash run.sh
```

### Customizing
You will need to edit run.sh in your favorite text editor.

#### location of jupyter config files
To ensure jupyter opens with the same GUI settings, select
a location for the jupyterconfig files.
```
-v /path/to/jupyter/config/file/directory:/jupyterconfigs \
```

Add locations to save files
```
-v /mnt/labshare:/labshare \
-v /home/david/cornell/nowack_lab/labnotebook:/labnotebook \
-v /home/david/cornell/nowack_lab/code:/code  \
```

Add where python can look for modules
```
-e PYTHONPATH="/code:/labnotebook" \
```

## First time running
To make latex work properly, you need to add a certain
line to your `jupyter_notebook_config.py` file.  To 
make one of these files, run
```
jupyter notebook --generate-config
```
The file will then be generated wherever you chose your
`jupyterconfig` folder to be.

Add the following line to your `jupyter_notebook_config.py` file:
```
c.LatexConfig.latex_command = 'pdflatex'
```

## Running
Once the docker container starts, run this command 
to start the jupyter lab 
```
startjupyter
```
This is a script that will run a command like:
```
jupyter lab --port=<port> --no-browser --allow-root --ip=0.0.0.0 &
```
where `<port>` is a 38888 + `id -u` on the host machine.

On a web browser on your host machine, go to
```
http://localhost:<port>
```
to find the jupyter lab interface.  Enter the token that is outputted
by the ```jupyter lab``` command.

On a web browser on a docker container, go to
```
http://<container IP addr>:<port>
```
where ```<container IP addr>``` can be found by running
```docker inspect anaconda0 | grep IP```


## Latex
David's latex homework template is:
```
\documentclass[10pt,twocolumn,aps,rmp,tightenlines]{revtex4-1}
\RequirePackage{davidphys}

\begin{document}
\title{Course Name}
\author{David Low / dhl88}
\affiliation{\mydate\today}
\maketitle

\end{document}
```

## Virtualenv in conda in jupyterlab
This docker comes with virtualenv setup and ready to go!
The default one is named david

To activate the virtualenv,
```
conda activate david
```

To create your own virtualenv,
```
conda create -n name
```

To copy an existing environment,
```
conda create --name NEWNAME --clone EXISTING_ENV

To export your environment:
```
conda env export > environment.yml
```

To list existing environments:
```
conda info --envs
```

To create environment from ```yml``` file:
```
conda env create -f environment.yml
```

To make the conda virtualenv show up in the list of 
jupyter notebook kernels:
```
python -m ipykernel install --user --name david --display-name "david"
```
where david is the name of the virtualenv


## Jupyter notebook tips
Some tips for using jupyterlab

### Plotting with dark background
```
import matplotlib.pyplot as plt
plt.style.use(['dark_background', 'daviddarkcolors'])
```

### Workspaces
Workspaces are accessed by manually entering a different URL:
For instance: 
```
172.17.0.4:38888/lab/workspaces/vibrations
```
accesses the `vibrations` workspace.  Each workspace is independent.

A list of all workspaces lives in your jupyterconfigs folder under
```
jupyterconfigs/lab/workspaces
```
and take the form:
```
labworkspacesvibrations-0bdf.jupyterlab-workspace
```

### nbextensions DOES NOT WORK WITH JUPYTERLAB
Nbextension manager can be accessed through 
```
172.17.0.4:38888/nbextensions
```
