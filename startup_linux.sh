#!/bin/bash

set -xe

HOME="/home/ubuntu"

startup_scripts_folder=".startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$HOME/$startup_scripts_folder" --depth 1 || true

cd "$HOME/$startup_scripts_folder/linux"
./updates.sh