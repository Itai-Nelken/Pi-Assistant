#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo this script will help you install or remove flatpak
echo after installation you have to reboot, are you sure you want to continue?
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in


         "install")

sudo apt update || error "error occured! are you connected to the internet?"
echo "$(tput setaf 3)installing snapd... $(tput sgr 0)"
sudo apt install flatpak || error "error occured! are you connected to the internet?"
echo "do you want to add the flathub repository (recommended)?"
PS3='Please enter the number for add or skip (1 - 2): '
options=("skip" "add")
select opt in "${options[@]}"
do
    case $opt in
    
   "skip")

echo flathub repository WILL NOT be added
sleep 1
            break
            ;;  
            
    
   "add")

echo "$(tput setaf 3)adding flathub repository... $(tput sgr 0)"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || error "error occured! are you connected to the internet?"
echo rebooting in 10 seconds. press [Ctrl-C] to cancel and exit

            break
            ;;  
    
    
    *) echo "invalid option $REPLY";;
    esac
done

           break
            ;;  

      *) echo "invalid option $REPLY";;
    esac
done


