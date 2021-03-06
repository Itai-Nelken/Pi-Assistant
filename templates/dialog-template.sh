#!/bin/bash


#variables
DIRECTORY=~/Pi-Assistant
APPS=~/Pi-Assistant/apps

cd $DIRECTORY
#variables containing the command for each option
update=./update.sh
passwd=./change-password.sh
apps=cd $APPS; ./app-installer.sh
systools=./apt-tools.sh
other=./other.sh

#dialog variables
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Pi-Assistant v1.2-beta 1. author: Itai Nelken."
TITLE="Main Menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "Update"
         2 "Change password"
         3 "Application installer"
         4 "System tools"
         5 "Other")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            $update
            ;;
        2)
            $passwd
            ;;
        3)
            $apps
            ;;
        4)
            $systools
            ;;
        5)
            $other
            ;;
esac
