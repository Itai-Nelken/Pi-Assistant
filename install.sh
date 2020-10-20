#!/bin/bash

cp ~/system-tools/system-tools.desktop ~/Desktop
cd ~/system-tools
sudo chmod +x system-tools.sh
sudo chmod +x install2.sh
./install2.sh
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
echo exiting in 10 seconds...
sleep 10
exit
