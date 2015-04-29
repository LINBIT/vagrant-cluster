# vagrant-cluster
Vagrant and shell scripts that ease DRBD9/drbdmange testing

## Preparation
```
cd upstream
./update.sh
```

## Create the cluster
```
vagrant up
```

## Optional: Create a snapshot (requires vagrant snapshot plugin)
```
./createsnap.sh
```

## Connect to cluster, initialize backing device, and start drbdmanaged
```
vagrant ssh alpha
sudo su
bash /vagrant/vg_manage.sh
```
Repeat this step for bravo, charlie, delta (I use tmux and ':set synchronize-panes')

## Have fun
```
vagrant ssh alpha
sudo su
source /etc/bash_completion.d/drbdmanage
drbdmanage init 192.168.70.11
drbdmanage new-node bravo 192.168.70.12
...
```
