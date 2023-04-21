@echo off

set "TARGET_DIR=%USERPROFILE%\Downloads\"

echo Installing 7-Zip...
curl -Lo 7z.exe https://www.7-zip.org/a/7z2103-x64.exe
start /wait 7z.exe /S

echo Installing Git...
curl -Lo git.zip https://github.com/git-for-windows/git/releases/download/v2.33.1.windows.1/MinGit-2.33.1-64-bit.zip
7z x git.zip -o"%USERPROFILE%\Downloads"
set "PATH=%PATH%;%USERPROFILE%\Downloads\cmd;"

echo Installing Python...
curl -Lo python.exe https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe
start /wait python.exe /quiet InstallAllUsers=1 PrependPath=1 TargetDir=C:\Python310
set "PATH=%PATH%;C:\Python310;C:\Python310\Scripts;"

echo Downloading Cowrie...
git clone https://github.com/adhdproject/cowrie.git "%TARGET_DIR%cowrie"

echo Downloading Impostor...
git clone https://github.com/superswan/impostor.git "%TARGET_DIR%impostor"

echo Downloading Canarytokens...
git clone https://github.com/thinkst/canarytokens.git "%TARGET_DIR%canarytokens"

echo Downloading Portspoof...
git clone https://github.com/drk1wi/portspoof.git "%TARGET_DIR%portspoof"

echo Installing Cowrie...
cd "%TARGET_DIR%cowrie"
python setup.py install

echo Installing Impostor...
cd "%TARGET_DIR%impostor"
python setup.py install

echo Installing Canarytokens...
cd "%TARGET_DIR%canarytokens"
python setup.py install

echo Installing Portspoof...
cd "%TARGET_DIR%portspoof"
make
make install

echo Done.
