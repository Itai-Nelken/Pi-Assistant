#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

cd $HOME
echo "cloning repo..."
git clone https://github.com/Itai-Nelken/Pi-Assistant.git

#variables for the main app folders. DIRECTORY is the main folder, APP is the apps folder ($DIRECTORY/apps)
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

#install dependencies for main menu windows and pop-up windows
echo "installing dependencies..."
if ! which yad > /dev/null; then
   sudo apt install -y yad
   #echo "installed">~/Pi-Assistant/data/yad
elif ! which dialog > /dev/null; then
   sudo apt install -y dialog
   #echo "installed">~/Pi-Assistant/data/dialog
elif ! which xdg-open > /dev/null; then
   sudo apt install -y xdg-utils
   #echo "installed">~/Pi-Assistant/data/xdg
else
    echo "dependencies already installed..."
fi
echo "dependencies installed..."

#create menu shortcut
echo "[Desktop Entry]
StartupNotify=true
Terminal=true
Type=Application
Name=Pi-Assistant
Exec="$HOME/Pi-Assistant/main.sh"
Icon="$HOME/Pi-Assistant/icons/64x64/logo-64.png"
Categories=Utility;
Comment="Pi-Assistant v1.2.1"" > ~/.local/share/applications/piassist.desktop
#copy menu shortcut to desktop
cp ~/.local/share/applications/piassist.desktop ~/Desktop/
sudo chmod +x ~/Desktop/piassist.desktop

#add startup from terminal using 'piassist'
echo "creating /usr/local/bin/piassist"
echo '#!/bin/bash
cd ~/Pi-Assistant
#flags
if  [[ $1 = "--version" ]] || [[ $1 == "-v" ]]; then
    ./main.sh --version
elif [[ $1 = "--secret" ]]; then
    ./main.sh --secret
elif [[ $1 = "--no-internet" ]] || [[ $1 == "-ni" ]]; then    
    ./main.sh --no-internet
elif [[ $1 = "--help" ]] || [[ $1 == "-h" ]]; then
    ./main.sh --help
elif [[ $1 = "--no-update" ]] || [[ $1 == "-nu" ]]; then
    ./main.sh --no-update
else
    clear && $HOME/Pi-Assistant/main.sh
fi' > ~/Downloads/piassist
sudo mv ~/Downloads/piassist /usr/local/bin/
sudo chmod +x /usr/local/bin/piassist

#mark all scripts as executables
echo "marking all scripts as executable..."
cd $DIRECTORY
sudo chmod +x main.sh
sudo chmod +x passwd.sh
sudo chmod +x systools.sh
sudo chmod +x other.sh
sudo chmod +x install.sh
sudo chmod +x update.sh
sudo chmod +x updater.sh
sudo chmod +x uninstall.sh
sudo chmod +x sys-info.sh
sudo chmod +x apps/appinstaller.sh
sudo chmod +x apps/gparted.sh
sudo chmod +x apps/chromium.sh
sudo chmod +x apps/firefox.sh
sudo chmod +x apps/blender.sh
sudo chmod +x apps/audacity.sh
sudo chmod +x apps/inkscape.sh
sudo chmod +x apps/snap.sh
sudo chmod +x apps/SSR.sh
sudo chmod +x apps/kdenlive.sh
sudo chmod +x apps/gsysmon.sh
sudo chmod +x apps/flatpak.sh
sudo chmod +x apps/etcher.sh
sudo chmod +x apps/zoom.sh
sudo chmod +x apps/box86.sh

#print in green 'installation succesful' and in orange how to run system tools
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
echo -e "$(tput setaf 3)to run Pi-Assistant, run the desktop shortcut or main menu>other>Pi-Assistant
or type 'piassist' in terminal. to see a list of all commands, run 'piassist --help' in terminal$(tput sgr 0)"
