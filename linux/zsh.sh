#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

# Install Zsh

sudo apt install zsh
sudo chsh -s "$(which zsh)"

# Install Oh-My-Zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# change the working directory to the previous working directory
cd "$PPWD"