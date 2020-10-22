#!/bin/bash

#go to zoom directory (~/zoom)
cd ~/zoom

echo "$(tput setaf 3)close this window to exit zoom$(tput sgr 0)"
sleep 3
echo "$(tput setaf 2)starting zoom...$(tput sgr 0)"
#start zoom with box86
box86 zoom || error "can't start zoom! are box86 and/or zoom installed?"
echo "$(tput setaf 2)exiting in 5 seconds:($(tput sgr 0)"
sleep 5