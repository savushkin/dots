#!/bin/bash

[ "$(id -u)" != "0" ] && exec sudo "$0" "$@"

add-apt-repository -y ppa:graphics-drivers/ppa
apt install -y nvidia-driver-440