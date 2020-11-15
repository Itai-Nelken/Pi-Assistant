#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

#install dependencies for box86
sudo apt install cmake || error "failed to install cmake! are you connected to the internet?"

cd ~
git clone https://github.com/ptitSeb/box86 || error "failed to download repo!"
cd box86 || error "failed to enter directory!"
mkdir build; cd build
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo || error "cmake failed!"
make -j24 || error "make failed!"
sudo make install || error "sudo make install failed!"
sudo systemctl restart systemd-binfmt
