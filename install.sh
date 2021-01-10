#!/bin/bash

#variables
#DIRECTORY="$HOME/Pi-Assistant"
#APPS="$HOME/Pi-Assistant/apps"
DIRECTORY="$HOME/Documents/github/Pi-Assistant(test)" #for testing purposes only
APPS="$HOME/Documents/github/Pi-Assistant(test)/apps" #for testing purposes only

cd $HOME
echo "cloning repo..."
#git clone https://github.com/Itai-Nelken/Pi-Assistant.git
git clone --single-branch --branch  dialog-gui-testing https://github.com/Itai-Nelken/Pi-Assistant.git #for testing purposes only

#install dependencies for main menu and pop-up windows
echo "installing dependencies..."
sudo apt update; sudo apt install dialog yad -y

#copy desktop shortcut to desktop and main menu
echo "copying desktop shortcut to Desktop..."
cp ~/Pi-Assistant/system-tools.desktop ~/Desktop || error "failed to create desktop shortcut!"
echo "adding desktop shortcut to main menu..."
sudo cp ~/Pi-Assistant/system-tools.desktop /usr/share/applications || error "failed to create menu shortcut!"

#add startup from terminal using 'piassist'
echo "creating /usr/local/bin/piassist"
echo "#!/bin/bash
#variables
#DIRECTORY="$HOME/Pi-Assistant"
#APPS="$HOME/Pi-Assistant/apps"
DIRECTORY="$HOME/Documents/github/Pi-Assistant(test)" #for testing purposes only
APPS="$HOME/Documents/github/Pi-Assistant(test)/apps" #for testing purposes only
clear && $DIRECTORY/main.sh" > ~/Downloads/piassist
sudo mv ~/Downloads/piassist /usr/local/bin/
cd /usr/local/bin
sudo chmod +x piassist

#mark all scripts as executables
echo "marking all scripts as executable..."
cd $DIRECTORY
sudo chmod +x main.sh
sudo chmod +x passwd.sh
sudo chmod +x systools.sh
sudo chmod +x other.sh
sudo chmod +x install.sh
sudo chmod +x update.sh
sudo chmod +x apps/appinstaller.sh
sudo chmod +x apps/gparted.sh
sudo chmod +x apps/chromium.sh
sudo chmod +x apps/firefox.sh
sudo chmod +x apps/blender.sh
sudo chmod +x apps/audacity.sh
sudo chmod +x apps/inkscape.sh
sudo chmod +x apps/snap.sh
sudo chmod +x apps/ssr.sh
sudo chmod +x apps/kdenlive.sh
sudo chmod +x apps/gsysmon.sh
sudo chmod +x apps/flatpak.sh
sudo chmod +x apps/etcher.sh
sudo chmod +x apps/zoom.sh
sudo chmod +x apps/box86.sh

#remove zoom.tar.xz as it isn't needed unless you install zoom, and the zoom installer downloads it.
echo "removing unended files..."
cd $DIRECTORY
rm -rf files

#print in green 'installation succesful' and in orange how to run system tools
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
echo "$(tput setaf 3)to run Pi-Assistant, run the desktop shortcut or main menu>other>Pi-Assistant  $(tput sgr 0)"