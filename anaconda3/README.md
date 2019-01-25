# Anaconda 3 docker container

Run anaconda 3 inside a docker container that 
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
