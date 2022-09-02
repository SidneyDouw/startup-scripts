#!/bin/bash

set -e

if [[ -z $1 ]]; then
    echo "please specify an 'author/repository' to look up"
    exit
fi

version=$(basename "$(curl -fs -o/dev/null -w '%{redirect_url}' https://github.com/"$1"/releases/latest)")

if [[ -z $version ]]; then
    echo "could not find latest version of $1"
    exit
fi

echo "using version $version of $1" >&2

echo "$version"
