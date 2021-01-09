#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

sudo rm /usr/local/bin/piassist
rm -rf ~/Pi-Assistant || error "failed to remove Pi-Assistant folder!"
sudo rm -f ~/Desktop/system-tools.desktop || error "failed to remove desktop shortcut!"
sudo rm -f /usr/share/applications/system-tools.desktop || error "failed to remove menu button!"

read -p "Do you want to uninstall the dependencies (dialog) (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt update; sudo apt purge dialog -y
  n|N ) echo "dependencies (dialog) won't be removed."; sleep 2   ;;
  * ) echo "invalid";;
esac

echo "$(tput setaf 3)system-tools removed:($(tput sgr 0)"
