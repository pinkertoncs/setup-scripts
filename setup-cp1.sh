#!/bin/bash

# ----------------------------------------------------------------------------
#
# Setup script for Pinkerton Academy Computer Programming 1 
# cloud 9 environment
# 
# Author: M.B. Kulik
# date: 08/2017
#
# ----------------------------------------------------------------------------

# update package repos
sudo apt update

# install required debian packages

sudo apt install -y python3-tk
sudo apt install -y python3-matplotlib
sudo apt install -y python3-pip

# install required python pip packages

pip3 install --user guizero

# setup c9vnc

# clone our forked cloud9 vnc repo
if [ ! -d "$HOME/cloud9-vnc/" ]
then
    git clone https://github.com/pinkertoncs/cloud9-vnc.git $HOME/cloud9-vnc
    cd $HOME/cloud9-vnc
    sudo ./install.sh
    echo 'alias c9vnc=/opt/c9vnc/c9vnc.sh' >> $HOME/.bash_aliases
fi

# clone the computer programming 1 workspace
if [ ! -d "$HOME/workspace/cp1-workspace/" ]
then
    git clone https://github.com/pinkertoncs/cp1-workspace.git $HOME/workspace/cp1-workspace

    # add alias for updatinng class sources
    echo 'alias update-cp1="pushd $HOME/workspace/cp1-workspace;git pull;popd"' >> $HOME/.bash_aliases    
fi

# go home
cd $HOME
