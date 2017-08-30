#!/bin/bash

# ----------------------------------------------------------------------------
#
# Setup script for Pinkerton Academy Computer Programming 2
# cloud 9 environment
#
# Author: M.B. Kulik
# date: 08/2017
#
# ----------------------------------------------------------------------------

# add oracle java ppa
sudo add-apt-repository -y  ppa:webupd8team/java

# update package repos
sudo apt update

# install required debian packages

# setup quiet acceptance of oracle java license
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections

sudo apt install -y oracle-java8-installer


# install required java libs
if [ ! -d "$HOME/lib/" ]
then
  mkdir $HOME/lib
fi

pushd $HOME/lib
wget http://central.maven.org/maven2/junit/junit/4.12/junit-4.12.jar
wget http://central.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar
popd

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
if [ ! -d "$HOME/workspace/cp2-workspace/" ]
then
    git clone https://github.com/pinkertoncs/cp2-workspace.git $HOME/workspace/cp2-workspace

    # add alias for updatinng class sources
    echo 'alias update-cp2=pushd $HOME/workspace/cp2-workspace;git pull;popd' >> $HOME/.bash_aliases
fi

# go home
cd $HOME
