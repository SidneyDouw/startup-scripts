#!/bin/bash

set -xe

startup_scripts_folder="/home/ubuntu/.startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$startup_scripts_folder" --depth 1 || true
sudo chown -R ubuntu:ubuntu .startup-scripts/

cd "$startup_scripts_folder/linux"
./updates.sh

sudo reboot