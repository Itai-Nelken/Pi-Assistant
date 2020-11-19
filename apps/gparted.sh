#!/bin/bash  

clear
echo "this script will help you install or remove gparted."
PS3='Please enter the number for install/remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

echo "$(tput setaf 3)installing gparted...$(tput sgr 0)"
sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install -y gparted || error "error occured! are you connected to the internet?"

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing gparted...$(tput sgr 0)"
sudo apt remove -y gparted || error "error occured! are you connected to the internet?"
clear

            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
