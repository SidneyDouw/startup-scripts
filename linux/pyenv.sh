#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"



# change the working directory to the previous working directory
cd "$PPWD"