# Account
We rely on the CS LDAP server for user authentication. In order to use the cluster, you need to have a CS account. If you do not have one, please contact the techstaff@cs.uchicago.edu.

Someone sent you but no CNETID provided, you can go to whoami.uchiago.edu to get the CNETID.

## Email
The uchicago email is cnetid@uchicago.edu. So you can also parse the CNETID from the email address.

## Groups
Similarly, send the ticket to the cs techstaff.

## Create Folder
cluster-storage2.uchicago.edu for projects
```
group_name = __$name
zfs create tank/projects/$name
zfs set refquota=500G tank/projects/$name
chown root:__$name tank/projests/$name
getent group __$name

chgrp __$name tank/projects/$name
chmod g+s tank/projects/$name
chmod -R g+w tank/projects/$name
```
# Domains
saltstack management node:

cluster-mgmt.ds.uchicago.edu

home directory:

cluster-storage1.ds.uchicago.edu

project directory:

cluster-storage2.ds.uchicago.edu

backup directory (home):

cluster-storage3.ds.uchicago.edu


# Add a new user to slurm general_group

export CNETID=abc
sudo useradd -m -s /bin/bash $CNETID
sudo sacctmgr create account $CNETID Parent=general_group
sudo sacctmgr add user $CNETID account=$CNETID



```bash
./get_uptime.sh
./parse_uptime.sh
```

# Reload nvidia driver (without reboot)

```
sudo rmmod nvidia_uvm
sudo rmmod nvidia_drm
sudo rmmod nvidia_modeset
sudo rmmod nvidia

# Then, reload them if desired:
sudo modprobe nvidia
sudo modprobe nvidia_modeset
sudo modprobe nvidia_drm
sudo modprobe nvidia_uvm
```

# Address Resolution Issues

Check the short name of your ip address, it alwasys safe to use the full name.

For example, a001.cs.uchicago.edu and a001.ds.cs.uchicago.edu are the different names but share the same short name a001. So when you 

```bash
ssh a001
```

The behavior is undefined. It may connect to a001.cs.uchicago.edu or a001.ds.cs.uchicago.edu. Normally cs, since c is before d in the alphabet.

```
ssh a001.ds.uchicago.edu
```

Same for the configuration file. Always use the full name.

# How to install a new package

ssh cluster-mgmt.ds.uchicago.edu

```
sudo salt '*' pkg.install nvidia-cuda-toolkit
```

It will install the package on all nodes, including the login nodes. Which is not preferred. We can create a list of computation nodes and install the package on them via saltstack.

## Update packages

```
sudo salt '*' pkg.upgrade
```

# Report
```bash
sudo ./report.sh
```

# Suggestions for the cluster
- [ ] Create DS Cluster Authentication LDAP
- [ ] Project Based Role Management and Authentication
- [ ] Better Policy for busy time period