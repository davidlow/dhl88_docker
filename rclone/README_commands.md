# rclone commands

Once the docker container is running, here are some commands that are 
helpful.

- To list remotes, `rclone listremotes`.  In the following, I 
have a remote called `adv_spam:` and a folder that I wish to mirror
`/googledrive/adv_spam/`.

- To list content of remote, `rclone ls adv_spam:`

- To pull from google drive: 
`rclone sync -P adv_spam: /googledrive/adv_spam/`

- To push to google drive: 
`rclone sync -P /googledrive/adv_spam/ adv_spam:`
