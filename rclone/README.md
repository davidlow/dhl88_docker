# rclone docker container

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

### ssh,  git, and github
There is a gitconfig in the mount options folder.  This is copied 
upon running.

You should generate an ssh public/private key and place it in
a safe folder and mount that folder into the docker container.

```
ssh-keygen -t rsa -b 4096 -C "github email addr"
```
Make sure not to over-write your previous key.

Add the .pub key to github.

### setup rclone
Run command: `rclone config`

1. Make a new remote with `n`
2. enter a name
3. Choose google drive with `12`
4. Google application client id, leave blank
5. Google application client secret, leave blank
6. Choose scope, `1`
7. ID of root folder, we enter a value.  

In google drive, navigate to the folder you wish to have access to.  
The URL should look something like: 
```
https://drive.google.com/drive/u/1/folders/1i3sdWZr_CRE8D5YkQxM8z3DATVBYUwLw
```
Here, the ID of root folder is 
```
1i3sdWZr_CRE8D5YkQxM8z3DATVBYUwLw
```

8. Service account redentials, leave blank
9. Edit advanced config, no `n`
10. use auto config? no `n` because headless
11. Go to the website, copy in the token

### Using rclone

1.  `rclone listremotes` gives the names of the remote folders
2.  `rclone ls <name>` lists the files in the remote folder.

Remember to use the colon at the end.

3.  `rclone sync <src> <dest>` syncs the source and destination 

For instance, to download from google drive, I would:
```
rclone sync adv_spam: /googledrive/adv_spam/
```

To push to google drive, I would:
```
rclone sync /googledrive/adv_spam/ adv_spam: 
```

**Be careful** 
with trailing slashes, as this command behaves like rsync and 
it can be a little tricky.

**Be careful** with colab.  If you are pulling from colab/google drive,
there will probably be no problem.  If you are pushing to colab/google 
drive: 
- make sure to close all text editing tabs before trying to push.
- When you push, re-mount google drive and check if the git messages 
    or transferred files are the same.

### Customizing
You should **not** need to edit the `run.sh` file unless you
want to run more than 1 docker container of this type at the same time.
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

