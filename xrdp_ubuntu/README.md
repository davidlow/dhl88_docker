# xrdp ubuntu server

Run xrdp server to allow access to 
X on a computer.  This uses xrdp, the
linux version of rdp.

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

Once inside, run 
```
supervisord &
```

### Running
rdesktop into the correct ip address (0.0.0.0) on the host machine

### Customizing
You will need to edit run.sh in your favorite text editor.

#### GUI settings
To ensure your desktop has the same desktop settings, including
the correct preferances for okular, select
a location for the home directory
```
-v /path/to/home/directory:/home \
```

#### Add Library
```
-v /path/to/library:/library
```

## Accessing through a DNS server
I run with a dns server with iptables.  Here is the rule I use
to let nomachine through:

```
iptables -t nat -A PREROUTING -i enp0s0 -d <IP address of DNS server> -p tcp --dport 3389 -j DNAT --to-destination <IP address of docker host>:3389
iptables -A FORWARD -p tcp -d <IP address of docker host> --dport 3389 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
```
