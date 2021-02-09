#!/bin/bash  

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

function error {
  echo -e "\\e[91m$1\\e[39m"
}

sudo apt update --fix-missing || error "failed to update repos!"
sudo apt upgrade -y || error "error occured are you connected to the internet?"
echo -en && sudo apt install -f && sudo dpkg --configure -a
sudo apt autoremove -y
sleep 2
clear

if [ ! -f /usr/bin/snap ];then
  sleep 0.001
else
  echo "updating snap-store and snap core"
  sudo snap refresh snap-store || error "Failed to update snap-store!"
  sudo snap refresh core || error "Failed to update snap core!"
fi

sleep 1
clear
echo "system updated"
sleep 2
clear