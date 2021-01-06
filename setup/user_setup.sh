#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))
GIT_PATH="$base_path/../.."

## Configure aws cli
# Find aws region from metadata
REGION=$(/opt/aws/bin/ec2-metadata |grep placement|cut -c 12-20)
echo "REGION=$REGION" >> $HOME/.env_vars

mkdir $HOME/.aws
echo "[default]" >> $HOME/.aws/config
echo "region=$REGION" >> $HOME/.aws/config
echo "output=json" >> $HOME/.aws/config


# Export TAGS to .env_vars
$base_path/export_tags.sh
source $HOME/.env_vars

# Setup user profile
$base_path/profile_setup.sh

# Clone git repo
echo "GIT_PATH=$GIT_PATH" >> $HOME/.env_vars
if [[ ! -d $GIT_PATH ]]; then
    echo "Git path is - $GIT_PATH"
    git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
fi

# Install miniconda and initialise
$base_path/miniconda_install.sh
/home/$USER/miniconda/bin/conda init

if [[ $INSTALL_TEST == "Yes" ]]; then
    # Install test conda environment
    $GIT_PATH/conda_envs/create_env.sh $GIT_PATH/conda_envs/yaml_files/test.yml
fi
