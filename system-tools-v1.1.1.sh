#!/bin/bash


#variables
#DIRECTORY=~/Pi-Assistant
#APPS=~/Pi-Assistant/apps

cd $HOME/Pi-Assistant
#variables containing the command for each option
main="./system-tools-v1.1.1.sh"
update="./update.sh"
passwd="./change-password.sh"
apps="$HOME/Pi-Assistant/apps/app-installer.sh"
systools="./apt-tools.sh"
other="./other.sh"

#dialog variables
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Pi-Assistant v1.2-beta 1,"
COMMIT="`git log -1 | grep commit* | cut -c1-14`::::::Itai Nelken::::::"
#CPU="CPU `lscpu | grep "Model name*"`"
#MODEL="`cat /proc/cpuinfo | grep "Raspberry*"`"
SPACER="_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_"
TITLE="Main Menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "Update"
         2 "Change password"
         3 "Application installer"
         4 "System tools"
         5 "Other")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE $COMMIT $SPACER" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            $update; $main
            ;;
        2)
            $passwd; $main
            ;;
        3)
            $apps; $main
            ;;
        4)
            $systools; $main
            ;;
        5)
            $other; $main
            ;;
esac
