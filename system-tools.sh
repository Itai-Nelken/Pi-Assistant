#!/bin/bash

#about & credits
echo "$(tput setaf 3)system-tools v1.0 $(tput sgr 0)" 
echo "$(tput setaf 3)by Itai Nelken $(tput sgr 0)"
sleep 1 

#main menu
read -p "this script will help you install applications,
update the system, and much more.
Press [Enter] to continue, or [Ctrl-C] to quit."
PS3='Please enter the number above for operation you would like to perform (1 - 4): '
options=("update" "change-password" "install-applications" "autoremove")
select opt in "${options[@]}"
do
    case $opt in


        "update")
        
sleep 1
clear
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 4
clear
echo when asked if you want to continue press 'y' followed by 'Enter'
read -p "Press [Enter] to continue..."
clear

sudo apt upgrade || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 4
clear
echo system updated✅️
read -p "Press [Enter] to finish]"
            break
            ;;


        "change-password")

echo "starting script..."
sleep 1
clear

read -p "this script will help you change your password and root password. Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number above for theme you would like to apply (1 - 2): '
options=("user" "root")
select opt in "${options[@]}"
do
    case $opt in


        "user")

echo "starting script..."
sleep 1
clear

passwd || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo user password changed
sleep 2
            break
            ;;



        "root")

echo "starting script..."
sleep 1
clear
sleep 1

echo you can use the same password as your user account if you wish
sleep 5
sudo passwd || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo root password changed
sleep 2
            break
            ;;


        *) echo "invalid option $REPLY";;
    esac
done


clear
read -p "Press [Enter] to finish."

            break
            ;;


 
        "install-applications")

echo "starting script..."
sleep 1
clear

read -p "this script will help you install and update applications.
Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number above for application you would like to install (1 - 7): '
options=("gparted" "chromium-web-browser" "firefox-esr" "blender" "audacity" "install/update snap-store" "inkscape" )
select opt in "${options[@]}"
do
    case $opt in



        "gparted")

echo "starting script..."
sleep 1
clear

read -p "this script will install gparted, press [Enter] to continue..."
clear
echo installing gparted....
sleep 1
echo updating repositories...
sleep 1
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 1
echo repositories updated...
sleep 2
clear
echo installing gparted...
sleep 1
sudo apt install gparted || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
clear
echo gparted installed✔️
sleep 1
read -p "install finished, press [Enter] to continue..."

            break
            ;;


      "chromium-web-browser")

echo "starting script..."
sleep 1
clear
sleep 1

read -p "this script will install chromium-web-browser, press [Enter] to continue..."
clear
echo installing chromium web browser....
echo updating repositories...
sleep 1
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo repositories updated...
sleep 2
clear
echo installing chromium web browser...
sudo apt install chromium-browser || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 1
echo chromium web browser installed✔️
sleep 2
clear
read -p "install finished, press [Enter] to continue..."

            break
            ;;

         "firefox-esr")
echo starting script...
sleep 1
clear
sleep 1

read -p "the script will install firefox-esr. Press [Enter] to continue..."
clear
echo updating repositories...
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo repositories updated...
sleep 1
clear
echo installing firefox-esr...
sudo apt install firefox-esr || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 1
clear
echo finishing...
sudo apt autoremove || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
clear
sleep 1
read -p "firefox installed. Press [Enter] to continue..."

            break
            ;;



  "blender")

echo "starting script..."
sleep 1
clear

read -p "this script will install blender, press [Enter] to continue..."
echo installing blender....
echo updating repositories...
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo updated repositories...
clear
echo installing blender...
sudo apt install blender || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo blender installed✔️
read -p "install finished, press [Enter] to continue..."

            break
            ;;


  "audacity")

echo "starting script..."
sleep 1

echo installing audacity.....
echo updating repositories...
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
clear
echo installing audacity...
sudo apt install audacity || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 2
clear
echo audacity installed✔️
read -p "install finished, press [Enter] to continue..."

            break
            ;;



   "install/update snap-store")

echo "starting script..."
sleep 1
clear

read -p "this script will help you install or update the snap store.
Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number above for install or update (1 - 2): '
options=("install" "update")
select opt in "${options[@]}"
do
    case $opt in


        "install")
clear
sleep 1
echo "starting script..."

read -p "the script will now check if you have 'snapd' installed.
if not, it will install it. Press [Enter] to continue..."
clear
echo updating repositories...
sudo apt update || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo repositories updated...
clear
#install snapd
echo installing snapd.....
sudo apt install snapd || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo snapd installed✔️
read -p "the script will now install the snap store. Press [Enter] to continue..."

#install snap-store snap
echo installing snap store....
sudo snap install snap-store || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
echo snap store installed✔️
echo you can now install snaps from the snap store✅️
read -p "snap store installed. Press [Enter] to continue..."


            break
            ;;


        "update")

echo "starting update script..."
sleep 1
clear
read -p "this script will update the snap store,
use it from time to time or if the snap store won't open.
Press [Enter] to continue."
sleep 1
echo updating snap store...
sudo snap refresh snap-store || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
read -p "snap store updated. Press [Enter] to continue..."


            break
            ;;


  
        *) echo "invalid option $REPLY";;
    esac
done


clear
read -p "install/update finished. When ready, press [Enter] to finish..."



            break
            ;;






 "inkscape")

echo "starting script..."
sleep 1

read -p "this script will help you install or remove Inkscape.
Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number above for install update or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

clear
sleep 1
echo "starting script..."
sleep 1
read -p "the script will now install Inkscape.
to continue Press [Enter]."
sleep 1
clear

sudo apt install inkscape || echo "$(tput setaf 1)error occured! $(tput sgr 0)"

echo Inkscape installed✔️
sleep 2

            break
            ;;


  "remove")

echo "starting remove script..."
sleep 1
clear
read -p "this script will remove Inkscape,
Press [Enter] to continue."
sleep 1
clear
sudo apt remove inkscape || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
read -p "remove complete. Press [Enter] to continue..."

            break
            ;;





        *) echo "invalid option $REPLY";;
    esac
done


clear
read -p "install/remove complete. When ready, press [Enter] to finish..."




            break
            ;;






        *) echo "invalid option $REPLY";;
    esac
done


clear
read -p "install/update complete. When ready, press [Enter] to finish..."


            break
            ;;


        "autoremove")

echo "starting script..."
sleep 1
clear

read -p "this script will remove packages that are not needed anymore. 
Press [Enter] to continue..."
clear
read -p "are you sure you want to continue? 
if yes, Press [Enter]."
echo when or if prompted press 'y' folowed by 'Enter'
read -p "Press [Enter] to continue..."
echo starting...
sudo apt autoremove || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sleep 2
echo finishing...
read -p "remove finished. Press [Enter] to finish..."


            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done


clear
sleep 1
read -p "operation complete. When ready, press [Enter] to exit..."

