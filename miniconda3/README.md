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
jupyter lab --port=38888 --no-browser --allow-root --ip=0.0.0.0
```

On a web browser on your host machine, go to
```
http://localhost:38888
```
to find the jupyter lab interface.  Enter the token that is outputted
by the ```jupyter lab``` command.

On a web browser on a docker container, go to
```
http://<container IP addr>:38888
```
where ```<container IP addr>``` can be found by running
```docker inspect anaconda0 | grep IP```

### Using
Some tips for using jupyter lab

#### Plotting with dark background
```
import matplotlib.pyplot as plt
plt.style.use(['dark_background', 'daviddarkcolors'])
```

#### Latex
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

#### virtualenv
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
