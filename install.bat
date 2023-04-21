# Install curl
powershell.exe -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
choco install curl -y

# Install Git for Windows
curl -LO https://github.com/git-for-windows/git/releases/download/v2.31.1.windows.1/Git-2.31.1.1-64-bit.exe
7z x Git-2.31.1.1-64-bit.exe -oGitSetup
./GitSetup/git-bash.exe ./GitSetup/setup-x86_64.exe /SP- /VERYSILENT /NORESTART

# Install Python 3.10
curl -LO https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe
./python-3.10.0-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

# Install 7-Zip
curl -LO https://www.7-zip.org/a/7z2104-x64.exe
7z x 7z2104-x64.exe -o7zSetup
./7zSetup/7z1900-x64.exe /S

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
