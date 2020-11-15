#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
 }


sudo rm /usr/share/applications/zoom.desktop || error "failed to remove menu shortcut"
rm ~/Desktop/zoom.desktop || error " failed to remove desktop shortcut, does it exist?"
rm -rf ~/zoom

#remove dependencies
if $(uname -m | grep '64'); then

  #64 bit
  echo "unfortunately 64bit support isn't here yet, I'm still working on it." sleep 5 && exit

else
  #32 bit 
  read -p "Do you want to remove the dependencies (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt remove libxcb-xtest0 libxcb-xfixes0 ;;
  n|N ) echo "dependencies won't be removed"   ;;
  * ) echo "invalid";;
fi


read -p "Do you want to remove box86 (y/n)?" choice
case "$choice" in 
  y|Y ) rm ~/box86 && sudo rm -f /usr/local/bin/box86;;
  n|N ) echo "box86 won't be removed"   ;;
  * ) echo "invalid";;
fi


read -p "Do you want to remove pulseaudio (don't do if you are using twisterOS) (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt remove pulseaudio-utils pulseaudio;;
  n|N ) echo "pulseaudio won't be removed"   ;;
  * ) echo "invalid";;
fi


echo "$(tput setaf 2)zoom removed(tput sgr 0)"

