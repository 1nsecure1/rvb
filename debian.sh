#!/bin/bash

# Update the system and install required packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git python3 python3-dev python3-pip build-essential libssl-dev libffi-dev

# Install dependencies for Cowrie
sudo apt install -y python3-venv

# Install dependencies for Portspoof
sudo apt install -y automake gcc g++ libboost-dev libpcap-dev

# Clone repositories
git clone https://github.com/adhdproject/cowrie.git
git clone https://github.com/superswan/impostor.git
git clone https://github.com/thinkst/canarytokens.git
git clone https://github.com/drk1wi/portspoof.git

# Install and configure Cowrie
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install --upgrade -r requirements.txt
cp cowrie.cfg.dist cowrie.cfg
deactivate

# Install and configure Impostor
cd ../impostor
sudo python3 setup.py install

# Install and configure Canarytokens
cd ../canarytokens
sudo pip3 install -r requirements.txt
cd frontend && sudo pip3 install -r requirements.txt && cd ..
cp switchboard.env.dist switchboard.env
cp frontend.env.dist frontend.env

# Install and configure Portspoof
cd ../portspoof
./configure
make
sudo make install
sudo cp /usr/local/etc/portspoof.conf /etc/portspoof.conf

echo "Installation completed."
