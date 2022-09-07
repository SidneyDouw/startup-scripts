#!/bin/bash

set -xe

sudo apt update

# disable "pending kernel update" message and upgrade
sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf
sudo apt upgrade -y

sudo reboot now

# sudo apt install build-essential -y