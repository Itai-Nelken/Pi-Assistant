#!/bin/bash

#copy desktop shortcut to desktop and main menu
cp ~/system-tools/system-tools.desktop ~/Desktop || error "failed to create desktop shortcut!"
sudo cp ~/system-tools/system-tools.desktop /usr/share/applications || error "failed to create menu shortcut!"

#mark as executable some neded scripts
cd ~/system-tools || error "Failed to change to /home/pi/system-tools"
sudo chmod +x system-tools-v1.1.1.sh || error "failed to mark system-tools-v1.1.1.sh as executable!"

sudo chmod +x other.sh || error "failed to mark other.sh as executable!"
sudo chmod +x uninstall.sh || error "failed to mark uninstall.sh as executable!"

#mark as executable and run 2nd install script
sudo chmod +x install2.sh || error "failed to mark install2.sh as executable!"
./install2.sh || error "failed to run install4pi-apps.sh!"

#print in green 'installation succesful' and in orange how to run system tools
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
echo "$(tput setaf 3)to run system-tools, run the desktop shortcut or main menu>other>system-tools  $(tput sgr 0)"

#print 'exiting in 5 seconds', wait 5 seconds and exit
echo exiting in 5 seconds...
sleep 5
exit
