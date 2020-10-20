#!/bin/bash

#create desktop shortcut
cd ~ && cd Desktop || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sudo chmod +x system-tools.desktop || echo "$(tput setaf 1)error occured! $(tput sgr 0)"




