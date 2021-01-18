#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

#update function
function update {
   echo "Checking for updates..."
   cd $DIRECTORY
   localhash="$(git rev-parse HEAD)"
   latesthash="$(git ls-remote https://github.com/Itai-Nelken/Pi-Assistant HEAD | awk '{print $1}')"
   if [ "$localhash" != "$latesthash" ] && [ ! -z "$latesthash" ] && [ ! -z "$localhash" ];then
     echo "Out of date, updating now..."
     git clean -fd
     git reset --hard
     git pull https://github.com/Itai-Nelken/Pi-Assistant.git HEAD || error 'Unable to update, please check your internet connection'
   else
     echo "Up to date."
   fi
} 

#update function with no extra output
function update-no-output {
   cd $DIRECTORY
   localhash="$(git rev-parse HEAD)"
   latesthash="$(git ls-remote https://github.com/Itai-Nelken/Pi-Assistant HEAD | awk '{print $1}')"
   if [ "$localhash" != "$latesthash" ] && [ ! -z "$latesthash" ] && [ ! -z "$localhash" ];then
     git clean -fd
     git reset --hard
     git pull https://github.com/Itai-Nelken/Pi-Assistant.git HEAD || error 'Unable to update, please check your internet connection'
   else
     clear
     #print a "loading screen"
     echo "$(tput setaf 2)$(tput bold)LOADING...$(tput sgr 0)"
   fi

}

if [[ $1 = "--no-output" ]]; then
  update-no-output
else
  update
fi

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

rm ~/.local/share/applications/piassist.desktop
rm ~/Desktop/piassist.desktop

#update menu shortcut
echo "[Desktop Entry]
StartupNotify=true
Terminal=true
Type=Application
Name=Pi-Assistant
Exec="$HOME/Pi-Assistant/main.sh"
Icon="$HOME/Pi-Assistant/icons/64x64/logo-64.png"
Categories=Utility;
Comment="Pi-Assistant v1.2"" > ~/.local/share/applications/piassist.desktop
cp ~/.local/share/applications/piassist.desktop ~/Desktop/piassist.desktop

#echo "$(tput setaf 3)finished...$(tput sgr 0)"
