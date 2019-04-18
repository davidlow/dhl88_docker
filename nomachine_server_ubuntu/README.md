# Nomachine ubuntu server

Run nomachine server to allow **fast** access to 
X on a computer.  This is a lot faster than 
rdp.  It requires a nomachine client, which
exists for all platforms.  In particular, there
is a wonderful version for chrome os.

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
./nxserver.sh &
```

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
iptables -t nat -A PREROUTING -i enp0s0 -d <IP address of DNS server> -p tcp --dport 4000 -j DNAT --to-destination <IP address of docker host>:4000
iptables -A FORWARD -p tcp -d <IP address of docker host> --dport 4000 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
```
