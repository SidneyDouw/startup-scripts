#!/bin/bash

set -xe

if [[ $SHELL == "/usr/bin/zsh" ]]; then
    if [[ -f "$HOME/.bashrc" ]]; then
        source "$HOME/.zshrc"
    else
        echo ".zshrc file not found"
    fi
fi

if [[ $SHELL == "/bin/bash" ]]; then
    if [[ -f "$HOME/.bashrc" ]]; then
        source "$HOME/.bashrc"
    elif [[ -f "$HOME/.bash_profile" ]]; then
        source "$HOME/.bash_profile"
    else
        echo ".bashrc and .bash_profile files not found"
    fi
fi