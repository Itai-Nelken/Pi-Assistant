#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


if [ -d ~/box86 ]; then

  echo "box86 installed..."

else
  echo "Box86 missing, please install"
  exit 1 

fi



	
#go to zoom directory (~/zoom)
cd ~/zoom
echo "$(tput setaf 3)close this window to exit zoom$(tput sgr 0)"
sleep 2
echo "$(tput setaf 2)starting zoom, ignore any errors...$(tput sgr 0)"
sleep 1
#start zoom with box86
pulseaudio &
box86 zoom || error "can't start zoom!"
echo "$(tput setaf 2)exiting in 5 seconds:($(tput sgr 0)"
sleep 5
