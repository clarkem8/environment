#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

# Add user
useradd $USER

if [[ "$CF_INSTALL" == "Yes" ]];then
    # Install git and clone repo
    yum install git -y
    GIT_REPO=environment
    export GIT_PATH=/home/$USER/github/$GIT_REPO
    echo "Git path is - $GIT_PATH"
    sudo -i -u $USER git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH

    # Install packages and run user install
    $GIT_PATH/setup/install_packages.sh
    sudo -i -u $USER $GIT_PATH/setup/user_setup.sh
else
    # Install packages
    $base_path/install_packages.sh
    
    # Run user setup script
    sudo -i -u $USER $base_path/user_setup.sh
fi
