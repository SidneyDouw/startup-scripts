#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

# Arguments

dry_run="false"
node_version="node"

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            echo
            echo "Installs the latest (or given) version node via nvm"
            echo 
            echo "Usage:"
            echo
            echo "  -h|--help         Prints this message."
            echo "  -d|--dry-run      Runs the script without installing anything."
            echo "  --node            Version of node to use, e.g. 'v16.17.0'. Defaults to the latest version."
            exit
            ;;
        -d|--dry-run)
            dry_run="true"
            shift
            ./util/prepare_dryrun.sh
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

# Setup

rc_file=$(./util/find_rc_file.sh)
source "$HOME/$rc_file"

# Install Node

echo "Installing Node version $node_version"

if [[ $dry_run == "false" ]]; then
    [ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"  # This loads nvm
    nvm install "$node_version"
    nvm use "$node_version"
fi

# change the working directory to the previous working directory
cd "$PPWD"