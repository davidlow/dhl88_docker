# Docker containers

## Current working containers:
- `pulseaudio2`
- `firefox_sid2`
- `eagle`
- `game_cnc`
- `hdfview`
- `java`
- `miniconda3`
- `nomachine_server_ubuntu`
- `scanner`


## Day to Day maintenance
- `docker ps`: status of docker containers
- `docker stop containername`: halt a container
- `docker info`: information about the host computer that is running docker
- `docker inspect containername`: information about a specific container (like IP address)
- `docker rm contanername`: removes a container, do not need to do this for most (if not all) of these containers.  Docker will prompt you if you need to do it

## Saving containers

- `docker export`: It export a container's filesystem to a tarball and it removes the history, layers and entrypoint (flattening the image), run against a container.
- `docker import`: Imports the tarball into a repo image.
- `docker save`: Saves an image to a tarball, this preserves the history, layers and entrypoint, run against an image.
- `docker load`: Loads an image from a tarball into a repo image.
- `docker commit`: Creates an image from a modified container preserving entrypoint, layers and history.

## Strategy for making better containers:
This is only implemented for `miniconda3`, `java`, and `nomachine_server_ubuntu`

1. Make usual dockerfile
2. Make a make file to compile the dockerfile into an image.  
   Pass ARGs into the dockerfile if necessary from the makefile
3. Make a `run.sh` file
   - In the `run.sh` bash script, add handling for importing other files 
     as the mounting options, display options, etc for the `docker run` command.
     This allows you to separate the `run.sh` file from the computer-specific
     details.  Save these files into a dedicated filepath with the hostname and
     username as nested directories
   - Print out details / help when starting the docker container.
     Some useful things are the ports that were opened, the volumes that were 
     mounted, and any container specific commands
