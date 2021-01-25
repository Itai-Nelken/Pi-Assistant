#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"


echo "this script will help you change your user and root passwords."
PS3='Please enter the number above for operation you would like to perform (1 - 5): '
options=("user password" "root password" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in


        "user password")
        
passwd || error "error occured! couldn't complete operation"

            break
            ;;


        "root password")

echo "you can use the same password as your user account if you wish"
sudo passwd || error "error occured! couldn't complete operation"

            break
            ;;



 
        "back to main menu")

$DIRECTORY/main.sh --no-internet

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
