#!/bin/bash  

clear
read -p "this script will help you install or remove gparted.
Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number for install/remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

echo "$(tput setaf 3)installing gparted...$(tput sgr 0)"
sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install gparted || error "error occured! are you connected to the internet?"
echo "$(tput setaf 2)gparted installed$(tput sgr 0)"

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing gparted...$(tput sgr 0)"
sudo apt remove gparted || error "error occured! are you connected to the internet?"
clear
echo "$(tput setaf 2)gparted removed$(tput sgr 0)"

            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
