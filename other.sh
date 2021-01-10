#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you update or uninstall Pi-Assistant."
PS3='Please enter the number for install or remove (1 - 3):'
options=("Update Pi-Assistant" "uninstall Pi-Assistant" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in



        "Update Pi-Assistant")

echo "$(tput setaf 3)updating...$(tput sgr 0)"
sleep 1
cd $DIRECTORY
git reset --hard
git pull
sudo chmod +x main.sh
sudo chmod +x passwd.sh
sudo chmod +x systools.sh
sudo chmod +x other.sh
sudo chmod +x install.sh
sudo chmod +x update.sh
sudo chmod +x apps/appinstaller.sh
sudo chmod +x apps/gparted.sh
sudo chmod +x apps/chromium.sh
sudo chmod +x apps/firefox.sh
sudo chmod +x apps/blender.sh
sudo chmod +x apps/audacity.sh
sudo chmod +x apps/inkscape.sh
sudo chmod +x apps/snap.sh
sudo chmod +x apps/ssr.sh
sudo chmod +x apps/kdenlive.sh
sudo chmod +x apps/gsysmon.sh
sudo chmod +x apps/flatpak.sh
sudo chmod +x apps/etcher.sh
sudo chmod +x apps/zoom.sh
sudo chmod +x apps/box86.sh
echo "$(tput setaf 3)finished...$(tput sgr 0)"
sleep 1
clear
echo "$(tput setaf 6)you need to relaunch Pi-Assistant to apply the update. $(tput sgr 0)"
read -p "[Ctrl-C] to exit"

            break
            ;;
   
   "Uninstall Pi-Assistant")  

sudo rm /usr/local/bin/piassist
rm -rf ~/Pi-Assistant || error "failed to remove Pi-Assistant folder!"
sudo rm -f ~/Desktop/system-tools.desktop || error "failed to remove desktop shortcut!"
sudo rm -f /usr/share/applications/system-tools.desktop || error "failed to remove menu button!"

read -p "Do you want to uninstall the dependencies (dialog, yad) (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt update; sudo apt purge dialog yad -y;;
  n|N ) echo "dependencies (dialog) won't be removed."; sleep 2;;
  * ) echo "invalid";;
esac

bold=$(tput bold)
normal=$(tput sgr0)
echo -e "\e[32mPi-Assistant removed:("
echo  -e "${bold}if Pi-Assistant didn't work for you \033[33;5;7mPLEASE\033[0m submit a bog report here:${normal}"
echo -e "\e[96mhttps://github.com/Botspot/pi-apps/issues/new\e[39m"
   
            break
            ;;

"back to main menu")
   
$DIRECTORY/main.sh

            break
            ;;

       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
