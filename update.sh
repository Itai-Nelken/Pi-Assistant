#!/bin/bash   

echo you might see some errors if snap-store is not installed
sleep 2
sudo apt update || error "error occured! are you connected to the internet?"
sleep 2
clear
echo when asked if you want to continue press 'y' followed by 'Enter'
read -p "Press [Enter] to continue..."

sudo apt upgrade || error "error occured are you connected to the internet?"
sleep 2
sudo snap refresh snap-store || error "snapd or snap-store not installed"
sleep 1
clear
echo system updated✅️
         
