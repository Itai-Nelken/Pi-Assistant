#!/bin/bash

echo updating...
sleep 1
git reset --hard
git pull
sudo chmod +x system-tools-v1.1.1.sh
echo finished...
sleep 2