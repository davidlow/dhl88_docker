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
You should **not** need to edit the `run.sh` file unless you
want to run more than 1 miniconda docker at the same time.
Then, you can change the `OFFSET` variable to something
greater than 1, which will shift the name of the docker container
and the port numberings.

If you are running this docker container for the first time in your
computer, you need to create the files to correctly map your display
to the container, desired volumes (folders) to the container, and
various jupyter config folders to the container.  

Create a folder path inside `run_options/` that looks like 
`run_options/${HOSTNAME}/${USER}`, or 
`run_options/DebianDesktop/david` if the user is `david` and 
the computer's name is `DebianDesktop`.  The current computer name 
and user name can be found by `echo ${HOSTNAME}` and `echo ${USER}`
respectively.  Inside of this new folder, create three files,
`mount_opts`, `display_opts`, `jupyter_opts`.  There are templates
in `run_options/templates/`.  

`display_opts` can be left blank if you do not wish to connect 
to your local x window or if you are running in something other
than linux.

`jupyter_opts` tells jupyter lab the folder in which to save its configuration
files to maintain the same GUI appearence in the web browser from container
to container.

`mount_opts` allows you to access the hard drive of the local
computer instead of just the temporary storage (destroyed whenever 
the docker container closes) of in the docker container.
You can also add a line to tell python where to look for import
packages with: ` -e PYTHONPATH="/code:/labnotebook" `.

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
```

To list existing environments:
```
conda info --envs
```

To make the conda virtualenv show up in the list of 
jupyter notebook kernels:
```
python -m ipykernel install --user --name david --display-name "david"
```
where david is the name of the virtualenv.  This is not strictly necessary
as the kernel will still show up without it.
and tends to make things more confusing.

### Environment files

To create environment from ```yml``` file:
```
conda env create -f environment.yml
```

To export your environment:
```
conda env export > environment.yml
```

To export your environment for cross platform, 
```
conda env export --no-builds > environment.yml
```

Sometimes, a environment file will not build correctly.  I got an error 
like 
```
Collecting package metadata: done
Solving environment: failed

ResolvePackageNotFound:
  - openblas==0.3.6=h6e990d7_2
```
or 
```
Collecting package metadata: done
Solving environment: failed

UnsatisfiableError: The following specifications were found to be in conflict:
  - liblapack==3.8.0=10_openblas -> libblas==3.8.0=10_openblas -> openblas[version='>=0.3.6,<0.3.7.0a0'] -> libopenblas==0.3.6=h6e990d7_3
  - libopenblas==0.3.6=h6e990d7_3 -> openblas==0.3.6=3
Use "conda search <package> --info" to see the dependencies for each package.

```

To fix these, copy your original environment file and edit it.  You will have lines like 
```
  - openblas=0.3.6=h6e990d7_2
```
Replace these lines with lines like
```
  - openblas=0.3.6
```
This removes the build specifications.  If you still had access to the other 
conda environment, you could export with the `--no-builds` option.


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

### nbextensions DOES NOT WORK WITH JUPYgERLAB
Nbextension manager can be accessed through 
```
172.17.0.4:38888/nbextensions
```

### Jupyterlab 1.0
Sometimes jupyterlab does not update properly to 1.0.
Simply reinstall it with 
```
conda install -c conda-forge jupyterlab=1
```
If you need to re-build, do it from the command line as root with 
```
jupyter lab build
```
