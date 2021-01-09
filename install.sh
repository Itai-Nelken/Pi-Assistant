#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

cd $HOME
git clone --single-branch --branch  dialog-gui-testing https://github.com/Itai-Nelken/Pi-Assistant.git; cd ~/Pi-Assistant

#copy desktop shortcut to desktop and main menu
cp ~/Pi-Assistant/system-tools.desktop ~/Desktop || error "failed to create desktop shortcut!"
sudo cp ~/Pi-Assistant/system-tools.desktop /usr/share/applications || error "failed to create menu shortcut!"

#mark as executable some neded scripts
cd ~/Pi-Assistant || error "Failed to change to /home/pi/Pi-Assistant"
sudo chmod +x system-tools-v1.1.1.sh || error "failed to mark system-tools-v1.1.1.sh as executable!"

sudo chmod +x other.sh || error "failed to mark other.sh as executable!"
sudo chmod +x uninstall.sh || error "failed to mark uninstall.sh as executable!"
sudo chmod +x updater.sh || error "failed to mark updater.sh as executable!"

#add startup from terminal using 'piassist'
echo "#!/bin/bash
clear && cd ~/Pi-Assistant/ && ./system-tools-v1.1.1.sh" > ~/Downloads/piassist
sudo mv ~/Downloads/piassist /usr/local/bin/
cd /usr/local/bin
sudo chmod +x piassist

cd ~/Pi-Assistant
#remove zoom.tar.xz as it isn't needed unless you install zoom, and the zoom installer downloads it.
cd apps/zoom/files
rm zoom.tar.xz 
cd ~/Pi-Assistant

#mark as executable and run 2nd install script
sudo chmod +x install2.sh || error "failed to mark install2.sh as executable!"
./install2.sh || error "failed to run install2.sh!"

#print in green 'installation succesful' and in orange how to run system tools
echo "$(tput setaf 2)Installation succesful! $(tput sgr 0)"
echo "$(tput setaf 3)to run Pi-Assistant, run the desktop shortcut or main menu>other>Pi-Assistant  $(tput sgr 0)"

#print 'exiting in 5 seconds', wait 5 seconds and exit
echo exiting in 5 seconds...
sleep 5
exit
