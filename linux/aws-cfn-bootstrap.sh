#!/bin/bash

set -xe

PPWD=$(pwd)

HOME="/home/ubuntu/"
cd "$HOME"

wget https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-py3-latest.tar.gz
tar -zxvf aws-cfn-bootstrap-py3-latest.tar.gz

cd aws-cfn-bootstrap-*
sudo easy_install .

sudo ln -s /root/aws-cfn-bootstrap-latest/init/ubuntu/cfn-hup /etc/init.d/cfn-hup

# change the working directory to the previous working directory
cd "$PPWD"