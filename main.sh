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

#set INTERNETCHECK variable to 0 (check)
if [ ! "$INTERNETCHECK" = 1 ]; then
INTERNETCHECK=0
fi

#flags
if  [[ $1 = "--version" ]]; then
    clear
    echo -e "
  _                                            
 |_) o __ /\   _  _ o  _ _|_  _. ._ _|_        
 |   |  _/--\ _> _>_| _>  |_ (_| | | |_        
   /|    ) __ |_) / /|                         
 \/ | o /____ | \ \_ |                         
 |_        | _|_  _. o   |\ |  _  | |   _  ._  
 |_) \/   _|_ |_ (_| |   | \| (/_ | |< (/_ | | 
     /                                         
"
sleep 10
read -p "[Ctrl+C] to exit"
elif [[ $1 = "--secret" ]]; then
    xdg-open ~/Pi-Assistant/icons/ascii-art.html
    sleep 10
    clear
    read -p "[Ctrl+C] to exit"
elif [[ $1 = "-ni" ]]; then
    INTERNETCHECK=1
elif [[ $1 = "--help" ]]; then
    echo -e "
    $(tput setaf 6)$(tput bold)usage:$(tput sgr 0)
    piassist [flag]

   $(tput setaf 6)$(tput bold)available flags:$(tput sgr 0)
   -ni - dont check for internet connection on startup .
   --version - show version (in ascii art text).
   --secret - secret easter egg.
   --help - show this help info.

   $(tput setaf 6)$(tput bold)example:$(tput sgr 0)
   piassist --secret
   "
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
BACKTITLE="Pi-Assistant v1.2-RC 1,"
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
