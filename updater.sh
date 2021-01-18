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

sudo rm /usr/local/bin/piassist
#update startup from terminal using 'piassist'
echo '#!/bin/bash
#flags
if  [[ $1 = "--version" ]]; then
    clear
    echo -e "$(tput bold)$(tput setaf 4)Pi-Assistant\nv1.2\nby Itai Nelken$(tput sgr 0)"
    read -p "press [ENTER] to exit..."
    exit
elif [[ $1 = "--secret" ]]; then
    xdg-open ~/Pi-Assistant/icons/ascii-art.html
    sleep 10
    clear
    read -p "press [ENTER] to exit"
    exit
elif [[ $1 = "--no-internet" ]]; then    
    INTERNETCHECK=1
elif [[ $1 = "--help" ]]; then
    echo -e "
    $(tput setaf 6)$(tput bold)usage:$(tput sgr 0)
    piassist [flag]
   $(tput setaf 6)$(tput bold)available flags:$(tput sgr 0)
   --no-internet - dont check for internet connection on startup .
   --version - show version and exit.
   --secret - secret easter egg.
   --help - show this help info and exit.
   $(tput setaf 6)$(tput bold)example:$(tput sgr 0)
   piassist --secret
   "
   #read -p "press [ENTER] to exit..."
   exit
fi
clear && $HOME/Pi-Assistant/main.sh' > ~/Downloads/piassist
sudo mv ~/Downloads/piassist /usr/local/bin/
sudo chmod +x /usr/local/bin/piassist

#echo "$(tput setaf 3)finished...$(tput sgr 0)"
