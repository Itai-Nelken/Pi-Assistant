#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

cp ~/system-tools/system-tools.desktop ~/Desktop || error "failed to create desktop shortcut!"
sudo cp ~/system-tools/system-tools.desktop /usr/share/applications || error "failed to create menu shortcut!"
cd ~/system-tools || error "Failed to change to /home/pi/system-tools"
sudo chmod +x system-tools-v1.1.1.sh || error "failed to mark system-tools-v1.1.1.sh as executable!"
sudo chmod +x install2.sh || error "failed to mark install2.sh as executable!"
./install2.sh || error "failed to run install2.sh!"
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
 $(tput sgr 0)
