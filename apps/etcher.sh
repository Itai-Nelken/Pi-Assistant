#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

function download_latest_release_armhf() {
  echo "Downloading latest armhf release..."
  curl -s https://api.github.com/repos/$1/releases/latest \
  | grep "browser_download_url.*armv7l.deb" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -
}

function download_latest_release_arm64() {
  echo "Downloading latest arm64 release..."
  curl -s https://api.github.com/repos/$1/releases/latest \
  | grep "browser_download_url.*armv64.deb" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you install or remove BalenaEtcher."
PS3='Please enter the number for install or remove (1 - 4): '
options=("install" "compile" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



    "install")

sudo apt update || error "Failed to update repos (not critical)."

#determine if host system is 64 bit arm64 or 32 bit armhf
if [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 64)" ];then
echo "Installing arm64 etcher..."
  cd $HOME || error "Failed to change to home directory (not super critical)"
  download_latest_release_arm64 Itai-Nelken/Etcher-arm-32-64 || error "Failed to Download etcher!"; read -p "press enter to exit"; exit 1
  sudo apt -f -y install ./balena-etcher-electron*arm64.deb || error "Failed to install etcher deb!"; read -p "press enter to exit"; exit 1
  rm -f balena-etcher-electron*arm64.deb || error "Failed to delete etcher deb (not critical)"
elif [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 32)" ];then
  echo "Installing armhf etcher..."
  cd $HOME || error "Failed to change to home directory (not super critical)"
  download_latest_release_armhf Itai-Nelken/Etcher-arm-32-64 || error "Failed to Download etcher!"; read -p "press enter to exit"; exit 1
  sudo apt -f -y ./install balena-etcher-electron*armv7l.deb || error "Failed to install etcher deb!"; read -p "press enter to exit"; exit 1
  rm -f balena-etcher-electron*armv7l.deb || error "Failed to delete etcher deb (not critical)"
else
  error "Failed to detect OS CPU architecture! Something is very wrong."
fi

#if $(uname -m | grep '64'); then
#
#  wget https://github.com/Itai-Nelken/Etcher-arm-32-64/releases/download/realease/balena-etcher-electron_1.5.110+1f8f7ad7_arm64.deb -O ~/etcher64.deb || error "Failed to download!"
#
#  sudo apt install -y --fix-broken ~/etcher64.deb || error "failed to install deb file!"
#  rm -f ~/etcher64.deb
#else
#  wget https://github.com/Itai-Nelken/Etcher-arm-32-64/releases/download/realease/balena-etcher-electron_1.5.110+1f8f7ad7_armv7l.deb -O ~/etcher32.deb || error "Failed to download!"
#
#  sudo apt install -y --fix-broken ~/etcher32.deb || error "failed to install deb file!"
 # rm -f ~/etcher32.deb
#
#fi

            break
            ;;

   "compile")

wget -qO- https://raw.githubusercontent.com/Itai-Nelken/Etcher-arm-32-64/main/compile-etcher_v1.5.116.sh | bash || error "Failed to download and run compile sctipt!"
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
