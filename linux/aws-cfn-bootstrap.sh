#!/bin/bash

set -xe

PPWD=$(pwd)

cd "/home/ubuntu/"

wget https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-py3-latest.tar.gz
tar -zxvf aws-cfn-bootstrap-py3-latest.tar.gz
rm aws-cfn-bootstrap-py3-latest.tar.gz

sudo apt -y install python3 python3-pip

cd aws-cfn-bootstrap-*
sudo pip install .

sudo ln -s /root/aws-cfn-bootstrap-latest/init/ubuntu/cfn-hup /etc/init.d/cfn-hup

# change the working directory to the previous working directory
cd "$PPWD"