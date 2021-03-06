#!/bin/bash

echo "Running $0"
base_path=$(dirname $(readlink -f $0))
source $HOME/.env_vars

# Add git bach function to .bash_profile
echo "" >> $HOME/.bash_profile
echo "parse_git_branch() {" >> $HOME/.bash_profile
echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'" >> $HOME/.bash_profile
echo "}" >> $HOME/.bash_profile
echo 'export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "' >> $HOME/.bash_profile
echo "" >> $HOME/.bash_profile

echo "source $HOME/.env_vars" >> $HOME/.bash_profile

# Setup vim
echo "coping $GIT_PATH/environment/vim/.vimrc to $HOME/.vimrc"
cp $GIT_PATH/environment/vim/.vimrc $HOME/.vimrc
$GIT_PATH/environment/vim/vundle.sh
