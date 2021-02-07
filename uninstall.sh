#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

sudo rm /usr/local/bin/piassist
sudo rm -f ~/Desktop/piassist.desktop || error "failed to remove desktop shortcut!"
sudo rm -f ~/.local/share/applications/piassist.desktop || error "failed to remove menu button!"

read -p "Do you want to uninstall the dependencies (dialog, yad) (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt purge dialog yad -y;;
  n|N ) echo "dependencies (dialog, yad) won't be removed."; sleep 2;;
  * ) echo "invalid";;
esac

rm -rf ~/Pi-Assistant || error "failed to remove Pi-Assistant folder!"
echo -e "${bold}Pi-Assistant removed:(${normal}"
echo  -e "${bold}if Pi-Assistant didn't work for you${normal} \033[33;5;7mPLEASE\033[0m ${bold}submit a bug report here:${normal}"
echo -e "\e[96mhttps://github.com/Itai-Nelken/Pi-Assistant/issues/new\e[39m"
read -n 1 -s -r -p "Press any key to exit">/dev/null