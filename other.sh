#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you update or uninstall Pi-Assistant."
PS3='Please enter the number above for operation you would like to perform (1 - 3): '
options=("update Pi-Assistant" "uninstall Pi-Assistant" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in


        "update Pi-Assistant")
        
source $DIRECTORY/updater.sh --output-no-ask-exit
echo "You have to restart Pi-Assistant to apply the update."
read -p "Press [CTRL+C] to exit."

            break
            ;;


        "uninstall Pi-Assistant")
        
$DIRECTORY/uninstall.sh

            break
            ;;



 
        "back to main menu")

sleep 0.0001

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
