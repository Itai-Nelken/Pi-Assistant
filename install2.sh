#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

cd apps
sudo chmod +x app-installer.sh || error "failed to mark app-installer.sh as executable!"
sudo chmod +x app-installer2.sh || error "failed to mark app-installer2.sh as executable!"
sudo chmod +x audacity.sh || error "failed to mark audacity.sh as executable!"
sudo chmod +x blender.sh || error "failed to mark blender.sh as executable!"
sudo chmod +x chromium.sh || error "failed to mark chromium.sh as executable!"
sudo chmod +x firefox-esr.sh || error "failed to mark firefox-esr.sh as executable!"
sudo chmod +x flatpak+flathub.sh || error "failed to mark flatpak+flathub.sh as executable!"
sudo chmod +x gparted.sh || error "failed to mark gparted.sh as executable!"
sudo chmod +x gsystem-monitor.sh || error "failed to mark gsystem-monitor.sh as executable!"
sudo chmod +x inkscape.sh || error "failed to mark inkscape.sh as executable!"
sudo chmod +x kdenlive.sh || error "failed to mark kdenlive.sh as executable!"
sudo chmod +x snapd-snap-store.sh || error "failed to mark snapd-snap-store.sh as executable!"
sudo chmod +x SSR.sh || error "failed to mark SSR.sh as executable!"
cd ..
sudo chmod +x other.sh || error "failed to mark other.sh as executable!"
sudo chmod +x uninstall.sh || error "failed to mark uninstall.sh as executable!"
sudo chmod +x updater.sh || error "failed to mark updater.sh as executable!"
sudo chmod +x apt-tools.sh || error "failed to mark apt-tools.sh as executable!"

cd ~/Desktop || error "Failed to change to /home/pi/desktop/!"
sudo chmod +x system-tools.desktop || error "failed to mark desktop shortcut as executable!"



