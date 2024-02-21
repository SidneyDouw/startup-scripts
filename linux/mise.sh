#!/bin/bash

set -xe

curl https://mise.run | sh

# check if .zshrc file exists
if [ -f ~/.zshrc ]; then
    echo '# mise setup' >> ~/.zshrc
    echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc
else
    echo '# mise setup' >> ~/.bashrc
    echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
fi