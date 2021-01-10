#!/bin/bash

sudo rm /usr/local/bin/piassist
rm -rf ~/Pi-Assistant || error "failed to remove Pi-Assistant folder!"
sudo rm -f ~/Desktop/system-tools.desktop || error "failed to remove desktop shortcut!"
sudo rm -f /usr/share/applications/system-tools.desktop || error "failed to remove menu button!"

read -p "Do you want to uninstall the dependencies (dialog, yad) (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt update; sudo apt purge dialog yad -y;;
  n|N ) echo "dependencies (dialog) won't be removed."; sleep 2;;
  * ) echo "invalid";;
esac

bold=$(tput bold)
normal=$(tput sgr0)
echo -e "\e[32mPi-Assistant removed:("
echo  -e "${bold}if Pi-Assistant didn't work for you \033[33;5;7mPLEASE\033[0m submit a bog report here:${normal}"
echo -e "\e[96mhttps://github.com/Botspot/pi-apps/issues/new\e[39m"