#!/bin/bash

# Update the system and install required packages
sudo yum update -y
sudo yum install -y git epel-release

# Install dependencies for Cowrie
sudo yum install -y python36 python36-devel python36-pip
sudo pip3.6 install --upgrade pip
sudo pip3.6 install virtualenv

# Install dependencies for Portspoof
sudo yum install -y automake gcc-c++ boost-devel libpcap-devel

# Clone repositories
git clone https://github.com/adhdproject/cowrie.git
git clone https://github.com/superswan/impostor.git
git clone https://github.com/thinkst/canarytokens.git
git clone https://github.com/drk1wi/portspoof.git

# Install and configure Cowrie
cd cowrie
virtualenv --python=python3.6 cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install --upgrade -r requirements.txt
cp cowrie.cfg.dist cowrie.cfg
deactivate

# Install and configure Impostor
cd ../impostor
sudo python setup.py install

# Install and configure Canarytokens
cd ../canarytokens
sudo pip install -r requirements.txt
cd frontend && sudo pip install -r requirements.txt && cd ..
cp switchboard.env.dist switchboard.env
cp frontend.env.dist frontend.env

# Install and configure Portspoof
cd ../portspoof
./configure
make
sudo make install
sudo cp /usr/local/etc/portspoof.conf /etc/portspoof.conf

echo "Installation completed."
