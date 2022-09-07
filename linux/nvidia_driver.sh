#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

sudo apt-get install linux-headers-$(uname -r)

distribution=$(. /etc/os-release; echo "$ID$VERSION_ID" | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb

sudo apt-get update
sudo apt-get -y install cuda-drivers

# change the working directory to the previous working directory
cd "$PPWD"