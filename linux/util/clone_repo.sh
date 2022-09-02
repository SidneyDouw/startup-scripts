#!/bin/bash

# for now only public repositories work

set -e

# Parameters

positional_args=()

git_repo=""
target_dir="."

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            echo
            echo "clones a repository into a given directory"
            echo 
            echo "Usage:"
            echo
            echo "./clone_repo.sh [options] 'owner/repository' 'path/to/target/dir'"
            echo
            echo "  -h|--help               Prints this message."
            echo "  -t|--target-dir         The directory to clone the repository into. This overrides the positional arguments if both are given."
            exit
            ;;
        -t|--target-dir)
            target_dir=$2
            shift
            shift
            ;;
        -*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            positional_args+=("$1")
            shift
            ;;
    esac
done

git_repo=${positional_args[0]}
target_dir_positional=${positional_args[1]}

if [[ -z $git_repo ]]; then
    echo "please specify a repository to clone"
    exit
fi

if [[ $target_dir_positional ]]; then
    if [[ $target_dir == "." ]]; then
        target_dir=$target_dir_positional
    fi
fi

# Clone the repository

git clone "https://github.com/$git_repo" "$target_dir"