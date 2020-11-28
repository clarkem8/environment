#!/bin/bash

source $HOME/.env_vars

get_ec2_tag () {
    tag_key=$1
    aws ec2 describe-tags \
        --filter "Name=resource-id,Values=$INSTANCEID" | python -c \
            "import sys; import json; print(''.join(x['Value'] for x in json.load(sys.stdin)['Tags'] if x['Key'] == '$tag_key'))"
}

get_all_ec2_tags () {
    aws ec2 describe-tags \
        --filter "Name=resource-id,Values=$INSTANCEID" | python -c \
            "import sys; import json; print(' '.join(x['Key'] for x in json.load(sys.stdin)['Tags']))"
}
