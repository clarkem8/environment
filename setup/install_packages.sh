#!/bin/bash

# To install rlwrap AWS Linux 2 requires python3.6 to be installed
amazon-linux-extras enable python3
yum clean metadata
yum install python3-3.6.* --disablerepo=amzn2-core -y

# Install rlwrap
amazon-linux-extras enable epel
yum clean metadata
yum install -y epel-release

yum install git -y
yum install tmux -y
yum install rlwrap -y
yum install java -y
