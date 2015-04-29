#!/bin/bash

function update {
	DIR=$1
	if [ -d $DIR ]; then
		cd $DIR
		git pull --recurse-submodules
		git submodule update --recursive
		cd ..
	else
		git clone --recursive git://git.linbit.com/${DIR}.git
	fi
}

update drbd-9.0
update drbdmanage
update drbd-utils
