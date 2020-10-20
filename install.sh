#!/bin/bash

cp ~/system-tools/system-tools.desktop ~/Desktop || echo "$(tput setaf 1)faile to create desktop shortcut! $(tput sgr 0)"
cp ~/system-tools/system-tools.desktop /usr/share/applications || echo "$(tput setaf 1)faile to create menu shortcut! $(tput sgr 0)"
cd ~/system-tools || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sudo chmod +x system-tools.sh || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sudo chmod +x install2.sh || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
./install2.sh || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
echo "$(tput setaf 3)to run system-tools, run the desktop shortcut or  $(tput sgr 0)"
echo exiting in 5 seconds...
sleep 5
exit
