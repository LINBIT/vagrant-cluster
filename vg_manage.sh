#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "You have to be root!"
	exit 1
fi

dd if=/dev/zero of=/root/lvmfake.img bs=1M count=2000
losetup /dev/loop0 /root/lvmfake.img
echo ",,8e,," | sfdisk /dev/loop0
vgscan
pvcreate /dev/loop0
vgcreate drbdpool /dev/loop0

dbus-drbdmanaged-service&
