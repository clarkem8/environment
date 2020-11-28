#!/bin/bash

ssh-keygen -t rsa -b 4096 -f ~/.ssh/github.key
echo "Host github.com" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/github.key" >> ~/.ssh/config

chmod -R 600 ~/.ssh/*

# The public ssh key needs to be copied into your github project
