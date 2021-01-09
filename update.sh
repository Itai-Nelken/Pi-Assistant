#!/bin/bash  

function error {
  echo -e "\\e[91m$1\\e[39m"
}

sudo apt update || error "error occured! are you connected to the internet?"
sleep 2
clear

sudo apt upgrade -y || error "error occured are you connected to the internet?"
sleep 2

if [ ! -f /usr/bin/snap ];then
  echo " "
else
  echo "updating snap-store"
  sudo snap refresh snap-store || error "Failed to update snap-store!"
fi

sleep 1
clear
echo "system updated"