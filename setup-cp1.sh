#!/bin/sh

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

pushd ~

git clone https://github.com/pinkertoncs/cloud9-vnc.git

pushd cloud9-vnc

./install.sh

echo alias c9vnc=/opt/c9vnc/c9vnc.sh >> ~/.bash_aliases

popd
popd