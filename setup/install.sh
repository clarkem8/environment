#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

# Add user
useradd $USER

GIT_REPO=environment

# Install git and clone repo
yum install git -y
export GIT_PATH=/home/$USER/github
echo "Git path is - $GIT_PATH"
sudo -i -u $USER git clone "https://github.com/clarkem8/$GIT_REPO.git" $GIT_PATH/$GIT_REPO

# Install packages and run user install
$GIT_PATH/$GIT_REPO/setup/install_packages.sh
sudo -i -u $USER $GIT_PATH/$GIT_REPO/setup/user_setup.sh
