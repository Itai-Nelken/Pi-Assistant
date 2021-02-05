#!/bin/bash

function error() {
  echo -e "\e[91m$1\e[39m"
}

DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

#update function
function update() {
   echo "Checking for updates..."
   cd $DIRECTORY
   localhash="$(git rev-parse HEAD)"
   latesthash="$(git ls-remote https://github.com/Itai-Nelken/Pi-Assistant HEAD | awk '{print $1}')"
   if [ "$localhash" != "$latesthash" ] && [ ! -z "$latesthash" ] && [ ! -z "$localhash" ];then
     echo "Out of date, updating now..."
     git clean -fd
     git reset --hard
     git pull https://github.com/Itai-Nelken/Pi-Assistant.git HEAD || error 'Unable to update, please check your internet connection!'
     make-all-executable || error "Unable to mark all scripts as executables! Pi-Assistant won't work properly! please report this error."
     refresh-shortcuts || error "Failed to refresh menu and desktop shortcuts!"
   else
     echo "Up to date."
   fi
} 

#update function with no extra output
function update-no-output() {
   cd $DIRECTORY
   localhash="$(git rev-parse HEAD)"
   latesthash="$(git ls-remote https://github.com/Itai-Nelken/Pi-Assistant HEAD | awk '{print $1}')"
   if [ "$localhash" != "$latesthash" ] && [ ! -z "$latesthash" ] && [ ! -z "$localhash" ];then
     git clean -fd
     git reset --hard
     git pull https://github.com/Itai-Nelken/Pi-Assistant.git HEAD || error 'Unable to update, please check your internet connection'
     make-all-executable || error "Unable to mark all scripts as executables! Pi-Assistant won't work properly! please report this error."
     refresh-shortcuts || error "Failed to refresh menu and desktop shortcuts!"
   fi
}

#make all scripts executable function
function make-all-executable() {
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
}

#refresh menu and desktop shortcuts function
function refresh-shortcuts() {
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
  Comment="Pi-Assistant v1.2.1"" > ~/.local/share/applications/piassist.desktop
  cp ~/.local/share/applications/piassist.desktop ~/Desktop/piassist.desktop
  sudo chmod +x ~/Desktop/piassist.desktop

  sudo rm /usr/local/bin/piassist
  #update startup from terminal using 'piassist'
  echo '#!/bin/bash
  cd ~/Pi-Assistant
  #flags
  if  [[ $1 = "--version" ]]; then
      echo -e "$(tput bold)$(tput setaf 4)Pi-Assistant\nv1.2.1\nby Itai Nelken$(tput sgr 0)"
      exit
  elif [[ $1 = "--secret" ]]; then
      xdg-open ~/Pi-Assistant/icons/ascii-art.html
      sleep 10
      clear
      read -p "press [ENTER] to exit"
      exit
  elif [[ $1 = "--no-internet" ]]; then    
      ./main.sh --no-internet
  elif [[ $1 = "--help" ]]; then
      ./main.sh --help
  elif [[ $1 = "--no-update" ]]; then
      ./main.sh --no-update
  else
      clear && $HOME/Pi-Assistant/main.sh
  fi' > ~/Downloads/piassist
  sudo mv ~/Downloads/piassist /usr/local/bin/
  sudo chmod +x /usr/local/bin/piassist
}

#ask to restart Pi-Assistant to apply update, press enter to exit function.
function ask-exit() {
  echo "You have to restart Pi-Assistant to apply the Update."
  read -p "press [ENTER] to exit."
  exit 1
}

# flags. default is to update with extra output and ask to exit.
if [[ "$1" == "--no-output" ]]; then
  update-no-output
  ask-exit
elif [[ "$1" == "--no-ask-exit-output" ]]; then
  update-no-output
elif [[ "$1" == "--output-no-ask-exit" ]]; then
  update
else
  update
  ask-exit
fi


#echo "$(tput setaf 3)finished...$(tput sgr 0)"
