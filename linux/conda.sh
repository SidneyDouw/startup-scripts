#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

conda_version=Anaconda3-2022.05-Linux-x86_64.sh

wget "https://repo.anaconda.com/archive/$conda_version"
bash "$conda_version" -b

rm "$conda_version"

rc_file=$(./util/find_rc_file.sh)

echo \
'
# Anaconda
export PATH="$HOME/anaconda3/bin:$PATH"' \
| tee -a "$HOME/$rc_file"

# change the working directory to the previous working directory
cd "$PPWD"