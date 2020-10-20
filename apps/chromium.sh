#!/bin/bash  

read -p "this script will help you install or remove chromium.
Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number for install/remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in

"install")
           
sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install chromium-browser || error "error occured! are you connected to the internet?"
echo "$(tput setaf 2)chromium web browser installed✔️ $(tput sgr 0)"
sleep 2

            break
            ;;

"remove")
   
sudo apt remove chromium-browser || error "error occured! are you connected to the internet?"
echo "$(tput setaf 2)chromium web browser removed️ $(tput sgr 0)"
sleep 2

            break
            ;;
            
    *) echo "invalid option $REPLY";;
    esac
done
