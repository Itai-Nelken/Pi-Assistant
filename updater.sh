#!/bin/bash

echo "$(tput setaf 3)updating...$(tput sgr 0)"
sleep 1
git reset --hard
git pull
sudo chmod +x system-tools-v1.1.1.sh
sudo chmod +x updater.sh
echo "$(tput setaf 3)finished...$(tput sgr 0)"
sleep 1