#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you install or remove flatpak and add its flathub repository."
PS3='Please enter the number for install or remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "Failed to update repos (not critical)."
sudo apt install -y flatpak || error "Failed to install flatpak!"
echo "$(tput setaf 3)adding flathub repository... $(tput sgr 0)"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || error "Failed to add flathub flatpak repository!"
yad --width=300 --height=60 --button=skip:0 --button=Reboot:1 --title "installing flatpak..." --text="You need to reboot to complete installation of flatpak." --text="<b>do you want to reboot now?</b>" --center --on-top
if [[ $button -eq 1 ]]; then
 yad --timeout=5 --timeout-indicator=top --no-buttons --on-top --center --title="Rebooting..." --text="<b>rebooting in 5 seconds</b>" 

elif [[ $button -eq 0 ]]; then
 yad --timeout=15 --timeout-indicator=top --no-buttons --on-top --center --title="installing flatpak" --text="<b>please reboot later or menu shortcuts won't appear</b>"
fi

            break
            ;;
   
   "remove")  
   
sudo apt purge -y flatpak || error "failed to remove flatpak!"
   
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
