#!/bin/bash 

echo this script will help you install or remove the snap-store and snapd.
echo after installation you have to reboot, are you sure you want to continue?
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



         "install")

sudo apt update || error "error occured! are you connected to the internet?"
echo "$(tput setaf 3)installing snapd... $(tput sgr 0)"
sudo apt install snapd || error "error occured! are you connected to the internet?"
echo do you want to install the snap-store?
PS3='Please enter the number for install or skip (1 - 2): '
options=("skip" "install")
select opt in "${options[@]}"
do
    case $opt in
    
   "skip")

echo snap-store WILL NOT be installed
sleep 1
            break
            ;;  
    
   "install")

echo "$(tput setaf 3)installing snap-store snap... $(tput sgr 0)"
sudo snap install snap-store || error "error occured! are you connected to the internet?"
echo rebooting in 10 seconds. press [Ctrl-C] to cancel and exit

            break
            ;;  
    
    
    *) echo "invalid option $REPLY";;
    esac
done

            break
            ;;
   
   
   
   "remove")  
   
sudo snap remove snap-store || error "error occured! is snapd installed?"
echo do you want to remove snapd as well?
PS3='Please enter the number for skip or remove (1 - 2): '
options=("skip" "remove")
select opt in "${options[@]}"
do
    case $opt in
    
   "skip")

echo snapd WILL NOT be removed
sleep 2
            break
            ;;  
    
   "remove")

sudo apt remove snapd
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

sleep 2
clear
