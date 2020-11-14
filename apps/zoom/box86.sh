#!/bin/bash

cd ~
git clone https://github.com/ptitSeb/box86 || error "failed to download repo!"
cd box86 || error "failed to enter directory!"
mkdir build; cd build
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo || error "cmake failed!"
make -j24 || error "make failed!"
sudo make install || error "sudo make install failed!"
sudo systemctl restart systemd-binfmt
