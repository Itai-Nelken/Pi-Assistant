#!/bin/bash  

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo you might see some errors if snap-store is not installed
sleep 2
sudo apt update || error "error occured! are you connected to the internet?"
sleep 2
clear

sudo apt full-upgrade -y || error "error occured are you connected to the internet?"
sleep 2
sudo snap refresh snap-store || error "snapd or snap-store not installed"
sleep 1
clear
echo system updated✅️
         
