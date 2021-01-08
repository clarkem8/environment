#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))
GIT_PATH="$base_path/../.."

## Configure aws cli
# Find aws region and instance id from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 12-20)
INSTANCEID=$(/opt/aws/bin/ec2-metadata |grep instance-id| cut -c 14-80)
echo "INSTANCEID=$INSTANCEID" >> $HOME/.env_vars
echo "REGION=$REGION" >> $HOME/.env_vars

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=$REGION" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config


# Export TAGS to .env_vars
$base_path/export_tags.sh
echo "GIT_PATH=$GIT_PATH" >> $HOME/.env_vars
source $HOME/.env_vars

# Setup user profile
$base_path/profile_setup.sh

# Clone git repo
if [[ ! -d $GIT_PATH ]]; then
    echo "Git path is - $GIT_PATH"
    git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
fi

# Install miniconda and initialise
$base_path/miniconda_install.sh
/home/$USER/miniconda/bin/conda init
