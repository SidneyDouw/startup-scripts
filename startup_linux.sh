#!/bin/bash

set -xe

startup_scripts_folder="/home/ubuntu/.startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$startup_scripts_folder" --depth 1 || true

cd "$startup_scripts_folder/linux"
./updates.sh

sudo reboot