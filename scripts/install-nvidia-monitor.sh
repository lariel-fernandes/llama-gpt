#!/bin/bash

sudo apt-key del 7fa2af80

distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')

wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb

sudo dpkg -i cuda-keyring_1.0-1_all.deb

sudo apt-get update

sudo apt-get install -y datacenter-gpu-manager

sudo service nvidia-dcgm start

sudo service nvidia-dcgm status

dcgmi discovery --list
