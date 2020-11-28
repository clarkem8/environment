#!/bin/bash
echo "Running create AMI script"

#s3_bucket="clarkem8-dev-store"
base_path=echo $(dirname $0)

# Source utils script
source "$base_path/../aws/utils.sh"
INSTANCE_NAME=echo $(get_ec2_tag Name)
echo "Instance name is - $INSTANCE_NAME"

# Get Ec2 instance tags
export GIT_REPO=environments
export GIT_USER=clarkem8
export USER=clarkem8
export INSTALL_TEST=Yes

# Add user
useradd $USER

# Setup user profile
sudo -i -u $USER $GIT_PATH/AMI/profile_setup.sh

if [[ "$INSTALL_FROM_S3" =~ "True" ]]; then
    echo "Installing from S3"
    # Download packages from S3 and install
    # path=echo $(dirname $0)
    # chmod 755 $path/install_packages.sh
    # $path/install_packages.sh
else
    yum install git -y
    GIT_PATH=/home/$USER/github/$GIT_REPO
    echo "Git path is - $GIT_PATH"
    sudo -i -u $USER git clone "https://github.com/$GIT_USER/$GIT_REPO.git" $GIT_PATH
    chmod 755 $GIT_PATH/AMI/install_packages.sh

    # Install packages
    $GIT_PATH/AMI/install_packages.sh

    # Install miniconda and run conda init post install
    chmod 755 $GIT_PATH/conda_envs/miniconda_install.sh
    sudo -i -u $USER $GIT_PATH/conda_envs/miniconda_install.sh
    sudo -i -u $USER /home/$USER/miniconda/bin/conda init
fi

# Configure aws cli
sudo -i -u $USER $GIT_PATH/AMI/configure_aws_cli.sh

if [[ $INSTALL_TEST =~ "Yes" ]]; then
    # Install test conda environment
    chmod 755 $GIT_PATH/conda_envs/create_env.sh
    sudo -i -u $USER $GIT_PATH/conda_envs/create_env.sh $GIT_PATH/conda_envs/yaml_files/test.yml
fi
