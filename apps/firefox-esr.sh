#!/bin/bash

echo "this script will help you install or remove firfox-esr."
PS3='Please enter the number for application you would like to install/remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install -y firefox-esr || error "error occured! are you connected to the internet?"

            break
            ;;
   
   "remove")  
   
sudo apt remove -y firefox-esr || error "error occured!"
   
            break
            ;;
     
       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear



