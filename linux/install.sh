#!/bin/bash

set -e

export HOME="/home/ubuntu"

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

./nvm.sh -d
./nginx.sh -d