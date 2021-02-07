#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you install or remove snap and snap-store."
PS3='Please enter the number for install or remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "Failed to update repos (not critical)."
sudo apt install -y snapd || error "Failed to install snapd!"; sleep 30; $APPS/appinstaller.sh
sudo snap install core || error "Failed to install snap core!"
sudo snap install snap-store || error "Failed to install snap-store!"
button=$?
yad --width=300 --height=60 --button=skip:0 --button=Reboot:1 --title "installing snap..." --text="You need to reboot to complete installation of snap." --text="do you want to reboot now?" --center --on-top
if [[ $button -eq 1 ]]; then
 yad --timeout=15 --timeout-indicator=top --no-buttons --on-top --center --title="Rebooting..." --text="<b>rebooting in 5 seconds</b>" 

elif [[ $button -eq 0 ]]; then
 yad --timeout=15 --timeout-indicator=top --no-buttons --on-top --center --title="installing snap" --text="<b>please reboot later or menu shortcuts won't appear</b>"
fi

            break
            ;;
   
   "remove")  

sudo snap remove snap-store || error "failed to remove snap-store!"
sudo snap remove core || error "failed to remove snap core!"
rm -rf ~/snap || error "failed to delete ~/snap, trying again as root."
sudo rm -rf ~/snap || error "failed to delete ~/snap as root!"
sudo apt purge -y snapd || error "failed to remove snapd!"
   
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
