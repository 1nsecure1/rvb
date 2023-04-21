# Install Git for Windows
Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.31.1.windows.1/Git-2.31.1.1-64-bit.exe -OutFile Git-2.31.1.1-64-bit.exe
New-Item -ItemType Directory -Path GitSetup
7z x Git-2.31.1.1-64-bit.exe -o GitSetup
Start-Process -FilePath GitSetup\git-bash.exe -ArgumentList GitSetup\setup-x86_64.exe,'/SP-','/VERYSILENT','/NORESTART' -Wait

# Install Python 3.10
Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe -OutFile python-3.10.0-amd64.exe
Start-Process -FilePath python-3.10.0-amd64.exe -ArgumentList '/quiet','InstallAllUsers=1','PrependPath=1' -Wait

# Install 7-Zip
Invoke-WebRequest -Uri https://www.7-zip.org/a/7z2104-x64.exe -OutFile 7z2104-x64.exe
New-Item -ItemType Directory -Path 7zSetup
7z x 7z2104-x64.exe -o 7zSetup
Start-Process -FilePath 7zSetup\7z1900-x64.exe -ArgumentList '/S' -Wait

# Install Canarytokens
git clone https://github.com/thinkst/canarytokens.git

# Install Cowrie
git clone https://github.com/adhdproject/cowrie.git

# Install Impostor
git clone https://github.com/superswan/impostor.git

# Install Portspoof
git clone https://github.com/drk1wi/portspoof.git
cd portspoof
./configure
make
sudo make install
