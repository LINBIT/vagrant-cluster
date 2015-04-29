#!/bin/bash

for i in "alpha" "bravo" "charlie" "delta"; do
	vagrant snapshot take $i afterup
done
