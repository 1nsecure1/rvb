# InstallRepositories.ps1

# Install required packages
Write-Host "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Host "Installing Git, Python, and Visual Studio Build Tools..."
choco install -y git python --version=3.6.8 visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64"

# Update PATH
$Env:Path += ";C:\Python36;C:\Python36\Scripts;C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\*\bin\Hostx64\x64"

# Clone repositories
Write-Host "Cloning repositories..."
git clone https://github.com/adhdproject/cowrie.git
git clone https://github.com/superswan/impostor.git
git clone https://github.com/thinkst/canarytokens.git
git clone https://github.com/drk1wi/portspoof.git

# Install and configure Cowrie
Write-Host "Installing and configuring Cowrie..."
cd cowrie
python -m pip install --upgrade pip
python -m pip install virtualenv
python -m virtualenv cowrie-env
.\cowrie-env\Scripts\activate
python -m pip install --upgrade -r requirements.txt
cp cowrie.cfg.dist cowrie.cfg
deactivate

# Install and configure Impostor
Write-Host "Installing and configuring Impostor..."
cd ..\impostor
python setup.py install

# Install and configure Canarytokens
Write-Host "Installing and configuring Canarytokens..."
cd ..\canarytokens
python -m pip install -r requirements.txt
cd frontend
python -m pip install -r requirements.txt
cd ..
cp switchboard.env.dist switchboard.env
cp frontend.env.dist frontend.env

# Install and configure Portspoof (manual compilation is required, refer to Portspoof documentation)
Write-Host "Portspoof requires manual compilation on Windows. Please refer to the Portspoof documentation for further instructions."

Write-Host "Installation completed."
