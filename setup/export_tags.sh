#!/bin/bash -x

echo "Running $0"
base_path=$(dirname $(readlink -f $0))

# Source utils script
source $base_path/../aws/utils.sh

#Get all tags for EC2 instance
tags=$(get_all_ec2_tags)

# Echo each tag to env_vars
for t in $tags;do
    echo "Found tag $tag"
    tag=$(get_ec2_tag $t)
    if [[ "$tag" != "aws"* ]]; then
        echo "$t=$tag" >> $HOME/.env_vars
    fi
done
