# Install Git
Write-Host "Installing Git..."
Start-Process -FilePath "https://github.com/git-for-windows/git/releases/download/v2.32.0.windows.2/Git-2.32.0.2-64-bit.exe" -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART" -Wait

# Install Python
Write-Host "Installing Python..."
Start-Process -FilePath "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe" -ArgumentList "/quiet", "TargetDir=C:\Python39" -Wait

# Define the URLs of the GitHub repositories
$cowrieUrl = "https://github.com/adhdproject/cowrie.git"
$impostorUrl = "https://github.com/superswan/impostor.git"
$canarytokensUrl = "https://github.com/thinkst/canarytokens.git"
$portspoofUrl = "https://github.com/drk1wi/portspoof.git"

# Define the installation paths for each program
$cowriePath = "C:\Program Files\Cowrie"
$impostorPath = "C:\Program Files\Impostor"
$canarytokensPath = "C:\Program Files\Canarytokens"
$portspoofPath = "C:\Program Files\Portspoof"

# Clone the repositories from GitHub
Write-Host "Cloning GitHub repositories..."
git clone $cowrieUrl $cowriePath
git clone $impostorUrl $impostorPath
git clone $canarytokensUrl $canarytokensPath
git clone $portspoofUrl $portspoofPath

# Install each program
Write-Host "Installing programs..."
cd $cowriePath
python setup.py install
cd $impostorPath
python setup.py install
cd $canarytokensPath
python setup.py install
cd $portspoofPath
./configure
make
make install

Write-Host "Installation complete."
