#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

curl -o https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh | bash

# change the working directory to the previous working directory
cd "$PPWD"