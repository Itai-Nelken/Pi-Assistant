#!/bin/bash


rm -rf ~/Pi-Assistant || error "failed to remove Pi-Assistant folder!"
sudo rm -f ~/Desktop/system-tools.desktop || error "failed to remove desktop shortcut!"
sudo rm -f /usr/share/applications/system-tools.desktop || error "failed to remove menu button!"
echo "$(tput setaf 3)system-tools removed:($(tput sgr 0)"
