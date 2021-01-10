#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you install or remove audacity."
PS3='Please enter the number for install or remove (1 - 3): '
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
   
$DIRECTORY/main.sh

            break
            ;;

       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
