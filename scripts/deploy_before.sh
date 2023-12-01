#!/bin/bash

if [ -d /home/dp-user/build ]; then
    sudo rm -rf /home/dp-user/build/
fi
sudo mkdir -vp /home/dp-user/build/