#!/bin/bash


cd ~/system-tools || error "Failed to change to /home/pi/system-tools"
sudo chmod +x system-tools-v1.1.1.sh || error "failed to mark system-tools-v1.1.1.sh as executable!"
sudo chmod +x updater.sh || error "failed to mark updater.sh as executable!"
sudo chmod +x other.sh || error "failed to mark other.sh as executable!"
sudo chmod +x uninstall.sh || error "failed to mark uninstall.sh as executable!"
sudo chmod +x install2.sh || error "failed to mark install2.sh as executable!"
./install2.sh || error "failed to run install2.sh!"
echo "$(tput setaf 2)recovery succesful! $(tput sgr 0)"
echo exiting in 5 seconds...
sleep 5
exit
