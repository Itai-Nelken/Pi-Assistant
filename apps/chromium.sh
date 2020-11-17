#!/bin/bash  

echo "this script will help you install or remove chromium."
PS3='Please enter the number for install/remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in

"install")
           
sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install -y chromium-browser || error "error occured! are you connected to the internet?"
sleep 2

            break
            ;;

"remove")
   
sudo apt remove -y chromium-browser || error "error occured! are you connected to the internet?"
sleep 2

            break
            ;;
            
    *) echo "invalid option $REPLY";;
    esac
done
