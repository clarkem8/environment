#!/bin/bash
  
# Download miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P $HOME/installs/
chmod 755 $HOME/installs/*

# Install miniconda
# -p to install into particular directory
# -b to install in batch and agree to terms
# -u to update an existing install if it exists
$HOME/installs/Miniconda3-latest-Linux-x86_64.sh -b -u -p $HOME/miniconda
