#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
#DIRECTORY="$HOME/Pi-Assistant"
#APPS="$HOME/Pi-Assistant/apps"
DIRECTORY="$HOME/Documents/github/Pi-Assistant(test)" #for testing purposes only
APPS="$HOME/Documents/github/Pi-Assistant(test)/apps" #for testing purposes only

echo "this script will help you install or remove BalenaEtcher."
PS3='Please enter the number for install or remove (1 - 4): '
options=("install" "compile" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



    "install")

sudo apt update || error "Failed to update repos (not critical)."
if $(uname -m | grep '64'); then

  wget https://github.com/Itai-Nelken/Etcher-arm-32-64/releases/download/realease/balena-etcher-electron_1.5.110+1f8f7ad7_arm64.deb -O ~/etcher64.deb || error "Failed to download!"

  sudo apt install -y --fix-broken ~/etcher64.deb || error "failed to install deb file!"
  rm -f ~/etcher64.deb
else
  wget https://github.com/Itai-Nelken/Etcher-arm-32-64/releases/download/realease/balena-etcher-electron_1.5.110+1f8f7ad7_armv7l.deb -O ~/etcher32.deb || error "Failed to download!"

  sudo apt install -y --fix-broken ~/etcher32.deb || error "failed to install deb file!"
  rm -f ~/etcher32.deb

fi

            break
            ;;

   "compile")

wget -qO- https://raw.githubusercontent.com/Itai-Nelken/Etcher-arm-32-64/main/compile-etcher_v1.5.113.sh | bash || error "Failed to download and run compile sctipt!"
read -p "do you want to install etcher from the deb you just compiled (y/n)?" choice
case "$choice" in 
  y|Y ) echo "installing etcher..." && cd $HOME/Downloads/etcher/dist && sudo apt install -y --fix-missing balena-etcher-electron*.deb;;
  n|N ) echo "deb file is in ~/Downloads/etcher/dist" && sleep 5;;
  * ) echo "invalid";;
esac


            break
            ;;


   "remove")  
   
sudo apt purge -y balena-etcher-electron || error "failed to remove etcher!"
   
            break
            ;;

"back to app installer")
   
$APPS/appinstaller.sh

            break
            ;;

       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
