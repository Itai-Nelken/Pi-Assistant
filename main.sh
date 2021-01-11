#!/bin/bash

if [[ $1 = "--youfoundmysecretasciiart"]]; then

echo -e "

#########################################################################################
#██████╗░██╗░░░░░░░█████╗░░██████╗░██████╗██╗░██████╗████████╗░█████╗░███╗░░██╗████████╗#
#██╔══██╗██║░░░░░░██╔══██╗██╔════╝██╔════╝██║██╔════╝╚══██╔══╝██╔══██╗████╗░██║╚══██╔══╝#
#██████╔╝██║█████╗███████║╚█████╗░╚█████╗░██║╚█████╗░░░░██║░░░███████║██╔██╗██║░░░██║░░░#
#██╔═══╝░██║╚════╝██╔══██║░╚═══██╗░╚═══██╗██║░╚═══██╗░░░██║░░░██╔══██║██║╚████║░░░██║░░░#
#██║░░░░░██║░░░░░░██║░░██║██████╔╝██████╔╝██║██████╔╝░░░██║░░░██║░░██║██║░╚███║░░░██║░░░#
#╚═╝░░░░░╚═╝░░░░░░╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░#
#########################################################################################

"
fi

function error {
  echo -e "\e[91m$1\e[39m"
}

#version variable (change --version ascii art (main.sh and piassist) and $APPVER in appinstaller.sh as well)
APPVER="v1.2-RC 2"

#set INTERNETCHECK variable to 0 (check)
if [ ! "$INTERNETCHECK" = 1 ]; then
INTERNETCHECK=0
fi

#print a "loading screen"
echo "$(tput setaf 2)$(tput bold)LOADING...$(tput sgr 0)"

#flags
if  [[ $1 = "--version" ]]; then
    clear
    echo -e '
 ____  _       ___              _      __              __ 
   / __ \(_)     /   |  __________(_)____/ /_____ _____  / /_
  / /_/ / /_____/ /| | / ___/ ___/ / ___/ __/ __ `/ __ \/ __/
 / ____/ /_____/ ___ |(__  |__  ) (__  ) /_/ /_/ / / / / /_  
/_/   /_/     /_/  |_/____/____/_/____/\__/\__,_/_/ /_/\__/  
                                                             
       ___  ___        ____  ______   ___ 
 _   _<  / |__ \      / __ \/ ____/  |__ \
| | / / /  __/ /_____/ /_/ / /       __/ /
| |/ / /_ / __/_____/ _, _/ /___    / __/ 
|___/_/(_)____/    /_/ |_|\____/   /____/ 
                                          
    __             ______        _       _   __     ____            
   / /_  __  __   /  _/ /_____ _(_)     / | / /__  / / /_____  ____ 
  / __ \/ / / /   / // __/ __ `/ /_____/  |/ / _ \/ / //_/ _ \/ __ \
 / /_/ / /_/ /  _/ // /_/ /_/ / /_____/ /|  /  __/ / ,< /  __/ / / /
/_.___/\__, /  /___/\__/\__,_/_/     /_/ |_/\___/_/_/|_|\___/_/ /_/ 
      /____/                        
'

sleep 5
read -p "any key to exit..."
exit
elif [[ $1 = "--secret" ]]; then
    xdg-open ~/Pi-Assistant/icons/ascii-art.html
    sleep 10
    clear
    read -p "any key to exit"
    exit
elif [[ $1 = "--no-internet" ]]; then    
    INTERNETCHECK=1
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
   read -p "press any key to exit..."
   exit
fi

#check for internet connection (disable with -ni flag)
if [ ! "$INTERNETCHECK" = 1 ]; then
        PINGOUTPUT=$(ping -c 1 8.8.8.8 >/dev/null && echo '...')
        if [ ! "$PINGOUTPUT" = '...' ]; then
            echo -e "Internet connection required but not detected.\nthis could be caused by:\n * a weak wifi signal\n * no internet connection.\nTry the don't check for internet flag (-ni) usage: piassist -ni\n"
            read -p "Press [Enter] to exit..."
            exit
        fi
fi

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

cd "$HOME/Pi-Assistant"
#variables containing the command for each option
main="$DIRECTORY/main.sh" 
update="$DIRECTORY/update.sh"
passwd="$DIRECTORY/passwd.sh"
apps="$APPS/appinstaller.sh" #apps variable used for my testing.
systools="$DIRECTORY/systools.sh"
other="$DIRECTORY/other.sh"
exit="exit"

#change to $DIRECTORY (for $COMMIT to work)
cd $DIRECTORY
#dialog variables
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
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
         5 "Other"
         6 "exit Pi-Assistant")

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
            $other; $main2>/dev/null
            ;;
        
        6) $exit
           ;;
esac
