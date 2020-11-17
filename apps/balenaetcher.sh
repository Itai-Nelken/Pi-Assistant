#!/bin/bash


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "this script will help you install or remove Balena Etcher compiloed for arm."
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "error occured! are you connected to the internet?"
if $(uname -m | grep '64'); then

  wget https://github.com/Itai-Nelken/Etcher-arm-32-64/releases/download/realease/balena-etcher-electron_1.5.110+1f8f7ad7_arm64.deb -O ~/etcher64.deb || error "Failed to download!"

  sudo apt install -y --fix-broken ~/etcher64.deb || error "failed to install deb file!"
  rm -f ~/etcher64.deb
else
  wget https://github.com/Itai-Nelken/Etcher-arm-32-64/releases/download/realease/balena-etcher-electron_1.5.110+1f8f7ad7_armv7l.deb -O ~/etcher32.deb || error "Failed to download!"

  sudo apt install -y --fix-broken ~/etcher32.deb  || error "failed to install deb file!"
  rm -f ~/etcher32.deb

fi

            break
            ;;
   
   "remove")  
   
sudo apt purge -y balena-etcher-electron || error "failed to purge the deb file!"
   
            break
            ;;
     
       *) echo "invalid option $REPLY";;
    esac
done     




sleep 2
clear
