#!/bin/bash

set -xe

$startup_scripts_folder = "/home/ubuntu/.startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$startup_scripts_folder" --depth 1 || true
sudo chown -R ubuntu:ubuntu "$startup_scripts_folder"

cd "$startup_scripts_folder/windows"
./updates.sh

sudo reboot