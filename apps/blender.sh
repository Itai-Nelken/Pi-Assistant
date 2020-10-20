#!/bin/bash 

echo this script will help you install or remove blender.
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install blender || error "error occured! are you connected to the internet?"

            break
            ;;
   
   "remove")  
   
sudo apt remove blender || error "error occured! can't remove blender"
   
            break
            ;;
     
       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
