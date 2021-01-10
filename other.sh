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

$DIRECTORY/updater.sh
sleep 1
clear
echo "$(tput setaf 6)you need to relaunch Pi-Assistant to apply the update. $(tput sgr 0)"
read -p "[Ctrl-C] to exit"

            break
            ;;
   
       "uninstall Pi-Assistant")

$DIRECTORY/uninstall.sh
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
