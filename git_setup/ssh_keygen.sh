#!/bin/bash

# $1 - Name
# $2 - email

ssh-keygen -t rsa -b 4096 -f ~/.ssh/github.key
echo "Host github.com" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/github.key" >> ~/.ssh/config

chmod -R 600 ~/.ssh/*

git config --global user.name $1
git config --global user.email $2

# The public ssh key needs to be copied into your github project
