#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "$(tput setaf 3)updating...$(tput sgr 0)"
sleep 1
git reset --hard
git pull
sudo chmod +x system-tools-v1.1.1.sh
sudo chmod +x updater.sh
cd ~/system-tools/
sudo chmod +x install2.sh
./install2.sh
echo "$(tput setaf 3)finished...$(tput sgr 0)"
sleep 1
