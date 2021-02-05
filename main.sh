#!/bin/bash

#########################################################################################
#██████╗░██╗░░░░░░░█████╗░░██████╗░██████╗██╗░██████╗████████╗░█████╗░███╗░░██╗████████╗#
#██╔══██╗██║░░░░░░██╔══██╗██╔════╝██╔════╝██║██╔════╝╚══██╔══╝██╔══██╗████╗░██║╚══██╔══╝#
#██████╔╝██║█████╗███████║╚█████╗░╚█████╗░██║╚█████╗░░░░██║░░░███████║██╔██╗██║░░░██║░░░#
#██╔═══╝░██║╚════╝██╔══██║░╚═══██╗░╚═══██╗██║░╚═══██╗░░░██║░░░██╔══██║██║╚████║░░░██║░░░#
#██║░░░░░██║░░░░░░██║░░██║██████╔╝██████╔╝██║██████╔╝░░░██║░░░██║░░██║██║░╚███║░░░██║░░░#
#╚═╝░░░░░╚═╝░░░░░░╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░#
#########################################################################################

function error {
  echo -e "\e[91m$1\e[39m"
}

#version variable (change --version text (main.sh and flag and piassist/install.sh & piassist/updater.sh) and $APPVER in appinstaller.sh and desktop shortcut/install.sh and menu shortcut,)
APPVER="v1.3.0"

#check for updates variable
UPDATE=1

#set NOINTERNETCHECK variable to 0 (check)
if [ ! "$NOINTERNETCHECK" = 1 ]; then
NOINTERNETCHECK=0
fi

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

#flags
if  [[ $1 = "--version" ]]; then
    echo -e "$(tput bold)$(tput setaf 4)Pi-Assistant\nv1.2.1\nby Itai Nelken$(tput sgr 0)"
    exit 1
elif [[ $1 = "--secret" ]]; then
    xdg-open ~/Pi-Assistant/icons/ascii-art.html
    sleep 10
    clear
    read -p "press [ENTER] to exit"
    exit
elif [[ $1 = "--no-internet" ]]; then    
    NOINTERNETCHECK=1
    UPDATE=0
elif [[ $1 = "--help" ]]; then
    echo -e "
    $(tput setaf 6)$(tput bold)usage:$(tput sgr 0)
    piassist [flag]

   $(tput setaf 6)$(tput bold)available flags:$(tput sgr 0)
   --no-internet - dont check for internet connection on startup .
   --version - show version (in ascii art text) and exit.
   --secret - secret easter egg.
   --help - show this help info and exit.

   $(tput setaf 6)$(tput bold)example:$(tput sgr 0)
   piassist --secret
   "
    exit
elif [[ $1 = "--no-update" ]]; then
    UPDATE=0
fi

#print a "loading screen"
echo "$(tput setaf 2)$(tput bold)LOADING...$(tput sgr 0)"

#check for internet connection (disable with -ni flag)
if [[ "$NOINTERNETCHECK" != 1 ]]; then
        PINGOUTPUT=$(ping -c 1 8.8.8.8 >/dev/null && echo '...')
        if [ ! "$PINGOUTPUT" = '...' ]; then
            UPDATE=0
            echo -e "Internet connection required but not detected.\nthis could be caused by:\n * a weak wifi signal\n * no internet connection.\nTry the don't check for internet flag (--no-internet) usage: piassist --no-internet\n"
            read -p "Press [Enter] to exit..."
            NOINTERNETCHECK=0
            exit
        fi
fi

#check for updates and update if update available
if [[ "$UPDATE" == 1 ]]; then
    cd $DIRECTORY
    ./updater.sh --no-output
elif [[ "$UPDATE" == 0 ]]; then
    echo " "
fi

#set NOINTERNETCHECK variable to 0 (check)
if [ $NOINTERNETCHECK == "1" ]; then
NOINTERNETCHECK=0
fi


cd "$HOME/Pi-Assistant"
#variables containing the command for each option
main="$DIRECTORY/main.sh --no-internet" 
update="$DIRECTORY/update.sh"
passwd="$DIRECTORY/passwd.sh"
apps="$APPS/appinstaller.sh" #apps variable used for my testing.
systools="$DIRECTORY/systools.sh"
sysinfo="$DIRECTORY/sys-info.sh"
other="$DIRECTORY/other.sh"
exit="exit 1"

#change to $DIRECTORY (for $COMMIT to work)
cd $DIRECTORY
#dialog variables
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=7
BACKTITLE="Pi-Assistant $APPVER,"
COMMIT="`git log -1 | grep commit* | cut -c1-14`::::::Itai Nelken::::::"
#CPU="CPU `lscpu | grep "Model name*"`"
#MODEL="`cat /proc/cpuinfo | grep "Raspberry*"`"
SPACER="_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_"
TITLE="Main Menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "Update OS"
         2 "Change password"
         3 "Application installer"
         4 "System tools"
         5 "System Information"
         6 "Other"
         7 "exit Pi-Assistant")

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
            $sysinfo; $main
            ;;
        
        6)
            $other; $main>/dev/null #send output to dev/null because after uninstalling you will get a "directory not found" error.
            ;;
        
        7) $exit
           ;;
esac
