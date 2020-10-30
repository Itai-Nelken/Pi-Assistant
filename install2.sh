#!/bin/bash

cd apps
sudo chmod +x app-installer.sh
sudo chmod +x app-installer2.sh
sudo chmod +x audacity.sh
sudo chmod +x blender.sh
sudo chmod +x chromium.sh
sudo chmod +x firefox-esr.sh
sudo chmod +x flatpak+flathub.sh
sudo chmod +x gparted.sh
sudo chmod +x gsystem-monitor.sh
sudo chmod +x inkscape.sh
sudo chmod +x kdenlive.sh
sudo chmod +x snapd-snap-store.sh
sudo chmod +x SSR.sh
cd ..

cd ~/Desktop || error "Failed to change to /home/pi/desktop/!"
sudo chmod +x system-tools.desktop || error "failed to mark desktop shortcut as executable!"

./install.sh

