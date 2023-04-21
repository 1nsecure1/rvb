#!/bin/bash

# Check if the script is being run on a Linux machine
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Navigate to the directory where you want to download the repositories
    cd ~
    
    # Install git if it is not already installed
    if ! [ -x "$(command -v git)" ]; then
        sudo apt-get update
        sudo apt-get install git -y
    fi
    
    # Clone the impostor repository
    git clone https://github.com/superswan/impostor.git
    cd impostor
    
    # Install the necessary dependencies for impostor
    sudo apt-get install build-essential libsdl2-dev -y
    
    # Build the impostor executable
    make
    
    # Set the necessary permissions to run the impostor executable
    chmod +x impostor
    
    # Navigate back to the home directory
    cd ~
    
    # Clone the cowrie repository
    git clone https://github.com/adhdproject/cowrie.git
    
    # Clone the canarytokens repository
    git clone https://github.com/thinkst/canarytokens.git
    
    # Clone the portspoof repository
    git clone https://github.com/drk1wi/portspoof.git
    
# Check if the script is being run on a Windows machine
elif [[ "$OSTYPE" == "msys"* ]]; then
    # Navigate to the directory where you want to download the repositories
    cd ~
    
    # Install Git for Windows if it is not already installed
    if ! [ -x "$(command -v git)" ]; then
        curl -o Git-2.32.0.2-64-bit.exe https://github.com/git-for-windows/git/releases/download/v2.32.0.windows.2/Git-2.32.0.2-64-bit.exe
        ./Git-2.32.0.2-64-bit.exe /SP- /VERYSILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /NORESTART
        rm Git-2.32.0.2-64-bit.exe
    fi
    
    # Clone the impostor repository
    git clone https://github.com/superswan/impostor.git
    cd impostor
    
    # Install the necessary dependencies for impostor using the Git Bash terminal
    pacman -S mingw-w64-x86_64-make mingw-w64-x86_64-SDL2
    
    # Build the impostor executable
    mingw32-make
    
    # Set the necessary permissions to run the impostor executable
    chmod +x impostor.exe
    
    # Navigate back to the home directory
    cd ~
    
    # Clone the cowrie repository
    git clone https://github.com/adhdproject/cowrie.git
    
    # Clone the canarytokens repository
    git clone https://github.com/thinkst/canarytokens.git
    
    # Clone the portspoof repository
    git clone https://github.com/drk1wi/portspoof.git
    
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi
