#!/bin/bash

set -e

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

# Arguments

dry_run=false
nvm_version=$(./util/git_latest_version.sh nvm-sh/nvm)
node_version="node"

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            echo
            echo "Installs the latest versions of nvm and node"
            echo 
            echo "Usage:"
            echo
            echo "  -h|--help         Prints this message."
            echo "  -d|--dry-run      Runs the script without installing anything."
            echo "  --nvm             Version of nvm to use, e.g. 'v0.39.1' or '--lts'. Defaults to the latest version."
            echo "  --node            Version of node to use, e.g. 'v16.17.0'. Defaults to the latest version."
            exit
            ;;
        -d|--dry-run)
            dry_run=true
            shift
            ;;
        --nvm)
            nvm_version=$2
            shift
            shift
            ;;
        --node)
            node_version=$2
            shift
            shift
            ;;
        *)
            echo "Unknown option $1"
            exit 1
            ;;
    esac
done

# Install NVM

echo "Installing NVM version $nvm_version to $HOME/.nvm"

if ! [[ $dry_run ]]; then
    cd "$HOME"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


# Install Node

echo "Installing Node version $node_version"

if ! [[ $dry_run ]]; then
    nvm install "$node_version"
fi

# change the working directory to the previous working directory
cd "$PPWD"