#!/bin/bash

set -xe

if [ "$SHELL" == "/bin/bash" ] || [ "$SHELL" == "/usr/bin/bash" ]; then
    echo ".bashrc"
elif [ "$SHELL" == "usr/bin/zsh" ]; then
    echo ".zshrc"
fi