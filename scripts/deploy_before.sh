#!/bin/bash

if [ -d /home/dp_user/build ]; then
    sudo rm -rf /home/dp_user/build/
fi
sudo mkdir -vp /home/dp_user/build/