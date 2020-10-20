#!/bin/bash

#create desktop shortcut
cp ~/system-tools/system-tools.desktop ~/Desktop || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
cd ~ && cd Desktop || echo "$(tput setaf 1)error occured! $(tput sgr 0)"
sudo chmod +x system-tools.desktop || echo "$(tput setaf 1)error occured! $(tput sgr 0)"




