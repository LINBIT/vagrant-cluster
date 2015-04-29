#!/bin/bash

for i in "alpha" "bravo" "charlie" "delta"; do
	vagrant snapshot go $i afterup
done
