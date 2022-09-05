#!/bin/bash

set -xe

export HOME="/home/ubuntu"

git clone git@github.com:SidneyDouw/startup-scripts.git "$HOME/.startup-scripts"

cd "$HOME/.startup-scripts/linux"

./test.sh